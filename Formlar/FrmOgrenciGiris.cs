using Proje_Ogrenci_Akademisyen.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Proje_Ogrenci_Akademisyen.Formlar
{
    public partial class FrmOgrenciGiris : Form
    {
        public FrmOgrenciGiris()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection(@"Data Source=SAMIEL;Initial Catalog=OgrenciSinav;Integrated Security=True;Encrypt=False");
        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
           MessageBox.Show("Şifrenizi sıfırlamak için Öğrenci İşleri ile görüşünüz","Uyarı",MessageBoxButtons.OK,MessageBoxIcon.Warning);
        }

        private void btngiris_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("Select * from TblOgrenci where OgrNumara=@p1 and OgrSifre=@p2",baglanti);
            komut.Parameters.AddWithValue("@p1", txtnumara.Text);
            komut.Parameters.AddWithValue("@p2",txtsifre.Text);
            SqlDataReader dr = komut.ExecuteReader();
            if (dr.Read())
            {
                FrmOgrenciPanel frm = new FrmOgrenciPanel();
                frm.numara= txtnumara.Text;
                frm.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Okul numaranız veya şifreniz hatalı! Lütfen tekrar deneyiniz.", "Bilgiler Yanlış", MessageBoxButtons.OK, MessageBoxIcon.Error);
               
            }
            baglanti.Close();
        }
    }
}
