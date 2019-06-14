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
    public class BudyneksController : ApiController
    {
        private BazaSzkolaEntities db = new BazaSzkolaEntities();

        // GET: api/Budyneks
        public IQueryable<Budynek> GetBudynek()
        {
            db.Configuration.ProxyCreationEnabled = false;

            return db.Budynek;
        }

        // GET: api/Budyneks/5
        [ResponseType(typeof(Budynek))]
        public async Task<IHttpActionResult> GetBudynek(int id)
        {
            Budynek budynek = await db.Budynek.FindAsync(id);
            if (budynek == null)
            {

                return NotFound();
            }

            return Ok(budynek);
        }

        // PUT: api/Budyneks/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutBudynek(int id, Budynek budynek)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != budynek.BudynekID)
            {
                return BadRequest();
            }

            db.Entry(budynek).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BudynekExists(id))
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

        // POST: api/Budyneks
        [ResponseType(typeof(Budynek))]
        public async Task<IHttpActionResult> PostBudynek(Budynek budynek)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Budynek.Add(budynek);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (BudynekExists(budynek.BudynekID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = budynek.BudynekID }, budynek);
        }

        // DELETE: api/Budyneks/5
        [ResponseType(typeof(Budynek))]
        public async Task<IHttpActionResult> DeleteBudynek(int id)
        {
            Budynek budynek = await db.Budynek.FindAsync(id);
            if (budynek == null)
            {
                return NotFound();
            }

            db.Budynek.Remove(budynek);
            await db.SaveChangesAsync();

            return Ok(budynek);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool BudynekExists(int id)
        {
            return db.Budynek.Count(e => e.BudynekID == id) > 0;
        }
    }
}