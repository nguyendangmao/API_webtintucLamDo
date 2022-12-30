using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System;

namespace webtintuc_phamtruong.Data
{
   
    public class BaiVietM
    {
        [Key]
        public int IDBaiViet { get; set; }
        [Required]
        [ForeignKey("IDNhomTin")]
        public int IDNhomTin { get; set; }
        [Required]
        [ForeignKey("IDTheLoai")]
        public int IDTheLoai { get; set; }
        [Required]
        [ForeignKey("IDQuangCao")]
        public int IDQuangCao { get; set; }
        public string TenBaiViet { get; set; }
        public string NoiDungBaiViet { get; set; }
        public string HinhAnh { get; set; }
        public double SoSaoTB { get; set; }
        public int LuotXem { get; set; }
        public string GioiTinh { get; set; }
        [MaxLength(10)]
        public string SDT { get; set; }
        public string DiaChi { get; set; }
        public int TrangThai { get; set; }
        public DateTime NgayTao { get; set; }
    }
}
