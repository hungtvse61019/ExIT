﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExIT.Models.DTO
{
    public class CourseViewModel
    {
        public string CourseName { get; set; }
        public int Learn { get; set; }
        public string LinkImg { get; set; }
        public int CourseId { get; set; }
        public int Rank { get; set; }
        public List<SubjectViewModel> Subjects { get; set; }
    }
}