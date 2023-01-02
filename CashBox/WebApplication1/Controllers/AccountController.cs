using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DevOne.Security.Cryptography.BCrypt;
using System.Text.RegularExpressions;
using PayUp.Core.Constants;
using System.IO;
using PayUp.Core.Notifications;
using PayUp.Core.Utility;
using PayUp.Core.Models;
using PayUp.Core.DB;

namespace PayUp.Console.Controllers
{
    public class AccountController : Controller
    {
        private readonly PayUpAfricaEntities db = new PayUpAfricaEntities();
        public string id;
        DeveloperController dev = new DeveloperController();
        // GET: Account
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        public ActionResult MyProfile()
        {
            // If session is empty redirect to login
            if (string.IsNullOrEmpty((string)GlobalData.getUerNameFromApplication))
            {
                return RedirectToAction("Login", "Account");
            }
            
            return View();
        }


        [HttpPost]
        public JsonResult LoginVerification(Login login)
        {
            try
            {
                bool isEmail = PayUp.Core.Utility.Validator.isValidEmail(login.UserIdentity);

                GlobalData global = new GlobalData();

                switch(isEmail)
                {
                    //Email
                    case true:
                        var check = (from x in db.Registrations
                                     where x.Email == login.UserIdentity
                                     select x).Count();
                        //Email exist in data base
                        if(check > 0)
                        {
                            var accountDetails = db.Registrations.Where(x => x.Email == login.UserIdentity).Select(x => x).FirstOrDefault();

                            bool isPasswordValid = BCryptHelper.CheckPassword(login.Password, accountDetails.Password.Trim());

                            switch(isPasswordValid)
                            {
                                case true:
                                    global.setUserNameFromApplication(login.UserIdentity);
                                    global.setUserIDFromApplication(accountDetails.RegistrationID.ToString());
                                    global.setPhoneNoFromApplication(accountDetails.PhoneNo);
                                    return Json(new { ResponseCode = 00, Message = "Password Verification Successful" }, JsonRequestBehavior.AllowGet);
 

                                case false:
                                    return Json(new { ResponseCode = 01, Message = "Password Verification Failed" }, JsonRequestBehavior.AllowGet);
                            }
                        }

                        return Json(new { ResponseCode = 04, Message = "Email Does Not Exist" }, JsonRequestBehavior.AllowGet);

                        //PhoneNo
                    case false:
                        var checkPhoneNo = db.Registrations.Where(x => x.PhoneNo == login.UserIdentity).Count();

                        if(checkPhoneNo > 0)
                        {
                            var accountDetails = db.Registrations.Where(x => x.PhoneNo == login.UserIdentity).Select(x => x).FirstOrDefault();

                            bool isPasswordValid = BCryptHelper.CheckPassword(login.Password, accountDetails.Password.Trim());

                            switch (isPasswordValid)
                            {
                                case true:
                                    global.setUserNameFromApplication(login.UserIdentity);
                                    global.setUserIDFromApplication(accountDetails.RegistrationID.ToString());
                                    global.setPhoneNoFromApplication(accountDetails.PhoneNo);
                                    return Json(new { ResponseCode = 00, Message = "Password Verification Successful" }, JsonRequestBehavior.AllowGet);


                                case false:
                                    return Json(new { ResponseCode = 01, Message = "Password Verification Failed" }, JsonRequestBehavior.AllowGet);
                            }
                        }
                        return Json(new {ResponseCode = 05, Message = "PhoneNo Does Not Exist" }, JsonRequestBehavior.AllowGet);
                }

                return null;
            }
            catch(Exception)
            {
                throw;
            }
        }


        [HttpPost]
        public JsonResult CreateAccount(CreateAccount account)
        {
            try
            {

                var check = (from x in db.Registrations
                             where x.Email == account.Email
                             select x).Count();

                if(check > 0)
                {
                    return Json(new { ResponseCode = 01, Message = "Account Already Exist" }, JsonRequestBehavior.AllowGet);
                }

                if(account.Password.Equals(account.ConfirmPassword))
                {
                    Regex r = new Regex("^[a-zA-Z0-9]*$");
                    if (r.IsMatch(account.Password))
                    {
                        return Json(new { ResponseCode = 02, Message = "Password Must Be Alphanumeric" }, JsonRequestBehavior.AllowGet);
                    }
                    else if (account.Password.Length < 7)
                    {
                        return Json(new { ResponseCode = 03, Message = "Password Lenght must be greater than 7" }, JsonRequestBehavior.AllowGet);

                    }
                    else if (account.Password.Contains("PASSWORD") || account.Password.Contains("Password") || account.Password.Contains("password"))
                    {
                        return Json(new { ResponseCode = 04, Message = "Your selected password must not contain password" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json(new { ResponseCode = 08, Message = "Password Does Not Match" }, JsonRequestBehavior.AllowGet);
                }


                //Create directories for new merchants
                DirectoryInfo AccountDirectoryForUsers = Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "\\" + "AccountDirectory" + "\\" + account.Email);

                AccountDirectoryForUsers.CreateSubdirectory("MerchantLogo");

                AccountDirectoryForUsers.CreateSubdirectory("InvoiceDocuments");

                AccountDirectoryForUsers.CreateSubdirectory("GoLiveDocument");

                //creating hashpassword
                string salt = BCryptHelper.GenerateSalt(6);

                var hashedPassword = BCryptHelper.HashPassword(account.Password, salt);
                Registration register = new Registration()
                {
                    BusinessName = account.FullName,

                    PhoneNo = account.PhoneNo,

                    Email = account.Email,

                    Password = hashedPassword,

                    Date = DateTime.UtcNow.ToString("yyyy-MM-dd")
                };

                db.Registrations.Add(register);

                db.SaveChanges();


                string path = Server.MapPath("~/App_Data/Template/WelcomeMail.html");

                dev.generateTestKeys(account.Email);

                RegistrationMailer.Send(account.FullName, account.Email, GetConstants.RegistrationSubject, path);


                return Json(new { ResponseCode = 00, Message = "Account Created Successfully" }, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public ActionResult ForgotPassword()
        {
            return View();
        }

        public ActionResult SignOut()
        {
            Response.Cookies.Clear();

            Session.Clear();

            Session.Abandon();

            Session.RemoveAll();

            return RedirectToAction("Login", "Account");
        }
    }
}