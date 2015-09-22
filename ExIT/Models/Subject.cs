//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ExIT.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Subject
    {
        public Subject()
        {
            this.Examinations = new HashSet<Examination>();
            this.SubjectQuestions = new HashSet<SubjectQuestion>();
        }
    
        public int ID { get; set; }
        public string name { get; set; }
        public string information { get; set; }
        public string PraticalFile { get; set; }
        public string PraticalText { get; set; }
        public int TeacherID { get; set; }
        public int CourseID { get; set; }
        public int NumberOfQuestion { get; set; }
        public int ThesisTime { get; set; }
    
        public virtual Course Course { get; set; }
        public virtual ICollection<Examination> Examinations { get; set; }
        public virtual Teacher Teacher { get; set; }
        public virtual ICollection<SubjectQuestion> SubjectQuestions { get; set; }
    }
}
