using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using Proje_Ogrenci_Akademisyen.Entity;

namespace Proje_Ogrenci_Akademisyen.Formlar
{
    public partial class FrmOgrenciKayit : Form
    {
        public FrmOgrenciKayit()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection(@"Data Source=SAMIEL;Initial Catalog=OgrenciSinav;Integrated Security=True;Encrypt=False");
       OgrenciSinavEntities db = new OgrenciSinavEntities();
        private void FrmOgrenciKayit_Load(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("Select * from TblBolum",baglanti);
            //SqlDataReader dr = komut.ExecuteReader();
            SqlDataAdapter da = new SqlDataAdapter(komut);
           DataTable dt = new DataTable();
            da.Fill(dt);
            comboBox1.ValueMember = "Bolumid";
            comboBox1.DisplayMember = "BolumAd";
            comboBox1.DataSource = dt;

        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {
          if (textBox4.Text == textBox5.Text) //şifreler uyuşuyorsa
            {
                TblOgrenci t = new TblOgrenci();
                t.OgrAd = textBox1.Text;
                t.OgrSoyad = textBox2.Text;
                t.OgrNumara = textBox3.Text;
                t.OgrSifre = textBox4.Text;
                t.OgrMail = textBox6.Text;
                t.OgrBolum = int.Parse(comboBox1.SelectedValue.ToString());
                t.OgrResim = textBox7.Text;
                db.TblOgrenci.Add(t);
                db.SaveChanges();
                MessageBox.Show("Öğrenci Bilgileri Sisteme Başarılı Bir Şekilde Kaydedildi", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
           else
            {
                MessageBox.Show("Şifreler Uyuşmadı", "Uyarı", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }

        }

        private void button3_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            textBox7.Text = openFileDialog1.FileName;

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}
