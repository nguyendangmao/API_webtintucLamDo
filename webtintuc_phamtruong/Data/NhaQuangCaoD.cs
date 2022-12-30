using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace webtintuc_phamtruong.Data
{
    [Table("NhaQuangCao")]
    public class NhaQuangCaoD
    {
        [Key]
        public int IDNQC { get; set; }
        [Required]
        public string TenNQC { get; set; }
        public DateTime NgayTao { get; set; }

        public string NguoiTao { get; set; }
        public DateTime NgaySua { get; set; }
        public string NguoiSua { get; set; }
    }
}
