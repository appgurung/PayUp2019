﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PayUp.Core.Utility;
using PayUp.Core.DB.STAGING;

namespace PayUp.Console.Controllers
{
    public class CustomersController : Controller
    {
        string id;
        private readonly PayUpEntities db = new PayUpEntities();
        // GET: Customers
        public ActionResult YourCustomers()
        {
            // If session is empty redirect to login
            if (string.IsNullOrEmpty((string)GlobalData.getUerNameFromApplication))
            {
                return RedirectToAction("Index", "Default");
            }

            this.id = GlobalData.getUserIDFromApplication;

            return View();
        }

        [HttpGet]
        public JsonResult GetCustomers()
        {
            var customers = (from x in db.Customers
                             where x.MerchantID == this.id
                             select new
                             {
                                 CustomerName = x.CustomerName,
                                 CustomerPhoneNo = x.PhoneNo,
                                 CustomerEmail = x.Email,
                                 Date = x.DateAdded,
                                 CustomerID = x.CustomerID
                             }).ToList();

            return Json(new { data = customers }, JsonRequestBehavior.AllowGet);
        }
    }
}