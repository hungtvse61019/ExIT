
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
    
public partial class Examination
{

    public int StudentID { get; set; }

    public int SubjectID { get; set; }

    public Nullable<float> PraticalScore { get; set; }

    public Nullable<float> ThesisScore { get; set; }

    public Nullable<int> status { get; set; }

    public string ThesisDoneTime { get; set; }

    public string PraticalDoneTime { get; set; }

    public string PracticalFile { get; set; }



    public virtual User User { get; set; }

    public virtual Subject Subject { get; set; }

}

}
