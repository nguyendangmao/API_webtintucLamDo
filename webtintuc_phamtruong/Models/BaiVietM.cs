using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System;

namespace webtintuc_phamtruong.Data
{
   
    public class BaiVietM
    {  
    
        public int IDNhomTin { get; set; }
        public int IDTheLoai { get; set; }
        public int IDQuangCao { get; set; }
        public string TenBaiViet { get; set; }
        public string NoiDungBaiViet { get; set; }
        public string HinhAnh { get; set; }
        public double SoSaoTB { get; set; }
        public int LuotXem { get; set; }
        public DateTime NgayTao { get; set; }
        public string NguoiTao { get; set; }
        public DateTime NgaySua { get; set; }
        public string NguoiSua { get; set; }
    }
}
