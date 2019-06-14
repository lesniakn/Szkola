using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Szkola.Models;

namespace Szkola.Controllers
{
    public class SchoolsController : Controller
    {
        // GET: Schools
        public ActionResult Index()
        {
            var webClient = new WebClient();
            var json = webClient.DownloadString(@"C:\Users\Norbert\source\repos\Szkola\Szkola\szkolyUSA.json");
            var schools = JsonConvert.DeserializeObject<Schools>(json);

            return View(schools);
        }
    }
}