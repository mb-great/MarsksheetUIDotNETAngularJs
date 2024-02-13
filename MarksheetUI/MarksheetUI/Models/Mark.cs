using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarksheetUI.Models
{
    public class Mark
    {
            public int MarkSheetId{get; set;} 
            public decimal Marks{get; set;}   
            public int StudentId{get; set;} 
            public string StudentName{get; set;}
            public int TeacherId{get; set;}
            public string TeacherName{get; set;}
            public int SubjectId{get; set;} 
            public string SubjectName{get; set;}
            public int ClassId { get; set; }

    }
}