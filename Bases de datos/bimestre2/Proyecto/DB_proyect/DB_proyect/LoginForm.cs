namespace DB_proyect
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            String username = username_txt.Text;
            String password = password_txt.Text;

            if (username == "admin" && password == "admin")
            {
                // Si las credenciales son correctas, abrir la ventana principal
                MainForm mainForm = new MainForm();
                mainForm.Show(); // Mostrar la ventana principal
                this.Hide(); // Ocultar la ventana de inicio de sesi�n
            }
            else
            {
                // Mostrar un mensaje de error si las credenciales no son v�lidas
                MessageBox.Show("Nombre de usuario o contrase�a incorrectos", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void email_txt_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
