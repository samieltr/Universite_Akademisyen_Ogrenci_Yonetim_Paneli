﻿using System;
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
    public partial class FrmAkademisyenGiris : Form
    {
        public FrmAkademisyenGiris()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection(@"Data Source=SAMIEL;Initial Catalog=OgrenciSinav;Integrated Security=True;Encrypt=False");
        private void btngiris_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("Select * from TblAkademisyen where AkademisyenNumara=@p1 and AkademisyenSifre=@p2",baglanti);
            komut.Parameters.AddWithValue("@p1", txtnumara.Text);
            komut.Parameters.AddWithValue("@p2", txtsifre.Text);
            SqlDataReader dr = komut.ExecuteReader();
            if (dr.Read())
            {
                FrmHarita frmHarita = new FrmHarita();
                frmHarita.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Şifreniz ve A.numaranız eşleşmedi. Tekrar Deneyiniz", "Giriş Başarısız", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
            baglanti.Close();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            MessageBox.Show("Şifrenizi sıfırlamak için idare ile görüşünüz", "Uyarı", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }
    }
}
