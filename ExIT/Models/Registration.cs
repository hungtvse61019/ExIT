
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
    
public partial class Registration
{

    public int StudentID { get; set; }

    public int CourseID { get; set; }

    public int status { get; set; }



    public virtual Course Course { get; set; }

    public virtual User User { get; set; }

}

}
