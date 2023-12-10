using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Proje_Ogrenci_Akademisyen.Formlar
{
    public partial class FrmHarita : Form
    {
        public FrmHarita()
        {
            InitializeComponent();
        }

        private void panel7_Paint(object sender, PaintEventArgs e)
        {

        }

        private void PnlDersList_Click(object sender, EventArgs e)
        {
            FrmDersListesi frmders = new FrmDersListesi();
            frmders.Show();

        }

   

        private void BolumListesiPnl_Click(object sender, EventArgs e)
        {
            FrmBolumListesi frmbolum = new FrmBolumListesi();
            frmbolum.Show();
        }

        private void YeniBolumPnl_Click(object sender, EventArgs e)
        {
            FrmBolumler bolumler = new FrmBolumler();
            bolumler.Show();
        }

        private void NotFormPnl_Click(object sender, EventArgs e)
        {
            FrmNotlar frmNot = new FrmNotlar();
            frmNot.Show();
        }

        private void OgrenciFormPnl_Click(object sender, EventArgs e)
        {
            FrmOgrenci ogrpnl = new FrmOgrenci();
            ogrpnl.Show();
        }

        private void OgrKayitPnl_Click(object sender, EventArgs e)
        {
            FrmOgrenciKayit ogrkayit = new FrmOgrenciKayit();
            ogrkayit.Show();
        }

        private void panel7_Click(object sender, EventArgs e)
        {
            FrmYeniDers dersekle = new FrmYeniDers();
            dersekle.Show();
        }

        private void YardimPnl_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Bu proje github.com/samieltr , www.sameterten.com.tr tarafından hazırlanmıştır. Bu proje alınan tüm eğitimleri test etmek amacıyla veritabanlı bir proje olarak yapılmıştır.Tüm bilgiler veritabanından çekilmektedir.Proje ile ilgili destek güncelleme veya bilgilendirme için www.sameterten.com.tr adresinden ulaşabilirsiniz.","Yardım Penceresi",MessageBoxButtons.OK,MessageBoxIcon.Warning);
        }

        private void panel9_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
