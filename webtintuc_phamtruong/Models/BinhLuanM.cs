using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System;

namespace webtintuc_phamtruong.Models
{
   
    public class BinhLuanM
    {
        [Key]
        public int IDBinhLuan { get; set; }
        [Required]
        [ForeignKey("IDPhanQuyen")]
        public int IDBaiViet { get; set; }
        [Required]
        [ForeignKey("ID")]
        public int ID { get; set; }
        public string NoiDung { get; set; }
        public DateTime NgayTao { get; set; }
        public string NguoiTao { get; set; }
        public DateTime NgaySua { get; set; }
        public string NguoiSua { get; set; }
    }
}
