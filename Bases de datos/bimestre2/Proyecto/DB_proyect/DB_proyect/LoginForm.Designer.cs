namespace DB_proyect
{
    partial class LoginForm
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            label_title = new Label();
            button1 = new Button();
            label_username = new Label();
            label_password = new Label();
            username_txt = new TextBox();
            password_txt = new TextBox();
            SuspendLayout();
            // 
            // label_title
            // 
            label_title.AutoSize = true;
            label_title.Font = new Font("Segoe UI", 19.8000011F, FontStyle.Regular, GraphicsUnit.Point, 0);
            label_title.Location = new Point(224, 38);
            label_title.Name = "label_title";
            label_title.Size = new Size(555, 46);
            label_title.TabIndex = 0;
            label_title.Text = "Administrador de reservas de coche";
            label_title.TextAlign = ContentAlignment.MiddleCenter;
            label_title.Click += label1_Click;
            // 
            // button1
            // 
            button1.BackColor = SystemColors.AppWorkspace;
            button1.Font = new Font("Segoe UI", 13.8F, FontStyle.Bold, GraphicsUnit.Point, 0);
            button1.Location = new Point(402, 406);
            button1.Name = "button1";
            button1.Size = new Size(166, 45);
            button1.TabIndex = 1;
            button1.Text = "Iniciar sesión";
            button1.UseVisualStyleBackColor = false;
            button1.Click += button1_Click;
            // 
            // label_username
            // 
            label_username.AutoSize = true;
            label_username.Font = new Font("Segoe UI", 12F);
            label_username.Location = new Point(241, 162);
            label_username.Name = "label_username";
            label_username.Size = new Size(181, 28);
            label_username.TabIndex = 2;
            label_username.Text = "Nombre de usuario";
            label_username.Click += label2_Click;
            // 
            // label_password
            // 
            label_password.AutoSize = true;
            label_password.Font = new Font("Segoe UI", 12F);
            label_password.Location = new Point(312, 233);
            label_password.Name = "label_password";
            label_password.Size = new Size(110, 28);
            label_password.TabIndex = 3;
            label_password.Text = "Contraseña";
            label_password.Click += label3_Click;
            // 
            // username_txt
            // 
            username_txt.Cursor = Cursors.IBeam;
            username_txt.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            username_txt.Location = new Point(472, 162);
            username_txt.Name = "username_txt";
            username_txt.Size = new Size(226, 34);
            username_txt.TabIndex = 4;
            // 
            // password_txt
            // 
            password_txt.Cursor = Cursors.IBeam;
            password_txt.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            password_txt.Location = new Point(472, 230);
            password_txt.MaxLength = 20;
            password_txt.Name = "password_txt";
            password_txt.PasswordChar = '*';
            password_txt.Size = new Size(226, 34);
            password_txt.TabIndex = 5;
            // 
            // LoginForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = SystemColors.Control;
            ClientSize = new Size(1002, 553);
            Controls.Add(password_txt);
            Controls.Add(username_txt);
            Controls.Add(label_password);
            Controls.Add(label_username);
            Controls.Add(button1);
            Controls.Add(label_title);
            Name = "LoginForm";
            Text = "Administrador de reservas de coches";
            Load += Form1_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label_title;
        private Button button1;
        private Label label_username;
        private Label label_password;
        private TextBox username_txt;
        private TextBox password_txt;
    }
}
