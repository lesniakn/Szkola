using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Szkola.Models;

namespace Szkola.Controllers
{
    public class SalasController : ApiController
    {
        private BazaSzkolaEntities db = new BazaSzkolaEntities();

        // GET: api/Salas
        public List<Sala> GetSala()
        {
            db.Configuration.ProxyCreationEnabled = false;

            return db.Sala.ToList();
        }

        // GET: api/Salas/5
        [ResponseType(typeof(Sala))]
        public async Task<IHttpActionResult> GetSala(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;

            Sala sala = await db.Sala.FindAsync(id);
            if (sala == null)
            {
                return NotFound();
            }

            return Ok(sala);
        }

        // PUT: api/Salas/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutSala(int id, Sala sala)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != sala.SalaID)
            {
                return BadRequest();
            }

            db.Entry(sala).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SalaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Salas
        [ResponseType(typeof(Sala))]
        public async Task<IHttpActionResult> PostSala(Sala sala)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Sala.Add(sala);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (SalaExists(sala.SalaID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = sala.SalaID }, sala);
        }

        // DELETE: api/Salas/5
        [ResponseType(typeof(Sala))]
        public async Task<IHttpActionResult> DeleteSala(int id)
        {
            Sala sala = await db.Sala.FindAsync(id);
            if (sala == null)
            {
                return NotFound();
            }

            db.Sala.Remove(sala);
            await db.SaveChangesAsync();

            return Ok(sala);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SalaExists(int id)
        {
            return db.Sala.Count(e => e.SalaID == id) > 0;
        }
    }
}