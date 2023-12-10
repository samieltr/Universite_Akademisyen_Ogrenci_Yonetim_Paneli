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
using Proje_Ogrenci_Akademisyen.Entity;

namespace Proje_Ogrenci_Akademisyen.Formlar
{
    public partial class FrmOgrenci : Form
    {
        public FrmOgrenci()
        {
            InitializeComponent();
        }
        OgrenciSinavEntities db = new OgrenciSinavEntities();
        void Listele() //Form açıldığında otomatik olarak datagrid doldurulsun.
        {
            var degerler = from x in db.TblOgrenci
                           select new
                           {
                               x.Ogrid,
                               x.OgrAd,
                               x.OgrSoyad,
                               x.OgrNumara,
                               x.OgrSifre,
                               x.OgrMail,
                               x.OgrResim,
                               x.OgrBolum,
                               x.TblBolum.BolumAd,
                               x.OgrDurum
                           };
            dataGridView1.DataSource = degerler.Where(x=>x.OgrDurum==true).ToList(); //x değişkeni öyleki x.Öğrenci durum sütunu true olanlar listelensin 
            groupBox3.Visible = false;
        }
      
        SqlConnection baglanti = new SqlConnection(@"Data Source=SAMIEL;Initial Catalog=OgrenciSinav;Integrated Security=True;Encrypt=False");
        private void FrmOgrenci_Load(object sender, EventArgs e)
        {
            Listele();
            dataGridView1.Columns["OgrBolum"].Visible = false; //ilişkili sütunları datagrid üzerinde göstermemek için görünürlüklerini kapatıyoruz
            dataGridView1.Columns["OgrDurum"].Visible = false;
            // Combobox içeriğini doldurmak için yaptıklarımız
            baglanti.Open();
            SqlCommand komut = new SqlCommand("Select * from TblBolum", baglanti);
            //SqlDataReader dr = komut.ExecuteReader();
            SqlDataAdapter da = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            da.Fill(dt);
            comboBox1.ValueMember = "Bolumid";
            comboBox1.DisplayMember = "BolumAd";
            comboBox1.DataSource = dt;
            // bitti

            groupBox3.Visible=false;

        }

        private void button4_Click(object sender, EventArgs e)
        {
            //listele butonu
            Listele();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //datagrid üzerinde tıkladığımız sütun ve satırlardaki verilerin textboxlara yazdırılması için
            txtid.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtad.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtsoyad.Text= dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtnumara.Text= dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            txtsifre.Text= dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            txtmail.Text= dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
            txtresim.Text= dataGridView1.Rows[e.RowIndex].Cells[6].Value.ToString();
            comboBox1.SelectedValue = dataGridView1.Rows[e.RowIndex].Cells[7].Value.ToString();

        }

        private void silbtn_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtid.Text); //id değişkeni oluşturduk. Txtid değeri bu değişkene atandı
            var x = db.TblOgrenci.Find(id); //txtid üzerinden gönderilen id değeri ile ilişkili öğrenciyi bul ve x değişkenine ata
            x.OgrDurum = false; //öğrenci durum sütunu false yapıldı artık listelenmicek.
            db.SaveChanges();
            MessageBox.Show("İlgili Öğrenci başarılı bir şekilde sistemden silindi , silinen öğrencilere pasif öğrenciler listesi üzerinden erişim sağlayabilirsiniz.","İşlem",MessageBoxButtons.OK,MessageBoxIcon.Information);
            Listele(); // işlem tamamlandıktan sonra datagrid tekrar listeleniyor.
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //bu işlem aslında update yerine direkt olarak mevcut verinin üzerine atama yapmak gibi düşünülebilir.
            int id = int.Parse(txtid.Text); //id değişkeni oluşturduk. Txtid değeri bu değişkene atandı
            var x = db.TblOgrenci.Find(id);  //txtid üzerinden gönderilen id değeri ile ilişkili öğrenciyi bul ve x değişkenine ata
            x.OgrAd = txtad.Text; 
            x.OgrSoyad = txtsoyad.Text;
            x.OgrNumara = txtnumara.Text;
            x.OgrSifre = txtsifre.Text;
            x.OgrMail = txtmail.Text;
            x.OgrResim = txtresim.Text;
            x.OgrBolum = int.Parse(comboBox1.SelectedValue.ToString());
            db.SaveChanges();
            MessageBox.Show("İlgili öğrencinin bilgileri güncellendi.", "İşlem", MessageBoxButtons.OK, MessageBoxIcon.Information);
            Listele();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //openfiledialog ile seçili belgenin uzantısını textboxa yazdırıyoruz.
            openFileDialog1.ShowDialog();
            txtresim.Text = openFileDialog1.FileName;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            groupBox3.Visible = true;
            var degerler2 = from x in db.TblOgrenci
                           select new
                           {
                               x.Ogrid,
                               x.OgrAd,
                               x.OgrSoyad,
                               x.OgrNumara,
                               x.OgrSifre,
                               x.OgrMail,
                               x.OgrResim,
                               x.OgrBolum,
                               x.TblBolum.BolumAd,
                               x.OgrDurum
                           };
            dataGridView1.DataSource = degerler2.Where(x => x.OgrDurum == false).ToList(); //x değişkeni öyleki x.Öğrenci durum sütunu false olanlar listelensin 

           


        }

        private void button5_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtid.Text);
            var x = db.TblOgrenci.Find(id);
            x.OgrDurum = true;
            db.SaveChanges();
            MessageBox.Show("İlgili Öğrenci tekrar aktif hale getirildi");
            Listele();
            groupBox3.Visible = false;
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}
