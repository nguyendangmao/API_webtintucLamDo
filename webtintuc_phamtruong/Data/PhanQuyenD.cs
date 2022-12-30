using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace webtintuc_phamtruong.Data
{
    [Table("PhanQuyen")]
    public class PhanQuyenD
    {
        [Key]
        public int IDPhanQuyen { get; set; }
        [Required]
        public string TenQuyen { get; set; }
        public DateTime NgayTao { get; set; }

        public string NguoiTao { get; set; }
        public DateTime NgaySua { get; set; }
        public string NguoiSua { get; set; }
    }
}
