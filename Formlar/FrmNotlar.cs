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
    public partial class FrmNotlar : Form
    {
        public FrmNotlar()
        {
            InitializeComponent();
        }
        OgrenciSinavEntities db = new OgrenciSinavEntities();
        private void FrmNotlar_Load(object sender, EventArgs e)
        {
            comboBox1.ValueMember = "Dersid";
            comboBox1.DisplayMember = "DersAd";
            comboBox1.DataSource = db.TblDersler.ToList();

            comboBox2.ValueMember = "Dersid";
            comboBox2.DisplayMember = "DersAd";
            comboBox2.DataSource = db.TblDersler.ToList();
         
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            TblNotlar t = new TblNotlar();
            t.Sinav1 = byte.Parse(sinav1txt.Text);
            t.Sinav2 = byte.Parse(sinav2txt.Text);
            t.Sinav3 = byte.Parse(sinav3txt.Text);
            t.Proje = byte.Parse(projetxt.Text);
            t.Quiz1 = byte.Parse(quiz1txt.Text);
            t.Quiz2 = byte.Parse(quiz2txt.Text);
            t.Ders = int.Parse(comboBox1.SelectedValue.ToString());
            t.Ortalama = decimal.Parse(ortalamtxt.Text);
            t.Ogrenci = int.Parse(ogrenciNotxt.Text);
            db.TblNotlar.Add(t);
            db.SaveChanges();
            MessageBox.Show("Öğrenci Not Girişi Yapıldı", "İşlem", MessageBoxButtons.OK, MessageBoxIcon.Information);

        }

        private void hesaplabtn_Click(object sender, EventArgs e)
        {
            byte s1, s2, s3, q1, q2, proje;
            double ortalama;
            s1 = byte.Parse(sinav1txt.Text);
            s2 = byte.Parse(sinav2txt.Text);
            s3 = byte.Parse(sinav3txt.Text);
            q1 = byte.Parse(quiz1txt.Text);
            q2 = byte.Parse(quiz2txt.Text);
            proje = byte.Parse(projetxt.Text);
            ortalama = (s1 + s2 + s3 + q1 + q2 + proje) / 6;
            ortalamtxt.Text = ortalama.ToString();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            
            //dataGridView1.DataSource = db.View_2.ToList();
            dataGridView1.DataSource = db.Notlar3();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            var degerler = from x in db.TblNotlar
                           select new
                           {
                               x.Notid,
                               x.TblDersler.DersAd,
                               Öğrenci_Adı = x.TblOgrenci.OgrAd + " " + x.TblOgrenci.OgrSoyad,
                               x.Sinav1,
                               x.Sinav2,
                               x.Sinav3,
                               x.Quiz1,
                               x.Quiz2,
                               x.Proje,
                               x.Ders,
                               x.Ortalama,
                               x.Ogrenci

                           };

            int d = int.Parse(comboBox2.SelectedValue.ToString());
            dataGridView1.DataSource = degerler.Where(y => y.Ders == d).ToList();
            dataGridView1.Columns["Ders"].Visible = false;
            dataGridView1.Columns["Ogrenci"].Visible = false;
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //datagrid üzerinde tıkladığımız sütun ve satırlardaki verilerin textboxlara yazdırılması için
            txtid.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            sinav1txt.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            sinav2txt.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            sinav3txt.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
            quiz1txt.Text = dataGridView1.Rows[e.RowIndex].Cells[6].Value.ToString();
            quiz2txt.Text = dataGridView1.Rows[e.RowIndex].Cells[7].Value.ToString();
            projetxt.Text = dataGridView1.Rows[e.RowIndex].Cells[8].Value.ToString();
            ortalamtxt.Text = dataGridView1.Rows[e.RowIndex].Cells["Ortalama"].Value.ToString();
            ogrenciNotxt.Text = dataGridView1.Rows[e.RowIndex].Cells["Ogrenci"].Value.ToString();
            //  comboBox1.SelectedValue = dataGridView1.Rows[e.RowIndex].Cells["Ders"].Value.ToString();
        }

        private void btnara3_Click(object sender, EventArgs e)
        {
            string ogrencino = ogrenciNotxt.Text;
            var deger = db.TblOgrenci.Where(x => x.OgrNumara == ogrencino).Select(y => y.Ogrid).FirstOrDefault();
            ogrenciNotxt.Text = deger.ToString();
            var notlar = from x in db.TblNotlar
                         select new
                         {
                             x.Notid,
                             x.TblDersler.DersAd,
                             Öğrenci_Adı = x.TblOgrenci.OgrAd + " " + x.TblOgrenci.OgrSoyad,
                             x.Sinav1,
                             x.Sinav2,
                             x.Sinav3,
                             x.Quiz1,
                             x.Quiz2,
                             x.Proje,
                             x.Ders,
                             x.Ogrenci,
                             x.Ortalama
                         };
            dataGridView1.DataSource = notlar.Where(x => x.Ogrenci == deger).ToList();
            dataGridView1.Columns["Ogrenci"].Visible = false;


        }

        private void btnara2_Click(object sender, EventArgs e)
        {
            var degerler = from x in db.TblNotlar
                           select new
                           {
                               x.Notid,
                               x.TblDersler.DersAd,
                               Öğrenci_Adı = x.TblOgrenci.OgrAd + " " + x.TblOgrenci.OgrSoyad,
                               x.Sinav1,
                               x.Sinav2,
                               x.Sinav3,
                               x.Quiz1,
                               x.Quiz2,
                               x.Proje,
                               x.Ogrenci,
                               x.Ortalama
                           };

            int numara = int.Parse(ogridtxt.Text);
            dataGridView1.DataSource = degerler.Where(y => y.Ogrenci == numara).ToList();
            dataGridView1.Columns["Ogrenci"].Visible = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //bu işlem aslında update yerine direkt olarak mevcut verinin üzerine atama yapmak gibi düşünülebilir.
            int id = int.Parse(txtid.Text); //id değişkeni oluşturduk. Txtid değeri bu değişkene atandı
            var x = db.TblNotlar.Find(id);  //txtid üzerinden gönderilen id değeri ile ilişkili öğrenciyi bul ve x değişkenine ata
            x.Sinav1 = int.Parse(sinav1txt.Text);
            x.Sinav2 = int.Parse(sinav2txt.Text);
            x.Sinav3 = int.Parse(sinav3txt.Text);
            x.Quiz1 = int.Parse(quiz1txt.Text);
            x.Quiz2 = int.Parse(quiz2txt.Text);
            x.Proje = int.Parse(projetxt.Text);
            x.Ortalama = int.Parse(ortalamtxt.Text);
            db.SaveChanges();
            MessageBox.Show("Öğrenci Notları Güncellendi.", "İşlem", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            txtid.Text = "";
            sinav1txt.Text = "";
            sinav2txt.Text = "";
            sinav3txt.Text = "";
            quiz1txt.Text = "";
            quiz2txt.Text = "";
            projetxt.Text = "";
            ortalamtxt.Text = "";
            comboBox1.SelectedValue = "";

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}
