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
    public partial class FrmOgrenciPanel : Form
    {
        public FrmOgrenciPanel()
        {
            InitializeComponent();
        }
       public string numara;
        int Ogrencid;
        OgrenciSinavEntities db = new OgrenciSinavEntities();
        private void FrmOgrenciPanel_Load(object sender, EventArgs e)
        {
            SifreGizle.Visible= false;
            SifreGizle2.Visible= false;
           txtnumara.Text = numara;
            txtad.Text=db.TblOgrenci.Where(x=>x.OgrNumara==numara).Select(y=>y.OgrAd).FirstOrDefault();
            txtsoyad.Text=db.TblOgrenci.Where(x=>x.OgrNumara==numara).Select(y=>y.OgrSoyad).FirstOrDefault();
            txtsifre.Text=db.TblOgrenci.Where(x=>x.OgrNumara==numara).Select(y=>y.OgrSifre).FirstOrDefault();
            txtmail.Text=db.TblOgrenci.Where(x=>x.OgrNumara==numara).Select(y=>y.OgrMail).FirstOrDefault();
            txtbolum.Text= db.TblOgrenci.Where(x => x.OgrNumara == numara).Select(y => y.OgrBolum).FirstOrDefault().ToString();

           Ogrencid =db.TblOgrenci.Where(x=>x.OgrNumara==numara).Select(y=>y.Ogrid).FirstOrDefault();

            var sinavnotlari = (from x in db.TblNotlar
                               select new
                               {
                                   x.TblDersler.DersAd,
                                   x.Sinav1,
                                   x.Sinav2,
                                   x.Sinav3,
                                   x.Quiz1,
                                   x.Quiz2,
                                   x.Proje,
                                   x.Ortalama,
                                   x.Ogrenci
                               }).Where(x=> x.Ogrenci==Ogrencid).ToList();
            dataGridView1.DataSource=sinavnotlari;
            dataGridView1.Columns["Ogrenci"].Visible=false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (txtyenisifre1.Text==txtyenisifre2.Text)
            {
                var deger = db.TblOgrenci.Find(Ogrencid);
                deger.OgrSifre = txtyenisifre1.Text;
                db.SaveChanges();
                MessageBox.Show("Şifre Değiştirme İşlemi Başarılı!", "İşlem Başarılı", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Şifreniz Güncellenemedi,Yeni şifreniz eşleşmiyor.", "İşlem Başarısız", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
           
        }

        private void SifreGoster_Click(object sender, EventArgs e)
        {
            txtyenisifre1.UseSystemPasswordChar = false;
            SifreGoster.Visible = false;
            SifreGizle.Visible = true;
        }

        private void SifreGizle_Click(object sender, EventArgs e)
        {
            txtyenisifre1.UseSystemPasswordChar = true;
            SifreGoster.Visible = true;
            SifreGizle.Visible = false;
        }

        private void SifreGoster2_Click(object sender, EventArgs e)
        {
            txtyenisifre2.UseSystemPasswordChar= false;
            SifreGoster2.Visible = false;
            SifreGizle2.Visible = true;
        }

        private void SifreGizle2_Click(object sender, EventArgs e)
        {
            txtyenisifre2.UseSystemPasswordChar= true;
            SifreGoster2.Visible = true;
            SifreGizle2.Visible=false;
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
