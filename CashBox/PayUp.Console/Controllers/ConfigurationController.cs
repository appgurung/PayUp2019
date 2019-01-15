using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PayUp.Core.Utility;
using PayUp.Core.Models;
using PayUp.Core.DB.STAGING;

namespace PayUp.Console.Controllers
{
    public class ConfigurationController : Controller
    {
        private readonly PayUpEntities db = new PayUpEntities();
        
        // GET: Configuration
        public ActionResult Setup()
        {
            // If session is empty redirect to login
            if (string.IsNullOrEmpty((string)GlobalData.getUerNameFromApplication))
            {
                return RedirectToAction("Index", "Default");
            }

            var banks = (from x in db.Banks
                         select new
                         {
                             BankName = x.BankName,
                             SortCode = x.SortCode
                         }).ToList();
            List<Banks> bnk = new List<Banks>();
            if (banks != null)
            {
                foreach (var financialInstitution in banks)
                {
                    var bank = new Banks();

                    bank.BankName = financialInstitution.BankName.Trim();

                    bank.BankCode = financialInstitution.SortCode.Trim();

                    bnk.Add(bank);
                }
            }
            return View(bnk);
        }
    }
}