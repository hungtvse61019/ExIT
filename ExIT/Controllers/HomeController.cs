using ExIT.Models;
using ExIT.Models.DTO;
using System;
using System.Collections.Generic;
using System.IO;
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

        public ActionResult FinalResult(int subjectid)
        {
            var username = Session["Username"].ToString();
            var user = db.Users.Where(s => s.username.ToUpper() == username.ToUpper()).FirstOrDefault();
            var exam = db.Examinations.Where(s => s.SubjectID == subjectid && s.StudentID == user.ID).FirstOrDefault();
            string status = "Chua Hoan Thanh Het";
            if (exam != null)
            {
                if (exam.PraticalScore != null && exam.ThesisScore != null)
                {
                    if (exam.PraticalScore >= 5 && exam.ThesisScore >= 5)
                    {
                        status = "Pass";
                    }
                    else
                    {
                        status = "Fail";
                    }
                }

            }
            ViewBag.Status = status;
            return View(exam);
        }

        [HttpPost]
        public ActionResult CheckAnswer(string value, string subjectid, string remain)
        {
            string val = "";
            if (value.EndsWith(";"))
            {
                val = value.Substring(0, value.Length - 1);
            }
            var count = 0.0;
            var split = val.Split(';');
            for (int i = 0; i < split.Length; i++)
            {
                if (split[i].Length > 0)
                {
                    var splitem = split[i].Split('-');
                    int question = Convert.ToInt32(splitem[0]);
                    var answer = db.SubjectAnswers.Where(s => s.SubjectQuestionID == question && s.result == true).FirstOrDefault();
                    int checkanswer = Convert.ToInt32(splitem[1]);
                    if (checkanswer == answer.ID)
                    {
                        count++;
                    }
                }
            }
            int sid = Convert.ToInt32(subjectid);
            var username = Session["Username"].ToString();
            var user = db.Users.Where(s => s.username.ToUpper() == username.ToUpper()).FirstOrDefault();

            var examination = db.Examinations.Where(s => s.StudentID == user.ID && s.SubjectID == sid).FirstOrDefault();
            if (examination != null)
            {
                examination.ThesisScore = (float)(Convert.ToDouble(count / numberQ)) * 10;
                if (examination.PraticalScore != null)
                {
                    if (examination.PraticalScore > 5 && ((float)(Convert.ToDouble(count / numberQ)) * 10) > 5)
                    {
                        examination.status = 1;
                    }
                }
                examination.ThesisDoneTime = remain;
            }
            else
            {
                db.Examinations.Add(new Examination
                {
                    SubjectID = sid,
                    StudentID = user.ID,
                    status = 0,
                    ThesisScore = (float)(Convert.ToDouble(count / numberQ)) * 10,
                    ThesisDoneTime = remain
                });
            }

            var pass = AllPass(user.ID, sid);
            if (pass == true)
            {
                user.rank = user.rank + 1;
            }
            db.SaveChanges();
            return Json("true", JsonRequestBehavior.AllowGet);
            //return RedirectToAction("ResultQuiz", new { subjectid = sid });
        }

        public Boolean AllPass(int studentid, int subjectid)
        {
            var subject = db.Subjects.Where(s => s.ID == subjectid).FirstOrDefault();
            var user = db.Users.Where(s => s.ID == studentid).FirstOrDefault();
            var course = db.Courses.Where(s => s.ID == subject.CourseID && s.rank == user.rank).FirstOrDefault();

            var allsubject = db.Subjects.Where(s => s.CourseID == course.ID).ToList();
            var count = allsubject.Count();
            foreach (var subj in allsubject)
            {
                var examination = db.Examinations.Where(s => s.SubjectID == subj.ID && s.StudentID == studentid).FirstOrDefault();
                if (examination != null)
                {
                    if (examination.status == 1)
                    {
                        count--;
                    }
                }

            }

            if (count > 0)
            {
                return false;
            }
            return true;
        }

        public ActionResult Marking(int studentid, int subjectid, float mark)
        {

            var user = db.Users.Where(s => s.ID == studentid).FirstOrDefault();
            var examination = db.Examinations.Where(s => s.StudentID == studentid && s.SubjectID == subjectid).FirstOrDefault();
            if (examination != null)
            {
                if (examination.ThesisScore > 5 && mark > 5)
                {
                    examination.status = 1;
                }
                else
                {
                    examination.status = 0;
                }
                examination.PraticalScore = mark;
            }
            else
            {
                db.Examinations.Add(new Examination
                {
                    SubjectID = subjectid,
                    StudentID = studentid,
                    status = 0,
                    PraticalScore = mark
                });
            }
            db.SaveChanges();
            var pass = AllPass(studentid, subjectid);
            if (pass == true)
            {
                user.rank = user.rank + 1;
            }
            db.SaveChanges();
            return Json("true", JsonRequestBehavior.AllowGet);
        }


        public ActionResult ResultQuiz(int subjectid)
        {
            var username = Session["Username"].ToString();
            var user = db.Users.Where(s => s.username.ToUpper() == username.ToUpper()).FirstOrDefault();
            var examination = db.Examinations.Where(s => s.StudentID == user.ID && s.SubjectID == subjectid).FirstOrDefault();
            ViewBag.Result = "Fail";
            if (examination.ThesisScore >= 5)
            {
                ViewBag.Result = "Pass";
            }
            else
            {
                ViewBag.Result = "Fail";
            }
            int correctAns = (int)((examination.ThesisScore * numberQ) / 10.0);
            ViewBag.Time = examination.ThesisDoneTime;
            ViewBag.SubjectName = examination.Subject.name;
            ViewBag.NumberOfQuestion = numberQ;
            ViewBag.CorrectAns = correctAns;
            string message = "";
            if (examination.ThesisScore > 5)
            {
                message = "Chúc mừng bạn, bạn đã vượt qua bài kiểm tra!";
            }
            else
            {
                message = "Rất tiếc, bạn đã không vượt qua bài kiểm tra!";
            }
            ViewBag.Message = message;
            return View(examination);
        }
        public ActionResult Register()
        {
            return View();
        }
        private static int numberQ = 5;

        public ActionResult Quiz(int subjectid)
        {
            List<QuestionViewModel> questions = new List<QuestionViewModel>();
            var quests = db.SubjectQuestions.Where(s => s.SubjectID == subjectid).Take(numberQ).ToList();
            foreach (var ques in quests)
            {
                QuestionViewModel view = new QuestionViewModel();
                view.QuestionId = ques.ID;
                view.QuestionContent = ques.question;
                view.Answers = new List<AnswerViewModel>();
                var answers = db.SubjectAnswers.Where(s => s.SubjectQuestionID == ques.ID).ToList();
                foreach (var ans in answers)
                {
                    AnswerViewModel ansv = new AnswerViewModel();
                    ansv.AnswerId = ans.ID;
                    ansv.AnswerContent = ans.answer;
                    view.Answers.Add(ansv);
                }
                view.Answers = RandomPermutation(view.Answers);

                questions.Add(view);
            }
            ViewBag.subjectid = subjectid;
            questions = RandomPermutation(questions);
            return View(questions);
        }

        public List<T> RandomPermutation<T>(List<T> array)
        {
            Random random = new Random();
            List<T> retArray = new List<T>(array);

            int maxIndex = array.Count - 1;

            for (int i = 0; i <= maxIndex; i++)
            {
                int swapIndex = random.Next(i, maxIndex);
                if (swapIndex != i)
                {
                    T temp = retArray[i];
                    retArray[i] = retArray[swapIndex];
                    retArray[swapIndex] = temp;
                }
            }
            return retArray;
        }


        [HttpPost]
        public ActionResult Upload(HttpPostedFileBase file, string subjectid)
        {
            int cid = Convert.ToInt32(subjectid);
            if (file.ContentLength > 0)
            {
                var fileName = Path.GetFileName(file.FileName);
                var username = Session["Username"].ToString();
                var newname = fileName.Substring(0, fileName.IndexOf(".")) + username + ".rar";

                var user = db.Users.Where(s => s.username.ToUpper() == username.ToUpper()).FirstOrDefault();
                var path = Path.Combine(Server.MapPath("~/Content/Upload"), newname);
                file.SaveAs(path);
                var examnination = db.Examinations.Where(s => s.StudentID == user.ID && s.SubjectID == cid).FirstOrDefault();
                if (examnination != null)
                {
                    examnination.PracticalFile = "~/Content/Upload" + "/" + newname;
                    examnination.PraticalDoneTime = DateTime.Now.ToString("dd/MM/yyyy HH:mm:Ss");
                }
                else
                {
                    db.Examinations.Add(new Examination
                    {
                        SubjectID = cid,
                        StudentID = user.ID,
                        status = 0,
                        PracticalFile = "/Content/Upload" + "/" + newname,
                        PraticalDoneTime=DateTime.Now.ToString("dd/MM/yyyy HH:mm:Ss")
                    });

                }
                db.SaveChanges();
            }
            return RedirectToAction("Practical", new { subjectid = cid });
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult AllCourses()
        {
            return View();
        }


        public ActionResult Practical(int subjectid)
        {
            var subject = db.Subjects.Where(s => s.ID == subjectid).FirstOrDefault();
            return View(subject);
        }

        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult SubjectDetail(int subjectid)
        {
            var subject = db.Subjects.Where(s => s.ID == subjectid).FirstOrDefault();
            if (Session["Username"] != null)
            {
                var username = Session["Username"].ToString();
                var user = db.Users.Where(s => s.username.ToUpper() == username.ToUpper()).FirstOrDefault();
                var examnination = db.Examinations.Where(s => s.StudentID == user.ID && s.SubjectID == subjectid).FirstOrDefault();
                if (examnination != null)
                {
                    if (examnination.status == 1)
                    {
                        ViewBag.Result = "PASS";
                    }
                    else
                    {
                        ViewBag.Result = "False";
                    }
                }
            }

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
            int userid = -1;
            if (Session["Rank"] != null)
            {
                int rank = Convert.ToInt32(Session["Rank"].ToString());
                var username = Session["Username"].ToString();
                var user = db.Users.Where(s => s.username.ToUpper() == username.ToUpper()).FirstOrDefault();
                userid = user.ID;
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
            List<SubjectOfUser> subs = new List<SubjectOfUser>();
            foreach (var sub in subjects)
            {
                string status = "";
                if (userid != -1)
                {
                    var exam = db.Examinations.Where(s => s.StudentID == userid && s.SubjectID == sub.ID).FirstOrDefault();
                    if (exam != null)
                    {
                        if (exam.ThesisScore!=null&&exam.PraticalScore!=null)
                        {
                            if (exam.ThesisScore >= 5 && exam.PraticalScore >= 5)
                            {
                                status = "PASS";
                            }
                            else
                            {
                                status = "FAIL";

                            }
                        }
                        else
                        {
                            status = "LEARNING";
                        }
                       


                    }
                }
                subs.Add(new SubjectOfUser
                {
                    ID = sub.ID,
                    CourseID = sub.CourseID,
                    imgUrl = sub.imgUrl,
                    name = sub.name,
                    Status = status
                });
            }

            return View(subs);
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
                password = password,
                roleId = 2,
                rank = 1
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
                s.password == password).FirstOrDefault();
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
            int userid = -1;
            if (Session["Username"] != null)
            {
                
                var username = Session["Username"].ToString();
                var user = db.Users.Where(s => s.username.ToUpper() == username.ToUpper()).FirstOrDefault();
                userid = user.ID;
            }
            foreach (var item in courses)
            {
                bool learn = false;
                if (userid != -1)
                {
                    var registation = db.Registrations.Where(s => s.StudentID == userid && s.CourseID == item.ID).FirstOrDefault();

                    if (registation != null)
                    {
                        learn = true;
                    }
                }
                CourseViewModel viewmodel = new CourseViewModel();
                viewmodel.CourseName = item.name;
                viewmodel.Learn = learn;
                viewmodel.LinkImg = item.imgUrl;
                viewmodel.CourseId = item.ID;
                var subject = db.Subjects.Where(s => s.CourseID == item.ID).Take(7).ToList();
                viewmodel.Subjects = new List<SubjectViewModel>();
                foreach (var sub in subject)
                {
                    bool leanred = false;
                    string status = "";
                    if (userid != -1)
                    {
                        var examination = db.Examinations.Where(s => s.StudentID == userid && s.SubjectID == sub.ID).FirstOrDefault();
                        if (examination != null)
                        {
                            if (examination.ThesisScore != null && examination.PraticalScore != null)
                            {
                                if (examination.ThesisScore >= 5 && examination.PraticalScore >= 5)
                                {
                                    status = "Pass";
                                }
                                else
                                {
                                    status = "Fail";
                                }

                            }
                            else
                            {
                                status = "Learning";
                            }
                        }
                    }
                    SubjectViewModel subjectview = new SubjectViewModel();
                    subjectview.SubjectName = sub.name;
                    subjectview.Learned = leanred;
                    subjectview.Status = status;
                    subjectview.SubjectId = sub.ID;
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
            int userid = -1;
            if (Session["Username"] != null)
            {

                var username = Session["Username"].ToString();
                var user = db.Users.Where(s => s.username.ToUpper() == username.ToUpper()).FirstOrDefault();
                userid = user.ID;
            }
            foreach (var item in courses)
            {
                bool learn = false;
                if (userid != -1)
                {
                    var registation = db.Registrations.Where(s => s.StudentID == userid && s.CourseID == item.ID).FirstOrDefault();

                    if (registation != null)
                    {
                        learn = true;
                    }
                }
                CourseViewModel viewmodel = new CourseViewModel();
                viewmodel.CourseName = item.name;
                viewmodel.Learn = learn;
                viewmodel.LinkImg = item.imgUrl;
                viewmodel.CourseId = item.ID;
                var subject = db.Subjects.Where(s => s.CourseID == item.ID).Take(7).ToList();
                viewmodel.Subjects = new List<SubjectViewModel>();
                foreach (var sub in subject)
                {
                    bool leanred = false;
                    string status = "";
                    if (userid != -1)
                    {
                        var examination = db.Examinations.Where(s => s.StudentID == userid && s.SubjectID == sub.ID).FirstOrDefault();
                        if (examination != null)
                        {
                            if (examination.ThesisScore != null && examination.PraticalScore != null)
                            {
                                if (examination.ThesisScore >= 5 && examination.PraticalScore >= 5)
                                {
                                    status = "Pass";
                                }
                                else
                                {
                                    status = "Fail";
                                }

                            }
                            else
                            {
                                status = "Learning";
                            }
                        }
                    }
                    SubjectViewModel subjectview = new SubjectViewModel();
                    subjectview.SubjectName = sub.name;
                    subjectview.Learned = leanred;
                    subjectview.Status = status;
                    subjectview.SubjectId = sub.ID;
                    viewmodel.Subjects.Add(subjectview);
                }
                listcourses.Add(viewmodel);
            }
            return Json(listcourses, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Enroll(string couserid)
        {

            if (Session["Username"] != null)
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
                    status = true
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
                if (resgis != null)
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
            if (student != null)
            {
                return false;
            }
            return true;
        }

        [HttpPost]
        public ActionResult LoadAllPracticals(string username)
        {
            var teacher = db.Users.Where(s => s.username.ToUpper() == username.ToUpper()).FirstOrDefault();
            var subjects = db.Subjects.Where(s => s.TeacherID == teacher.ID).ToList().Select(s => new
            {
                s.name,
                s.ID
            });
            return Json(subjects, JsonRequestBehavior.AllowGet);
        }

        //[HttpPost]
        public ActionResult MarkingPratical(int subjectid)
        {
            var exams = db.Examinations.Where(s => s.SubjectID == subjectid && s.PracticalFile != null).ToList();
            var subject = db.Subjects.Where(s => s.ID == subjectid).FirstOrDefault();
            ViewBag.Subject = subject.name;
            ViewBag.Course = subject.Course.name;
            return View(exams);
        }
    }
}