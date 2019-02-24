using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Encriptamiento
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string password = "123456";
            using (var deriveBytes = new Rfc2898DeriveBytes(password,20))
            {
                byte[] salt = deriveBytes.Salt;
                byte[] key = deriveBytes.GetBytes(20);

                //Estos dos datos guardar en base de datos
                string encodeSalt = Convert.ToBase64String(salt);
                string encodeKey = Convert.ToBase64String(key);
            }

            //Database
            string encodeSaltDB = "fBbQ+KL9ciUpGRUqtqd3cSDFZLA=";
            string encodeKeyDB = "XBdH/zcCbifvfem0nRLfMwX1s04=";           

            byte[] saltDB = Convert.FromBase64String(encodeSaltDB);
            byte[] keyDB = Convert.FromBase64String(encodeKeyDB);

            string passwordLogin = "123456";

            using (var deriveBytes = new Rfc2898DeriveBytes(passwordLogin, saltDB))
            {
                byte[] testkey = deriveBytes.GetBytes(20);
                if (testkey.SequenceEqual(keyDB))
                {
                    MessageBox.Show("Password Valido");
                }
            }
        }
    }
}
