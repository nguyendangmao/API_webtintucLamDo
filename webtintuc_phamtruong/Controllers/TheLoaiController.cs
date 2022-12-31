using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using System;
using System.Linq;
using webtintuc_phamtruong.Data;
using webtintuc_phamtruong.Models;

namespace webtintuc_phamtruong.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TheLoaiController : ControllerBase
    {
        private readonly MyDbContext _context;
        public TheLoaiController(MyDbContext context)
        {
            _context = context;
        }
        [HttpGet] 
        public IActionResult GetALLTheLoai()
        {

            var theloais =_context.TheLoaiDs.ToList();
            return Ok(theloais);
        }
        [HttpGet]
        [Route("{id}")]
        public IActionResult GetTheLoaiById(string id)
        {
            try
            {
                var theloais = _context.TheLoaiDs.SingleOrDefault(n => n.IDTheLoai == int.Parse(id));
                if (theloais == null)
                {
                    return NotFound();
                }
                return Ok(theloais);
            }
            catch
            {
                return BadRequest();
            }
        }

        [HttpPost]
        public IActionResult Create(TheLoaiM theloais)
        {
            try
            {
                var theloai = new TheLoaiD
                {
                    TenTheLoai = theloais.TenTheLoai,
                    NgayTao = DateTime.Now,
                    NguoiTao = "ADMIN"

                };
                _context.Add(theloai);
                _context.SaveChanges();
                return StatusCode(StatusCodes.Status201Created, theloai);
            }
            catch
            {
                return BadRequest();
            }
        }

        [HttpPut]
        public IActionResult Edit(string id, TheLoaiM TheLoaiEdit)
        {
            try
            {
                var theloai = _context.TheLoaiDs.SingleOrDefault(nt => nt.IDTheLoai == int.Parse(id));
                if (theloai == null)
                {
                    return NotFound();
                }
                if (id != theloai.IDTheLoai.ToString())
                {
                    return BadRequest();
                }
                theloai.TenTheLoai = TheLoaiEdit.TenTheLoai;
                theloai.NgaySua = DateTime.Now;
                theloai.NguoiSua = "ADMIN";
                _context.SaveChanges();
                return Ok(theloai.IDTheLoai);
            }
            catch
            {
                return BadRequest();
            }
        }
        [HttpDelete] public IActionResult Delete(string id)
        {
            try
            {
                var theloai = _context.TheLoaiDs.SingleOrDefault(nt => nt.IDTheLoai == int.Parse(id));
                if (theloai == null)
                {
                    return NotFound();
                }
                _context.Remove(theloai);
                _context.SaveChanges();
                return Ok();
            }
            catch
            {
                return BadRequest();
            }
        }
    }
}
