using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Carrito.Models;

namespace Carrito.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DetallesController : ControllerBase
    {
        private readonly ConexionSQLServer _context;

        public DetallesController(ConexionSQLServer context)
        {
            _context = context;
        }

        // GET: api/Detalles
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Detalles>>> GetDetalles()
        {
            return await _context.Detalles.ToListAsync();
        }

        // GET: api/Detalles/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Detalles>> GetDetalles(int id)
        {
            var detalles = await _context.Detalles.FindAsync(id);

            if (detalles == null)
            {
                return NotFound();
            }

            return detalles;
        }

        // PUT: api/Detalles/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDetalles(int id, Detalles detalles)
        {
            if (id != detalles.id)
            {
                return BadRequest();
            }

            _context.Entry(detalles).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DetallesExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Detalles
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<Detalles>> PostDetalles(Detalles detalles)
        {
            _context.Detalles.Add(detalles);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetDetalles", new { id = detalles.id }, detalles);
        }

        // DELETE: api/Detalles/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Detalles>> DeleteDetalles(int id)
        {
            var detalles = await _context.Detalles.FindAsync(id);
            if (detalles == null)
            {
                return NotFound();
            }

            _context.Detalles.Remove(detalles);
            await _context.SaveChangesAsync();

            return detalles;
        }

        private bool DetallesExists(int id)
        {
            return _context.Detalles.Any(e => e.id == id);
        }
    }
}
