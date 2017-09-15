using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using kodex.Data;
using kodex.ViewModels;

namespace kodex.Controllers
{
    public class StreamController : Controller
    {
        private readonly StreamContext _context;

        public StreamController(StreamContext context)
        {
            _context = context;
        }

        // GET: Stream
        public async Task<IActionResult> Index()
        {
            return View(await _context.StreamViewModels.ToListAsync());
        }

        // GET: Stream/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var streamViewModel = await _context.StreamViewModels
                .SingleOrDefaultAsync(m => m.Id == id);
            if (streamViewModel == null)
            {
                return NotFound();
            }

            return View(streamViewModel);
        }

        private bool StreamViewModelExists(Guid id)
        {
            return _context.StreamViewModels.Any(e => e.Id == id);
        }
    }
}
