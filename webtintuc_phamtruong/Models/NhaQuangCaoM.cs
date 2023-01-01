using System;
using System.ComponentModel.DataAnnotations;

namespace webtintuc_phamtruong.Models
{
    public class NhaQuangCaoM
    {
       
        [Required]
        public string TenNQC { get; set; }
        public DateTime NgayTao { get; set; }
        public string NguoiTao { get; set; }
        public DateTime NgaySua { get; set; }
        public string NguoiSua { get; set; }
    }
}
