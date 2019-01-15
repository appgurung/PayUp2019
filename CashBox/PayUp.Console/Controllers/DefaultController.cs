using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PayUp.Console.Controllers
{
    public class DefaultController : Controller
    {
        // GET: Default
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult PaymentGateway()
        {
            return View();
        }

        public ActionResult Enterprise()
        {
            return View();
        }

        public ActionResult Developers()
        {
            return View();
        }

    }
}