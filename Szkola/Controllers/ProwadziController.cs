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
    public class ProwadziController : Controller
    {
        private BazaSzkolaEntities db = new BazaSzkolaEntities();

        // GET: Prowadzi
        public ActionResult Index()
        {
            var prowadzi = db.Prowadzi.Include(p => p.Nauczyciel).Include(p => p.Przedmiot);
            return View(prowadzi.ToList());
        }

        // GET: Prowadzi/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prowadzi prowadzi = db.Prowadzi.Find(id);
            if (prowadzi == null)
            {
                return HttpNotFound();
            }
            return View(prowadzi);
        }

        // GET: Prowadzi/Create
        public ActionResult Create()
        {
            ViewBag.NauczycielID = new SelectList(db.Nauczyciel, "NauczycielID", "Imie");
            ViewBag.PrzedmiotID = new SelectList(db.Przedmiot, "PrzedmiotID", "Nazwa");
            return View();
        }

        // POST: Prowadzi/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProwadziID,PrzedmiotID,NauczycielID")] Prowadzi prowadzi)
        {
            if (ModelState.IsValid)
            {
                db.Prowadzi.Add(prowadzi);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.NauczycielID = new SelectList(db.Nauczyciel, "NauczycielID", "Imie", prowadzi.NauczycielID);
            ViewBag.PrzedmiotID = new SelectList(db.Przedmiot, "PrzedmiotID", "Nazwa", prowadzi.PrzedmiotID);
            return View(prowadzi);
        }

        // GET: Prowadzi/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prowadzi prowadzi = db.Prowadzi.Find(id);
            if (prowadzi == null)
            {
                return HttpNotFound();
            }
            ViewBag.NauczycielID = new SelectList(db.Nauczyciel, "NauczycielID", "Imie", prowadzi.NauczycielID);
            ViewBag.PrzedmiotID = new SelectList(db.Przedmiot, "PrzedmiotID", "Nazwa", prowadzi.PrzedmiotID);
            return View(prowadzi);
        }

        // POST: Prowadzi/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProwadziID,PrzedmiotID,NauczycielID")] Prowadzi prowadzi)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prowadzi).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.NauczycielID = new SelectList(db.Nauczyciel, "NauczycielID", "Imie", prowadzi.NauczycielID);
            ViewBag.PrzedmiotID = new SelectList(db.Przedmiot, "PrzedmiotID", "Nazwa", prowadzi.PrzedmiotID);
            return View(prowadzi);
        }

        // GET: Prowadzi/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prowadzi prowadzi = db.Prowadzi.Find(id);
            if (prowadzi == null)
            {
                return HttpNotFound();
            }
            return View(prowadzi);
        }

        // POST: Prowadzi/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Prowadzi prowadzi = db.Prowadzi.Find(id);
            db.Prowadzi.Remove(prowadzi);
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
