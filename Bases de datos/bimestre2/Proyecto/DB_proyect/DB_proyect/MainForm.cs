using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using static System.ComponentModel.Design.ObjectSelectorEditor;

namespace DB_proyect
{
    public partial class MainForm : Form
    {
        private string connectionString = "Data Source=localhost\\MSSQLSERVER03;Initial Catalog=db_reservas_coches;Integrated Security=True";
        public MainForm()
        {
            InitializeComponent();
            // Configurar el DataGridView para ajustar el tamaño de las columnas
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;


            // Establecer la conexión a la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    label1.Text = "Bienvenido - Estás conectado";
                    // Aquí puedes realizar otras acciones como cargar datos en controles del formulario
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error al conectar a la base de datos: {ex.Message}");
                }
            }
        }

        // Este es el evento Load del formulario
        private void MainForm_Load(object sender, EventArgs e)
        {
            // Establecer la conexión a la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    MessageBox.Show("Conexión exitosa a la base de datos.");
                    label1.Text = "Bienvenido - Estás conectado";
                    // Aquí puedes realizar otras acciones como cargar datos en controles del formulario
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error al conectar a la base de datos: {ex.Message}");
                }
            }
        }

        private void comboBox_table_selected_SelectedIndexChanged(object sender, EventArgs e)
        {
            string table = comboBox_table_selected.Text;
            string query = "";
            if (table == "Clientes")
            {
                query = "SELECT c1.nombre_completo AS 'Nombre completo', c1.dni AS DNI, c1.direccion AS Dirección, c1.telefono AS 'Número de telefono', c2.nombre_completo AS Avalador, c2.dni AS 'DNI del Avalador' FROM clientes c1 LEFT JOIN clientes c2 ON c1.avalador = c2.id_cliente;";
            }
            if (table == "Reservas")
            {
                query = "SELECT reservas.id_reserva AS ID, clientes.nombre_completo AS 'Nombre del cliente', clientes.dni AS DNI, reservas.fecha_inicio AS 'Fecha inicio', reservas.fecha_final AS 'Fecha de fin', reservas.costo_total AS 'Costo total', agencias.nombre_agencia AS Agencia FROM reservas INNER JOIN clientes ON reservas.id_cliente = clientes.id_cliente INNER JOIN agencias ON reservas.id_agencia = agencias.id_agencia;";
            }
            if (table == "Agencias")
            {
                query = "SELECT agencias.nombre_agencia AS 'Nombre de la Agencia', agencias.direccion AS Dirección FROM agencias;";
            }
            if (table == "Coches")
            {
                query = "SELECT coches.id_coche AS ID, coches.garaje AS Garaje, coches.matricula AS Matricula, coches.modelo AS Modelo, coches.color AS Color, coches.marca AS Marca, coches.entregado FROM coches;";
            }
            DataTable query_table = query_sql(query);
            // Asigna los datos al DataGridView
            dataGridView1.DataSource = query_table;
        }

        private DataTable query_sql(string query)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    return dataTable;
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error al cargar los datos: {ex.Message}");
                    return null;
                }
            }
        }

        public void delete_query(string query, string message)
        {
            try
            {
                query_sql(query);
                MessageBox.Show($"{message} eliminada con éxito");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al eliminar los datos: {ex.Message}");
            }
        }

        public void update_query(string query, string message)
        {
            try
            {
                query_sql(query);
                MessageBox.Show($"{message} actualizada con éxito");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al actualizar los datos: {ex.Message}");
            }
        }

        public void insert_query(string query, string message)
        {
            try
            {
                query_sql(query);
                MessageBox.Show($"{message} creada con éxito");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al crear los datos: {ex.Message}");
            }
        }

        private void delete_clientes_Click(object sender, EventArgs e)
        {
            string cliente_dni = delete_dni_cliente.Text;
            string cliente_name = delete_name_cliente.Text;

            string query = $"DELETE FROM clientes WHERE dni = {cliente_dni} AND nombre_completo = '{cliente_name}';";
            delete_query(query, "Cliente");
            delete_name_cliente.Text = "";
            delete_dni_cliente.Text = "";
        }

        private void button_delete_agencia_Click(object sender, EventArgs e)
        {
            string agencia_name = delete_agencia_name.Text;

            string query = $"DELETE FROM agencias WHERE nombre_agencia = '{agencia_name}';";
            delete_query(query, "Agencia");
        }

        private void button_delete_coche_Click(object sender, EventArgs e)
        {
            string matricula_coche = delete_coche_matricula.Text;

            string query = $"DELETE FROM coches WHERE matricula = '{matricula_coche}';";
            delete_query(query, "Registro del Coche");
            delete_coche_matricula.Text = "";
        }

        private void insert_agencia_Click(object sender, EventArgs e)
        {
            string agencia_name = insert_agencia_name.Text;
            string agencia_address = insert_agencia_address.Text;

            string query = $"INSERT INTO agencias (nombre_agencia, direccion) VALUES ('{agencia_name}','{agencia_address}')";
            insert_query(query, "Agencia");
            insert_agencia_name.Text = "";
            insert_agencia_address.Text = "";
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            string matricula = insert_coches_matricula.Text;
            string garaje = insert_coches_garaje.Text;
            string modelo = insert_coches_modelo.Text;
            string color = insert_coches_color.Text;
            string marca = insert_coches_marca.Text;

            string query = $"INSERT INTO coches (garaje, matricula, modelo, color, marca, entregado) VALUES ('{garaje}','{matricula}','{modelo}','{color}','{marca}','{1}')";
            insert_query(query, "Coche");
            insert_coches_matricula.Text = "";
            insert_coches_garaje.Text = "";
            insert_coches_modelo.Text = "";
            insert_coches_color.Text = "";
            insert_coches_marca.Text = "";
        }

        private void button_insert_cliente_Click(object sender, EventArgs e)
        {
            string dni = insert_cliente_dni.Text;
            string name = insert_cliente_name.Text;
            string address = insert_cliente_address.Text;
            float phone = float.Parse(insert_cliente_phone.Text);
            string avalador_dni = insert_cliente_avalador.Text;

            string query = $"INSERT INTO clientes (dni, nombre_completo, direccion, telefono, avalado, avalador) VALUES ('{dni}','{name}','{address}','{phone}','{1}',(SELECT id_cliente FROM clientes WHERE dni = '{avalador_dni}'))";
            insert_query(query, "Cliente");

            insert_cliente_dni.Text = "";
            insert_cliente_name.Text = "";
            insert_cliente_address.Text = "";
            insert_cliente_phone.Text = "";
            insert_cliente_avalador.Text = "";
        }

        private void button_insert_reserva_Click(object sender, EventArgs e)
        {
            string dni_client = insert_reserva_dni_client.Text;
            string begin_date = insert_reserva_begin_date.Text;
            string final_date = insert_reserva_final_date.Text;
            string cost = insert_reserva_costo.Text;
            string agencia_name = insert_reserva_agencia_name.Text;

            string query = $@"
                INSERT INTO reservas (id_cliente, fecha_inicio, fecha_final, costo_total, id_agencia)
                VALUES (
                    (SELECT id_cliente FROM clientes WHERE dni = '{dni_client}'),
                    '{begin_date}',
                    '{final_date}',
                    '{cost}',
                    (SELECT id_agencia FROM agencias WHERE nombre_agencia = '{agencia_name}')
                );
            ";
            insert_query(query, "Reserva");

            insert_reserva_dni_client.Text = "";
            insert_reserva_begin_date.Text = "";
            insert_reserva_final_date.Text = "";
            insert_reserva_costo.Text = "";
            insert_reserva_agencia_name.Text = "";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string dni_client = delete_reserva_dni_cliente.Text;
            string begin_date = delete_reserva_begin_date.Text;
            string agencia_name = delete_reserva_agencia_name.Text;

            string query = $@"
                DELETE FROM reservas 
                    WHERE
                    id_cliente = (SELECT id_cliente FROM clientes WHERE dni = '{dni_client}') AND
                    fecha_inicio = '{begin_date}'AND
                    id_agencia = (SELECT id_agencia FROM agencias WHERE nombre_agencia = '{agencia_name}')
                ;
            ";
            delete_query(query, "Reserva");
            delete_reserva_dni_cliente.Text = "";
            delete_reserva_begin_date.Text = "";
            delete_reserva_agencia_name.Text = "";
        }

        private void button_update_agencia_Click(object sender, EventArgs e)
        {
            string agencia_old_name = update_agencias_old_name.Text;
            string agencia_new_name = update_agencias_new_name.Text;
            string agencia_new_address = update_agencias_new_address.Text;

            string query = $@"
                UPDATE agencias
                SET nombre_agencia = '{agencia_new_name}', direccion = '{agencia_new_address}'
                WHERE nombre_agencia = '{agencia_old_name}';
            ";
            update_query(query, "Agencia");
            update_agencias_old_name.Text = "";
            update_agencias_new_name.Text = "";
            update_agencias_new_address.Text = "";
        }

        private void button_update_client_Click(object sender, EventArgs e)
        {
            string dni = update_client_dni.Text;
            string name = update_client_new_name.Text;
            string address = update_client_new_address.Text;
            float phone = float.Parse(update_client_new_phone.Text);
            string avalador_dni = update_client_new_dni_avalador.Text;

            string query = $@"
                UPDATE clientes
                SET 
                    nombre_completo = '{name}', 
                    direccion = '{address}', 
                    telefono = {phone},
                    avalador = (SELECT id_cliente FROM clientes WHERE dni = '{avalador_dni}')
                WHERE dni = '{dni}';
            ";
            update_query(query, "Cliente");

            update_client_dni.Text = "";
            update_client_new_name.Text = "";
            update_client_new_address.Text = "";
            update_client_new_phone.Text = "";
            update_client_new_dni_avalador.Text = "";
        }

        private void button_update_car_Click(object sender, EventArgs e)
        {
            string id_coche = update_car_id.Text;
            string garaje = update_car_new_garage.Text;
            string matricula = update_car_new_matricula.Text;
            string model = update_car_new_model.Text;
            string color = update_car_new_color.Text;
            string marca = update_car_new_marca.Text;

            string query = $@"
                UPDATE coches
                SET 
                    garaje = '{garaje}',
                    matricula = '{matricula}',
                    modelo = '{model}',
                    color = '{color}',
                    marca = '{marca}'
                WHERE id_coche = {id_coche};
            ";
            update_query(query, "Cliente");
            update_car_id.Text = "";
            update_car_new_garage.Text = "";
            update_car_new_matricula.Text = "";
            update_car_new_model.Text = "";
            update_car_new_color.Text = "";
            update_car_new_marca.Text = "";
        }

        private void button_update_reservas_Click(object sender, EventArgs e)
        {
            string id_reserva   = update_reservas_id.Text;
            string dni_client   = update_reservas_new_dni_client.Text;
            string begin_date   = update_reservas_new_begin_date.Text;
            string final_date   = update_reservas_new_end_date.Text;
            string cost         = update_reservas_new_cost.Text;
            string agencia_name = update_reservas_new_agencia_name.Text;

            string query = $@"
                UPDATE reservas
                SET 
                    id_cliente = (SELECT id_cliente FROM clientes WHERE dni = '{dni_client}'),
                    fecha_inicio = '{begin_date}',
                    fecha_final  = '{final_date}',
                    costo_total  = '{cost}',
                    id_agencia   = (SELECT id_agencia FROM agencias WHERE nombre_agencia = '{agencia_name}')
                WHERE id_reserva = {id_reserva};
            ";
            update_query(query, "Reserva");

            update_reservas_id.Text = "";
            update_reservas_new_dni_client.Text = "";
            update_reservas_new_begin_date.Text = "";
            update_reservas_new_end_date.Text = "";
            update_reservas_new_cost.Text = "";
            update_reservas_new_agencia_name.Text = "";
        }
    }
}
