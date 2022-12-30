using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace webtintuc_phamtruong.Data
{
    [Table("TheLoai")]
    public class TheLoaiD
    {
        [Key]
        public int IDTheLoai { get; set; }
        [Required]
        public string TenTheLoai { get; set; }
        public DateTime NgayTao { get; set; }

        public string NguoiTao { get; set; }
        public DateTime NgaySua { get; set; }
        public string NguoiSua { get; set; }

    }
}
