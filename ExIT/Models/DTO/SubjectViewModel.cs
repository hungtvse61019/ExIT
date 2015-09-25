using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExIT.Models.DTO
{
    public class SubjectViewModel
    {
        public string SubjectName { get; set; }
        public bool Learned { get; set; }
        public string Status { get; set; }
        public int SubjectId { get; set; }
    }

    public class SubjectOfUser
    {
        public int ID { get; set; }

        public string name { get; set; }

        public string information { get; set; }

        public string PraticalFile { get; set; }

        public string PraticalText { get; set; }

        public int TeacherID { get; set; }

        public int CourseID { get; set; }

        public int NumberOfQuestion { get; set; }

        public int ThesisTime { get; set; }

        public string imgUrl { get; set; }

        public string overview { get; set; }
        public string Status { get; set; }
    }
}