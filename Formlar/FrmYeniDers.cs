using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Proje_Ogrenci_Akademisyen.Entity;

namespace Proje_Ogrenci_Akademisyen.Formlar
{
    public partial class FrmYeniDers : Form
    {
        public FrmYeniDers()
        {
            InitializeComponent();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
        OgrenciSinavEntities db = new OgrenciSinavEntities();
        private void btnKaydet_Click(object sender, EventArgs e)
        {
            if (txtdersad.Text == "")
            {
                errorProvider1.SetError(txtdersad, "Ders Adı Boş Geçilemez");
            }
            else
            {
            TblDersler t = new TblDersler();
                t.DersAd = txtdersad.Text;
                db.TblDersler.Add(t);
                db.SaveChanges();
                MessageBox.Show("Ders Ekleme İşlemi Başarıyla Yapıldı", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
    }
}
