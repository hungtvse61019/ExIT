using ExIT.Models;
using ExIT.Models.DTO;
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

        public ActionResult AllCourses()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult SubjectDetail(int subjectid)
        {
            var subject = db.Subjects.Where(s => s.ID == subjectid).FirstOrDefault();
            return View(subject);
        }
        public ActionResult EnrollCourse(int courseid)
        {
            var courses = db.Courses.Where(s => s.ID == courseid).FirstOrDefault();
            return View(courses);
        }

        [HttpGet]
        public ActionResult AllSubjects(int courseid)
        {
            var subjects = db.Subjects.Where(s => s.CourseID == courseid).ToList();
            if (Session["Rank"]!=null)
            {
                int rank = Convert.ToInt32(Session["Rank"].ToString());
                var username = Session["Username"].ToString();
                var user = db.Users.Where(s => s.username.ToUpper() == username.ToUpper()).FirstOrDefault();
                var course = db.Courses.Where(s => s.ID == courseid).FirstOrDefault();
                var resgis = db.Registrations.Where(s => s.CourseID == courseid && s.StudentID == user.ID).FirstOrDefault();
                if (resgis != null)
                {
                    Session["IsCheck"] = true;
                }
                else
                {
                    Session["IsCheck"] = false;
                }
            }
           
            return View(subjects);
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
                Session["Name"] = user.name;
                Session["Rank"] = user.rank;

                return Json("true", JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json("false", JsonRequestBehavior.AllowGet);
            }
            

        }


        [HttpPost]
        public ActionResult LoadCourseIndex()
        {
            List<CourseViewModel> listcourses = new List<CourseViewModel>();
            var courses = db.Courses.Take(3).ToList();
            foreach (var item in courses)
            {
                CourseViewModel viewmodel = new CourseViewModel();
                viewmodel.CourseName=item.name;
                viewmodel.LinkImg = item.imgUrl;
                viewmodel.CourseId = item.ID;
                var subject = db.Subjects.Where(s => s.CourseID == item.ID).ToList();
                viewmodel.Subjects = new List<SubjectViewModel>();
                foreach (var sub in subject)
                {
                    SubjectViewModel subjectview = new SubjectViewModel();
                    subjectview.SubjectName=sub.name;
                    viewmodel.Subjects.Add(subjectview);
                }
                listcourses.Add(viewmodel);
            }
            return Json(listcourses, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult LoadTeacherIndex()
        {
            var users = db.Users.Where(s => s.roleId == 1).ToList().Select(s => new
            {
                s.name,
                s.imgUrl,
                s.company,
                s.information
            });

            return Json(users, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult LoadAllCourses()
        {
            List<CourseViewModel> listcourses = new List<CourseViewModel>();
            var courses = db.Courses.ToList();
            foreach (var item in courses)
            {
                CourseViewModel viewmodel = new CourseViewModel();
                viewmodel.CourseName = item.name;
                viewmodel.LinkImg = item.imgUrl;
                viewmodel.CourseId = item.ID;
                var subject = db.Subjects.Where(s => s.CourseID == item.ID).ToList();
                viewmodel.Subjects = new List<SubjectViewModel>();
                foreach (var sub in subject)
                {
                    SubjectViewModel subjectview = new SubjectViewModel();
                    subjectview.SubjectName = sub.name;
                    viewmodel.Subjects.Add(subjectview);
                }
                listcourses.Add(viewmodel);
            }
            return Json(listcourses, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Enroll(string couserid)
        {

            if (Session["Username"]!=null)
            {
                int rank = Convert.ToInt32(Session["Rank"].ToString());
                var username = Session["Username"].ToString();
                var user = db.Users.Where(s => s.username.ToUpper() == username.ToUpper()).FirstOrDefault();
                int cid = Convert.ToInt32(couserid.ToString());
                var course = db.Courses.Where(s => s.ID == cid).FirstOrDefault();
                db.Registrations.Add(new Registration
                {
                    CourseID = course.ID,
                    StudentID = user.ID,
                    status=true
                });
                db.SaveChanges();
                return Json("True", JsonRequestBehavior.AllowGet);
            }
            return Json("False", JsonRequestBehavior.AllowGet);
           
        }

        [HttpPost]
        public ActionResult CheckIsRegister(string couserid)
        {
            if (Session["Username"] != null)
            {
                int rank = Convert.ToInt32(Session["Rank"].ToString());
                var username = Session["Username"].ToString();
                var user = db.Users.Where(s => s.username.ToUpper() == username.ToUpper()).FirstOrDefault();
                int cid = Convert.ToInt32(couserid.ToString());
                var course = db.Courses.Where(s => s.ID == cid).FirstOrDefault();
                var resgis = db.Registrations.Where(s => s.CourseID == cid && s.StudentID == user.ID).FirstOrDefault();
                if (resgis!=null)
                {
                    return Json("True", JsonRequestBehavior.AllowGet);
                }
            }
            return Json("False", JsonRequestBehavior.AllowGet);
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