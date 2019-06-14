using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Szkola.Models;

namespace Szkola.Controllers
{
    public class BudynekController : Controller
    {
        private BazaSzkolaEntities db = new BazaSzkolaEntities();

        // GET: Budynek
        public ActionResult Index()
        {
            return View(db.Budynek.ToList());
        }

        // GET: Budynek/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Budynek budynek = db.Budynek.Find(id);
            if (budynek == null)
            {
                return HttpNotFound();
            }
            return View(budynek);
        }

        // GET: Budynek/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Budynek/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BudynekID,Ulica,Nr_budynku,Kod_pocztowy,Miejscowosc")] Budynek budynek)
        {
            if (ModelState.IsValid)
            {
                db.Budynek.Add(budynek);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(budynek);
        }

        // GET: Budynek/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Budynek budynek = db.Budynek.Find(id);
            if (budynek == null)
            {
                return HttpNotFound();
            }
            return View(budynek);
        }

        // POST: Budynek/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BudynekID,Ulica,Nr_budynku,Kod_pocztowy,Miejscowosc")] Budynek budynek)
        {
            if (ModelState.IsValid)
            {
                db.Entry(budynek).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(budynek);
        }

        // GET: Budynek/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Budynek budynek = db.Budynek.Find(id);
            if (budynek == null)
            {
                return HttpNotFound();
            }
            return View(budynek);
        }

        // POST: Budynek/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Budynek budynek = db.Budynek.Find(id);
            db.Budynek.Remove(budynek);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
