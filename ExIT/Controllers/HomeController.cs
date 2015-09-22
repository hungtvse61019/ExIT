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

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RegisterAccount(string name, string username, string password, string address, string phone, 
            string email)
        {
            db.Users.Add(new User()
            {
                username = username,
                address = address,
                email = email,
                password=password,
                roleId = 2,
                rank=1
            });
            db.SaveChanges();
            Session["UserName"] = username;
            Session["Role"] = 2;
            return Json("true", JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult CheckLogin(string username, string password)
        {
            var user = db.Users.Where(s => s.username.ToUpper() == username.ToUpper() && 
                s.password==password).FirstOrDefault();
            if (user != null)
            {
                Session["UserName"] = user.username;
                Session["Role"] = user.roleId;
                return Json("true", JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json("false", JsonRequestBehavior.AllowGet);
            }
            

        }

        [HttpPost]
        public Boolean CheckUserName(string username)
        {
            var student = db.Users.Where(s => s.username.ToUpper() == username.ToUpper()).FirstOrDefault();
            if (student!=null)
            {
                return false;
            }
            return true;
        }


    }
}