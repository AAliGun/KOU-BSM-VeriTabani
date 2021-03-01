using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Dosya_Kullanim_Odevi
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private static string dosyaAdi = "ogrenciler.dat";

        private string[] ogrenciData = new string[8];
        //private string adstr, soyadstr, ogrnostr, bolumstr, cinsiyetstr, dogumyeristr, yasstr, telnostr;
        private List<string> ogrencilerData = new List<string>();
        int index = -1;
        private void Form1_Load(object sender, EventArgs e)
        {
          
        }
        
        /// <summary>
        /// bu fonskiyon forumdaki textbox ve comboboxları temizliyor
        /// </summary>
        private void formtemizle()
        {
            adTextBox.Clear();
            soyadTextBox.Clear();
            ogrnoTextBox.Clear();
            bolumTextBox.Clear();
            cinsiyetComboBox.SelectedIndex = 0;
            dogumyeriTextBox.Clear();
            yasTextBox.Clear();
            telnoTextBox.Clear();
        }
        /// <summary>
        /// forumdaki öğeleri stringe çeker.
        /// her butondan sonra çağır.
        /// </summary>
        private void form2kod()
        {
            ogrenciData[0] = adTextBox.Text;
            ogrenciData[1] = soyadTextBox.Text;
            ogrenciData[2] = ogrnoTextBox.Text;
            ogrenciData[3] = bolumTextBox.Text;
            ogrenciData[4] = cinsiyetComboBox.Text;
            ogrenciData[5] = dogumyeriTextBox.Text;
            ogrenciData[6] = yasTextBox.Text;
            ogrenciData[7] = telnoTextBox.Text;
        }
        private void kod2form()
        {
            string[] data = ogrencilerData[index].Split(';');
            if (data.Length < 8) return;
            adTextBox.Text = data[0];
            soyadTextBox.Text = data[1];
            ogrnoTextBox.Text = data[2];
            bolumTextBox.Text = data[3];
            cinsiyetComboBox.SelectedItem = data[4];
            dogumyeriTextBox.Text = data[5];
            yasTextBox.Text = data[6];
            telnoTextBox.Text = data[7];
        }

        

        /// <summary>
        /// string ifadeleri kayıt edecek şekilde birleştirir
        /// </summary>
        /// <returns>adstr + ";" + soyadstr + ";" + ogrnostr + ";" + bolumstr + ";" + cinsiyetstr + ";" + dogumyeristr + ";" + yasstr + ";" + telnostr</returns>
        private string string2dat()
        {
            return ogrenciData[0] + ";" + ogrenciData[1] + ";" + ogrenciData[2] + ";" + ogrenciData[3] + ";" + ogrenciData[4] + ";" + ogrenciData[5] + ";" + ogrenciData[6] + ";" + ogrenciData[7];
        }
        /// <summary>
        /// dosyayı okuyarak her bir satırı stiring dizisinin bir elemanı olarak kayıt eder.
        /// </summary>
        private void dat2stringarray()
        {
            ogrencilerData.Clear();
            StreamReader sr = new StreamReader(dosyaAdi);
            string satir;
            while (true)
            {
                satir = sr.ReadLine();
                if (satir == null)
                {
                    break;
                }
                ogrencilerData.Add(satir);
            }
            
            
            ogrencilerData.Add(sr.ReadToEnd());
            sr.Close();
        }
        private void yazdir(List<string> data)
        {
            dataGridView.Rows.Clear();
            foreach (string item in data)
            {
                dataGridView.Rows.Add(item.Split(';'));
            }
        }
        private void kayitleriListeleButton_Click(object sender, EventArgs e)
        {
            dat2stringarray();
            yazdir(ogrencilerData);
        }

        private void kayitDuzenleButton_Click(object sender, EventArgs e)
        {
            dat2stringarray();
            form2kod();
            ogrencilerData[index] = string2dat();
            File.WriteAllText(dosyaAdi, "");
            try
            {
                FileStream fs = new FileStream(dosyaAdi, FileMode.Append, FileAccess.Write, FileShare.Write);
                StreamWriter sw = new StreamWriter(fs);
                foreach (string item in ogrencilerData)
                {
                    if(item.Trim() != "")
                        sw.WriteLine(item);
                }
                MessageBox.Show("düzenleme başarılı");
                sw.Close();
                formtemizle();
            }
            catch (Exception)
            {
                MessageBox.Show("düzenleme başarısız");
            }
        }

        private void kayitAraButton_Click(object sender, EventArgs e)
        {
            dat2stringarray();
            form2kod();
            List<string> list = ogrencilerData;
            int uzunluk = list.Count;
            for (int i = 0; i < uzunluk; i++)
            {
                string[] data = list[i].Split(';');
                for (int j = 0; j < data.Length; j++)
                {
                    if (!String.IsNullOrEmpty(ogrenciData[j]) && !data[j].Contains(ogrenciData[j]))
                    {
                        ogrencilerData.RemoveAt(i);
                        uzunluk--;
                        i--;
                        break;
                    }
                }
                /*if (!String.IsNullOrEmpty(ogrenciData[0]) && !data[0].Contains(ogrenciData[0])) 
                {
                    ogrencilerData.RemoveAt(i);
                    uzunluk--;
                }
                if (!String.IsNullOrEmpty(ogrenciData[1]) && !data[1].Contains(ogrenciData[1]))
                {
                    ogrencilerData.RemoveAt(i);
                    uzunluk--;
                }
                if (!String.IsNullOrEmpty(ogrenciData[2]) && !data[2].Contains(ogrenciData[2]))
                {
                    ogrencilerData.RemoveAt(i);
                    uzunluk--;
                }
                if (!String.IsNullOrEmpty(ogrenciData[3]) && !data[3].Contains(ogrenciData[3]))
                {
                    ogrencilerData.RemoveAt(i);
                    uzunluk--;
                }
                if (!String.IsNullOrEmpty(ogrenciData[4]) && !data[4].Contains(ogrenciData[4]))
                {
                    ogrencilerData.RemoveAt(i);
                    uzunluk--;
                }
                if (!String.IsNullOrEmpty(ogrenciData[5]) && !data[5].Contains(ogrenciData[5]))
                {
                    ogrencilerData.RemoveAt(i);
                    uzunluk--;
                }
                if (!String.IsNullOrEmpty(ogrenciData[6]) && !data[6].Contains(ogrenciData[6]))
                {
                    ogrencilerData.RemoveAt(i);
                    uzunluk--;
                }
                if (!String.IsNullOrEmpty(ogrenciData[7]) && !data[7].Contains(ogrenciData[7]))
                {
                    list.RemoveAt(i);
                    uzunluk--;
                }*/
            }
            yazdir(list);
            if (list.Count == 0)
            {
                MessageBox.Show("Aranan kriterlere uygun öğrenci bulunamadı.");
            }            
            if (list.Count == 1)
            {
                index = ogrencilerData.IndexOf(list[0]);
                kod2form();
            }
            
        }

        private void kayitEkleButton_Click(object sender, EventArgs e)
        {
            form2kod();
            try
            {
                FileStream fs = new FileStream(dosyaAdi, FileMode.Append, FileAccess.Write, FileShare.Write);
                StreamWriter sw = new StreamWriter(fs);
                sw.WriteLine(string2dat());
                MessageBox.Show("kayıt başarılı");
                sw.Close();
                formtemizle();
            }
            catch (Exception)
            {
                MessageBox.Show("kayıt başarısız");
            }
            
        }

        private void dataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.RowIndex < 0) return;
            DataGridViewRow row = dataGridView.Rows[e.RowIndex];
            if (row.Cells[1].Value == null) return;
            for (int i = 0; i < 8; i++)
            {
                ogrenciData[i] = row.Cells[i].Value.ToString();
            }
            index = ogrencilerData.IndexOf(string2dat());
            kod2form();
        }
    }
}
