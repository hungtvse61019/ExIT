
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
    
public partial class Course
{

    public Course()
    {

        this.Registrations = new HashSet<Registration>();

        this.Subjects = new HashSet<Subject>();

    }


    public int ID { get; set; }

    public string name { get; set; }

    public int rank { get; set; }

    public string imgUrl { get; set; }

    public string overview { get; set; }



    public virtual ICollection<Registration> Registrations { get; set; }

    public virtual ICollection<Subject> Subjects { get; set; }

}

}
