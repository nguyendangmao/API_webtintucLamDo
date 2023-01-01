using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System;

namespace webtintuc_phamtruong.Models
{
   
    public class QuangCaoM
    {
       
        public int IDNQC { get; set; }
        public string NoiDungQC { get; set; }
        public string TienQC { get; set; }

        public DateTime TGBatDau { get; set; }
        public DateTime TGKetThuc { get; set; }
        public string HinhAnh { get; set; }
        public string ThêLoaiQC { get; set; }
        public int ViTri { get; set; }
        public int ChieuDai { get; set; }
        public int ChieuRong { get; set; }
        public string GioiTinh { get; set; }
        public string SDT { get; set; }
        public string DiaChi { get; set; }
        public int TrangThai { get; set; }
        public DateTime NgayTao { get; set; }
    }
}
