using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ExIT.Models.DTO
{
    public class QuestionViewModel
    {
        public int QuestionId { get; set; }
        public string QuestionContent { get; set; }
        public List<AnswerViewModel> Answers { get; set; }

    }

    public class AnswerViewModel
    {
        public int AnswerId { get; set; }
        public string AnswerContent { get; set; }
    }
}
