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
    public class ZapisieController : Controller
    {
        private BazaSzkolaEntities db = new BazaSzkolaEntities();

        // GET: Zapisie
        public ActionResult Index()
        {
            var zapisy = db.Zapisy.Include(z => z.Przedmiot).Include(z => z.Student);
            return View(zapisy.ToList());
        }

        // GET: Zapisie/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Zapisy zapisy = db.Zapisy.Find(id);
            if (zapisy == null)
            {
                return HttpNotFound();
            }
            return View(zapisy);
        }

        // GET: Zapisie/Create
        public ActionResult Create()
        {
            ViewBag.PrzedmiotID = new SelectList(db.Przedmiot, "PrzedmiotID", "Nazwa");
            ViewBag.StudentID = new SelectList(db.Student, "StudentID", "Imie");
            return View();
        }

        // POST: Zapisie/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ZapisyID,StudentID,PrzedmiotID,Data_zapisu")] Zapisy zapisy)
        {
            if (ModelState.IsValid)
            {
                db.Zapisy.Add(zapisy);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PrzedmiotID = new SelectList(db.Przedmiot, "PrzedmiotID", "Nazwa", zapisy.PrzedmiotID);
            ViewBag.StudentID = new SelectList(db.Student, "StudentID", "Imie", zapisy.StudentID);
            return View(zapisy);
        }

        // GET: Zapisie/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Zapisy zapisy = db.Zapisy.Find(id);
            if (zapisy == null)
            {
                return HttpNotFound();
            }
            ViewBag.PrzedmiotID = new SelectList(db.Przedmiot, "PrzedmiotID", "Nazwa", zapisy.PrzedmiotID);
            ViewBag.StudentID = new SelectList(db.Student, "StudentID", "Imie", zapisy.StudentID);
            return View(zapisy);
        }

        // POST: Zapisie/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ZapisyID,StudentID,PrzedmiotID,Data_zapisu")] Zapisy zapisy)
        {
            if (ModelState.IsValid)
            {
                db.Entry(zapisy).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PrzedmiotID = new SelectList(db.Przedmiot, "PrzedmiotID", "Nazwa", zapisy.PrzedmiotID);
            ViewBag.StudentID = new SelectList(db.Student, "StudentID", "Imie", zapisy.StudentID);
            return View(zapisy);
        }

        // GET: Zapisie/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Zapisy zapisy = db.Zapisy.Find(id);
            if (zapisy == null)
            {
                return HttpNotFound();
            }
            return View(zapisy);
        }

        // POST: Zapisie/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Zapisy zapisy = db.Zapisy.Find(id);
            db.Zapisy.Remove(zapisy);
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
