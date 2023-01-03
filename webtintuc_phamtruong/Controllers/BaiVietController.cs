using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Diagnostics;
using System.Linq;
using webtintuc_phamtruong.Data;

namespace webtintuc_phamtruong.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BaiVietController : ControllerBase
    {
        private readonly MyDbContext _context;

        public BaiVietController(MyDbContext context)
        {
             _context = context;
        }
        [HttpGet]
        public IActionResult GetAll()
        {
                var baiviets = _context.BaiVietDs.ToList();
                return Ok(baiviets);



            //var dsBaiViet = _context.BaiVietDb.ToList();
            //var dsNhomTin = _context.NhomTinDb.ToList();
            //var dsTheLoai = _context.TheLoaiDb.ToList();
            //var dsQuangCao = _context.QuangCaoDb.ToList();

            //var ds = (from bv in dsBaiViet
            //          join nt in dsNhomTin on bv.IDNhomTin equals nt.IDNhomTin
            //          join tl in dsTheLoai on bv.IDTheLoai equals tl.IDTheLoai
            //          join qc in dsQuangCao on bv.IDQuangCao equals qc.IDQuangCao
            //          select new
            //          {
            //              IDBaiViet = bv.IDBaiViêt,
            //              TenBaiViet = bv.TenBaiViet,
            //              IdNhomTin = bv.IDNhomTin,
            //              TenNhomTin = nt.TenNhomTin,
            //              IdTheLoai = bv.IDTheLoai,
            //              TenTheLoai = tl.TenTheLoai,
            //              IdQuangCao = bv.IDQuangCao,
            //              QuangCao = qc.NoiDungQC,
            //              HinhAnhQC = qc.HinhAnh,
            //              NoiDungBaiViet = bv.NoiDungBaiViet,
            //              HinhAnh = bv.HinhAnh,
            //              SoSaoTB = bv.SoSaoTB,
            //              LuotXem = bv.LuotXem,
            //              NgaySua = bv.NgaySua,
            //              NguoiSua = bv.NguoiSua,
            //          });
            //return Ok(ds);
        }
        //Lấy theo id
        [HttpGet("{id}")]
        public IActionResult GetById(string id)
        {
            var dsBaiViet = _context.BaiVietDs.ToList();
            var dsNhomTin = _context.NhomTinDs.ToList();
            var dsTheLoai = _context.TheLoaiDs.ToList();
            var dsQuangCao = _context.QuangCaoDs.ToList();

            var ds = (from bv in dsBaiViet
                      join nt in dsNhomTin on bv.IDNhomTin equals nt.IDNhomTin
                      join tl in dsTheLoai on bv.IDTheLoai equals tl.IDTheLoai
                      join qc in dsQuangCao on bv.IDQuangCao equals qc.IDQuangCao
                      select new
                      {
                          IDBaiViet = bv.IDBaiViêt,
                          TenBaiViet = bv.TenBaiViet,
                          IdNhomTin = bv.IDNhomTin,
                          TenNhomTin = nt.TenNhomTin,
                          IdTheLoai = bv.IDTheLoai,
                          TenTheLoai = tl.TenTheLoai,
                          IdQuangCao = bv.IDQuangCao,
                          QuangCao = qc.NoiDungQC,
                          HinhAnhQC = qc.HinhAnh,
                          NoiDungBaiViet = bv.NoiDungBaiViet,
                          HinhAnh = bv.HinhAnh,
                          SoSaoTB = bv.SoSaoTB,
                          LuotXem = bv.LuotXem,
                          NgaySua = bv.NgaySua,
                          NguoiSua = bv.NguoiSua,
                      });
            try
            {
                var baiviet = ds.SingleOrDefault(nt => nt.IDBaiViet == int.Parse(id));
                if (baiviet == null)
                {
                    return NotFound();
                }
                return Ok(baiviet);
            }
            catch
            {
                return BadRequest();
            }
        }
        //Thêm
        [HttpPost]
        public IActionResult Create(BaiVietM BaiVietAdd)
        {
            try
            {
                var baiviet = new BaiVietD
                {
                    IDNhomTin = BaiVietAdd.IDNhomTin,
                    IDTheLoai = BaiVietAdd.IDTheLoai,
                    IDQuangCao = BaiVietAdd.IDQuangCao,
                    TenBaiViet = BaiVietAdd.TenBaiViet,
                    NoiDungBaiViet = BaiVietAdd.NoiDungBaiViet,
                    HinhAnh = BaiVietAdd.HinhAnh,
                    SoSaoTB = BaiVietAdd.SoSaoTB,
                    LuotXem = BaiVietAdd.LuotXem,
                    NgayTao = DateTime.Now,
                    NguoiTao = "ADMIN"

                };
                _context.Add(baiviet);
                var IdNT = _context.NhomTinDs.SingleOrDefault(nt => nt.IDNhomTin == baiviet.IDNhomTin);
                var IdTL = _context.TheLoaiDs.SingleOrDefault(nt => nt.IDTheLoai == baiviet.IDTheLoai);
                var IdQC = _context.QuangCaoDs.SingleOrDefault(nt => nt.IDQuangCao == baiviet.IDQuangCao);
                if (IdNT != null && IdTL != null && IdQC != null)
                {
                    _context.SaveChanges();
                    return StatusCode(StatusCodes.Status201Created, baiviet);
                }
                return StatusCode(StatusCodes.Status412PreconditionFailed);
            }
            catch
            {
                return BadRequest();
            }
        }
        //Sửa
        [HttpPut("{id}")]
        public IActionResult Edit(string id, BaiVietM BaiVietEdit)
        {
            try
            {
                var baiviet = _context.BaiVietDs.SingleOrDefault(nt => nt.IDBaiViêt == int.Parse(id));
                if (baiviet == null)
                {
                    return NotFound();
                }
                if (id != baiviet.IDBaiViêt.ToString())
                {
                    return BadRequest();
                }
                baiviet.IDNhomTin = BaiVietEdit.IDNhomTin;
                baiviet.IDTheLoai = BaiVietEdit.IDTheLoai;
                baiviet.IDQuangCao = BaiVietEdit.IDQuangCao;
                baiviet.TenBaiViet = BaiVietEdit.TenBaiViet;
                baiviet.NoiDungBaiViet = BaiVietEdit.NoiDungBaiViet;
                baiviet.HinhAnh = BaiVietEdit.HinhAnh;
                baiviet.SoSaoTB = BaiVietEdit.SoSaoTB;
                baiviet.LuotXem = BaiVietEdit.LuotXem;
                baiviet.NgaySua = DateTime.Now;
                baiviet.NguoiSua = "ADMIN";
                var IdNT = _context.NhomTinDs.SingleOrDefault(nt => nt.IDNhomTin == baiviet.IDNhomTin);
                var IdTL = _context.TheLoaiDs.SingleOrDefault(nt => nt.IDTheLoai == baiviet.IDTheLoai);
                var IdQC = _context.QuangCaoDs.SingleOrDefault(nt => nt.IDQuangCao == baiviet.IDQuangCao);
                if (IdNT != null && IdTL != null && IdQC != null)
                {
                    _context.SaveChanges();
                    return StatusCode(StatusCodes.Status201Created, baiviet);
                }
                return StatusCode(StatusCodes.Status412PreconditionFailed);

            }
            catch
            {
                return BadRequest();
            }
        }
        //Xóa
        [HttpDelete("{id}")]
        public IActionResult Delete(string id)
        {
            try
            {
                var baiviet = _context.BaiVietDs.SingleOrDefault(nt => nt.IDBaiViêt == int.Parse(id));
                if (baiviet == null)
                {
                    return NotFound();
                }
                _context.Remove(baiviet);
                _context.SaveChanges();
                return Ok();
            }
            catch
            {
                return BadRequest();
            }
        }
        //Xóa
        [HttpGet("LayDSbaiviet")]
        public IActionResult LayTheoTheLoai(string idTheLoai)
        {
            var dsBaiViet = _context.BaiVietDs.ToList();
            var dsNhomTin = _context.NhomTinDs.ToList();
            var dsTheLoai = _context.TheLoaiDs.ToList();
            var dsQuangCao = _context.QuangCaoDs.ToList();

            var ds = (from bv in dsBaiViet
                      join nt in dsNhomTin on bv.IDNhomTin equals nt.IDNhomTin
                      join tl in dsTheLoai on bv.IDTheLoai equals tl.IDTheLoai
                      join qc in dsQuangCao on bv.IDQuangCao equals qc.IDQuangCao
                      select new
                      {
                          IDBaiViet = bv.IDBaiViêt,
                          TenBaiViet = bv.TenBaiViet,
                          IdNhomTin = bv.IDNhomTin,
                          TenNhomTin = nt.TenNhomTin,
                          IdTheLoai = bv.IDTheLoai,
                          TenTheLoai = tl.TenTheLoai,
                          IdQuangCao = bv.IDQuangCao,
                          QuangCao = qc.NoiDungQC,
                          HinhAnhQC = qc.HinhAnh,
                          NoiDungBaiViet = bv.NoiDungBaiViet,
                          HinhAnh = bv.HinhAnh,
                          SoSaoTB = bv.SoSaoTB,
                          LuotXem = bv.LuotXem,
                          NgaySua = bv.NgaySua,
                          NguoiSua = bv.NguoiSua,
                      });
            try
            {
                var baiviet = ds.Where(nt => nt.IdTheLoai == int.Parse(idTheLoai)).ToList();
                if (baiviet == null)
                {
                    return NotFound();
                }
                return Ok(baiviet);
            }
            catch
            {
                return BadRequest();
            }
        }
        [HttpGet("NewsByGenre")]
        public IActionResult LayTheoNhomTin(string idNhomTin)
        {
            var dsBaiViet = _context.BaiVietDs.ToList();
            var dsNhomTin = _context.NhomTinDs.ToList();
            var dsTheLoai = _context.TheLoaiDs.ToList();
            var dsQuangCao = _context.QuangCaoDs.ToList();

            var ds = (from bv in dsBaiViet
                      join nt in dsNhomTin on bv.IDNhomTin equals nt.IDNhomTin
                      join tl in dsTheLoai on bv.IDTheLoai equals tl.IDTheLoai
                      join qc in dsQuangCao on bv.IDQuangCao equals qc.IDQuangCao
                      select new
                      {
                          IDBaiViet = bv.IDBaiViêt,
                          TenBaiViet = bv.TenBaiViet,
                          IdNhomTin = bv.IDNhomTin,
                          TenNhomTin = nt.TenNhomTin,
                          IdTheLoai = bv.IDTheLoai,
                          TenTheLoai = tl.TenTheLoai,
                          IdQuangCao = bv.IDQuangCao,
                          QuangCao = qc.NoiDungQC,
                          HinhAnhQC = qc.HinhAnh,
                          NoiDungBaiViet = bv.NoiDungBaiViet,
                          HinhAnh = bv.HinhAnh,
                          SoSaoTB = bv.SoSaoTB,
                          LuotXem = bv.LuotXem,
                          NgaySua = bv.NgaySua,
                          NguoiSua = bv.NguoiSua,
                      });
            try
            {
                var baiviet = ds.Where(nt => nt.IdNhomTin == int.Parse(idNhomTin)).ToList();
                if (baiviet == null)
                {
                    return NotFound();
                }
                return Ok(baiviet);
            }
            catch
            {
                return BadRequest();
            }
        }
    }
}
