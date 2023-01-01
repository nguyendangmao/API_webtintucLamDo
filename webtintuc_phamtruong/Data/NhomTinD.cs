using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace webtintuc_phamtruong.Data
{
    [Table("NhomTin")]
    public class NhomTinD
    {
        [Key]
        public int IDNhomTin { get; set; }
        public string TenNhomTin { get; set; }
        public int ThuTuHienThi { get; set; }
        public DateTime NgayTao { get; set; }
        public string NguoiTao { get; set; }
        public DateTime NgaySua { get; set; }
        public string NguoiSua { get; set; }
    }
}
