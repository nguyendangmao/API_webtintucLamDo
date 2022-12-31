using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace webtintuc_phamtruong.Models
{
    public class NguoiDungM
    {
     
        [Required]
        [ForeignKey("IDPhanQuyen")]
        public int IDPhanQuyen { get; set; }
        public string TenTK { get; set; }
        public string MatKhau { get; set; }

        public string HoTen { get; set; }
        public string GioiTinh { get; set; }
        [MaxLength(10)]
        public string SDT { get; set; }
        public string DiaChi { get; set; }
        public int TrangThai { get; set; }
        public DateTime NgayTao { get; set; }

        public string NguoiTao { get; set; }
        public DateTime NgaySua { get; set; }
        public string NguoiSua { get; set; }
    }
}
