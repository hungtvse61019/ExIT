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
    
    public partial class Student
    {
        public Student()
        {
            this.Examinations = new HashSet<Examination>();
            this.Registrations = new HashSet<Registration>();
        }
    
        public int ID { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string address { get; set; }
        public string email { get; set; }
        public Nullable<int> rank { get; set; }
    
        public virtual ICollection<Examination> Examinations { get; set; }
        public virtual ICollection<Registration> Registrations { get; set; }
    }
}
