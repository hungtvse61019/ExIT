using ExIT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExIT.Controllers
{
    public class HomeController : Controller
    {
        private ExpITEntities db;
        public HomeController()
        {
            db = new ExpITEntities();
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RegisterAccount(string name, string username, string password, string address, string phone, 
            string email)
        {
            db.Students.Add(new Student()
            {
                username = username,
                address = address,
                email = email,
                password=password,
                rank=1
            });
            db.SaveChanges();
            Session["UserName"] = username;
            Session["Role"] = "Student";
            return Json("true", JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public Boolean CheckUserName(string username)
        {
            var student = db.Students.Where(s => s.username.ToUpper() == username.ToUpper()).FirstOrDefault();
            if (student!=null)
            {
                return false;
            }
            return true;
        }


    }
}