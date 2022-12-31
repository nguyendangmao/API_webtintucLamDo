using Microsoft.EntityFrameworkCore;
using webtintuc_phamtruong.Models;

namespace webtintuc_phamtruong.Data
{
    public class MyDbContext:DbContext
    {
        public MyDbContext(DbContextOptions options) : base(options) { }

        #region db set
        //public DbSet<HangHoa> HangHoas { get; set; }
        public DbSet<BaiVietD> BaiVietDs { get; set; }
        public DbSet<BinhLuanD> BinhLuanDs { get; set; }
        public DbSet<NguoiDungD> NguoiDungDs { get; set; }
        public DbSet<NhaQuangCaoD> NhaQuangCaoDs { get; set; }
        public DbSet<NhomTinD> NhomTinDs { get; set; }
        public DbSet<PhanQuyenD> PhanQuyenDs { get; set; }
        public DbSet<TheLoaiD> TheLoaiDs  { get; set; }
        public DbSet<QuangCaoD> QuangCaoDs { get; set; }


        #endregion db set
    }
}
