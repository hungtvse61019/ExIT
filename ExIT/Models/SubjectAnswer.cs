
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
    
public partial class SubjectAnswer
{

    public SubjectAnswer()
    {

        this.SubjectQuestions = new HashSet<SubjectQuestion>();

    }


    public int ID { get; set; }

    public string answer { get; set; }

    public bool result { get; set; }

    public int SubjectQuestionID { get; set; }



    public virtual ICollection<SubjectQuestion> SubjectQuestions { get; set; }

}

}
