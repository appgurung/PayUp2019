using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PayUp.Core.Utility;
using PayUp.Core.DB;
using PayUp.Core.Constants;
namespace PayUp.Console.Controllers
{
    public class TransactionLogsController : Controller
    {
        private readonly PayUpAfricaEntities db = new PayUpAfricaEntities();
        public string id;
        // GET: TransactionLogs
        public ActionResult Logs()
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
        public JsonResult GetLiveSuccessfulTransactions()
        {
            try
            {
                var transactions = (from x in db.LiveTransactions
                                    where x.MerchantID == this.id && x.ResponseCode == GetConstants.SUCCESS_CODE
                                    select new
                                    {
                                        CustomerEmail = x.Email,
                                        Amount = x.Amount,
                                        TransactionStatus = x.TransactionStatus,
                                        Purpose = x.Purpose,
                                        MerchantRef = x.MerchantTransactionRef,
                                        Date = x.Date
                                    }).ToList();

                return Json(new { data = transactions }, JsonRequestBehavior.AllowGet);
            }
            catch(Exception)
            {
                throw;
            }
        }

        [HttpGet]
        public JsonResult GetAllLiveTransactions()
        {
            try
            {
                var transactions = (from x in db.LiveTransactions
                                    where x.MerchantID == this.id
                                    select new
                                    {
                                        CustomerEmail = x.Email,
                                        Amount = x.Amount,
                                        TransactionStatus = x.TransactionStatus,
                                        Purpose = x.Purpose,
                                        MerchantRef = x.MerchantTransactionRef,
                                        Date = x.Date
                                    }).ToList();

                return Json(new { data = transactions }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpGet]
        public JsonResult GetLiveFailedTransactions()
        {
            try
            {

                var transactions = (from x in db.LiveTransactions
                                    where x.MerchantID == this.id && x.ResponseCode != GetConstants.SUCCESS_CODE
                                    select new
                                    {
                                        CustomerEmail = x.Email,
                                        Amount = x.Amount,
                                        TransactionStatus = x.TransactionStatus,
                                        Purpose = x.Purpose,
                                        MerchantRef = x.MerchantTransactionRef,
                                        Date = x.Date
                                    }).ToList();

                return Json(new { data = transactions }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}