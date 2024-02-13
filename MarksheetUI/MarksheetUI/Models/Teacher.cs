using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarksheetUI.Models
{
    public class Teacher
    {
        public int TeacherId { get; set; }
       	public string TeacherName { get; set; }
        public int Age { get; set; }
        public string Gender { get; set; }
        public string Address { get; set; }
        public int Speciality { get; set; }
        public string SubjectName { get; set; }

    }
}