using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using webtintuc_phamtruong.Data;

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
    }
}
