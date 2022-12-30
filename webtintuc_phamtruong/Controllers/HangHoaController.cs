using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using webtintuc_phamtruong.Models;

namespace webtintuc_phamtruong.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HangHoaController : ControllerBase
    {
        public static List<HangHoa> hanghoas =new List<HangHoa>(); 
        [HttpGet]  
        public IActionResult GETALL()
        {
            return Ok(hanghoas);
        }

        [HttpGet("{id}")]
        public IActionResult getbyid(string id)
        {
            try
            {
                var hanghoa = hanghoas.SingleOrDefault(n => n.MaHangHoa == Guid.Parse(id));
                if (hanghoa == null)
                {
                    return NotFound();
                }

                return Ok(hanghoas);
            }catch
            {
                return BadRequest();
            }
            
        }


        [HttpPut("{id}")]
        public IActionResult edit(string id,HangHoaVM hanghoaedit)
        {
            try
            {
                var hanghoa = hanghoas.SingleOrDefault(n => n.MaHangHoa == Guid.Parse(id));
                if (hanghoa == null)
                {
                    return NotFound();
                }

                hanghoa.TenHangHoa=hanghoaedit.TenHangHoa;
                hanghoa.DonGia = hanghoaedit.DonGia;
                
                return Ok(hanghoas);
            }
            catch
            {
                return BadRequest();
            }

        }

        [HttpPost]
        public IActionResult Create (HangHoaVM hanghoavm)
        {
            var hanghoa = new HangHoa
            {
                MaHangHoa =Guid.NewGuid(),
                TenHangHoa= hanghoavm.TenHangHoa,
                DonGia= hanghoavm.DonGia
            };
            hanghoas.Add(hanghoa);
            return Ok(hanghoas);
        }



        [HttpDelete("{id}")]
        public IActionResult xoa(string id)
        {
            try
            {
                var hanghoa = hanghoas.SingleOrDefault(n => n.MaHangHoa == Guid.Parse(id));
                if (hanghoa == null)
                {
                    return NotFound();
                }

               hanghoas.Remove(hanghoa);

                return Ok(hanghoa.MaHangHoa);
            }
            catch
            {
                return BadRequest();
            }

        }


    }
}
