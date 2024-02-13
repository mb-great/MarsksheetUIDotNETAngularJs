using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarksheetUI.Models
{
    public class Student
    {
       public int StudentId { get; set; }
       public string StudentName  {get; set;}
       public int Age  {get; set;}
       public string Gender  {get; set;}
       public string Address {get; set;}
       public int ClassId {get; set;}
    }
}