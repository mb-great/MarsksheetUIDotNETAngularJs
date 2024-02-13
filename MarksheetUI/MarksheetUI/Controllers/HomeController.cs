using MarksheetUI.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MarksheetUI.Controllers
{
    public class HomeController : Controller
    {
        Dal dblayer = new Dal();
        
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetAllSubjects()
        {
            DataSet ds = dblayer.GetAllSubjects();
            List<Subject> listrs = new List<Subject>();

            foreach(DataRow dr in ds.Tables[0].Rows)
            {
                Subject subject = new Subject
                {
                    SubjectId = (int)dr["SubjectId"],
                    SubjectName = dr["SubjectName"].ToString()
                };
                listrs.Add(subject);
            }
            return Json(listrs, JsonRequestBehavior.AllowGet);

        }

        public JsonResult GetTeachers()
        {
            DataSet ds = dblayer.GetTeachers();
            List<Teacher> listrs = new List<Teacher>();

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Teacher teacher = new Teacher
                {
                    TeacherId = (int)dr["TeacherId"],
                    TeacherName = dr["TeacherName"].ToString(),
                    Age = (int)dr["Age"],
                    Gender = dr["Gender"].ToString(),
                    Address = dr["Address"].ToString(),
                    Speciality = (int)dr["Speciality"],
                    SubjectName = dr["SubjectName"].ToString()
                };
                listrs.Add(teacher);
            }
            return Json(listrs, JsonRequestBehavior.AllowGet);

        }
        //TeacherId TeacherName Age Gender  Address Speciality  SubjectId SubjectName
        public JsonResult GetTeachersForSubject(int id)
        {
            DataSet ds = dblayer.GetTeachersForSubject(id);
            List<Teacher> listrs = new List<Teacher>();

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Teacher teacher = new Teacher
                {
                    TeacherId = (int)dr["TeacherId"],
                    TeacherName = dr["TeacherName"].ToString(),
                    Age = (int)dr["Age"],
                    Gender = dr["Gender"].ToString(),
                    Address = dr["Address"].ToString(),
                    Speciality = (int)dr["Speciality"],
                    SubjectName = dr["SubjectName"].ToString()
                };
                listrs.Add(teacher);
            }
            return Json(listrs, JsonRequestBehavior.AllowGet);

        }

        public JsonResult GetStudents()
        {
            DataSet ds = dblayer.GetStudents();
            List<Student> listrs = new List<Student>();

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Student student = new Student
                {
                    StudentId = (int)dr["StudentId"],
                    StudentName = dr["StudentName"].ToString(),
                    Age = (int)dr["Age"],
                    Gender = dr["Gender"].ToString(),
                    Address = dr["Address"].ToString(),
                    ClassId = (int)dr["ClassId"],
                };
                listrs.Add(student);
            }
            return Json(listrs, JsonRequestBehavior.AllowGet);

        }

        public JsonResult GetMarks()
        {
            DataSet ds = dblayer.GetMarks();
            List<Mark> listrs = new List<Mark>();

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Mark mark = new Mark
                {
                    MarkSheetId = (int)dr["MarkSheetId"],
                    Marks = (decimal)dr["Marks"],
                    StudentId = (int)dr["StudentId"],
                    StudentName =dr["StudentName"].ToString(),
                    TeacherId = (int)dr["TeacherId"],
                    TeacherName = dr["TeacherName"].ToString(),
                    SubjectId = (int)dr["SubjectId"],
                    SubjectName = dr["SubjectName"].ToString(),
                    ClassId = (int)dr["ClassId"]
                };
                listrs.Add(mark);
            }
            return Json(listrs, JsonRequestBehavior.AllowGet);

        }


        [HttpPost]
        public JsonResult CreateSubject(Subject rs)
        {
            string res = string.Empty;
            try
            {
                dblayer.CreateSubject(rs);
                res = "Successfully Inserted...!";
            }
            catch
            {
                res = "Failed";
            }
            return Json(res, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult CreateTeacher(Teacher rs)
        {
            string res = string.Empty;
            try
            {
                dblayer.CreateTeacher(rs);
                res = "Successfully Inserted...!";
            }
            catch
            {
                res = "Failed";
            }
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CreateStudent(Student rs)
        {
            string res = string.Empty;
            try
            {
                dblayer.CreateStudent(rs);
                res = "Successfully Inserted...!";
            }
            catch
            {
                res = "Failed";
            }
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CreateMarks(Mark rs)
        {
            string res = string.Empty;
            try
            {
                dblayer.CreateMarks(rs);
                res = "Successfully Inserted...!";
            }
            catch
            {
                res = "Failed";
            }
            return Json(res, JsonRequestBehavior.AllowGet);
        }



        [HttpPost]
        public JsonResult UpdateSubject(int id, Subject rs)
        {
            string res = string.Empty;
            try
            {
                dblayer.UpdateSubject(id, rs);
                res = "Successfully Updated...!";
            }
            catch
            {
                res = "Failed";
            }
            return Json(res, JsonRequestBehavior.AllowGet);
        }

        public JsonResult UpdateTeacher(int id, Teacher rs)
        {
            string res = string.Empty;
            try
            {
                dblayer.UpdateTeacher(id, rs);
                res = "Successfully Updated...!";
            }
            catch
            {
                res = "Failed";
            }
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        public JsonResult UpdateStudent(int id, Student rs)
        {
            string res = string.Empty;
            try
            {
                dblayer.UpdateStudent(id, rs);
                res = "Successfully Updated...!";
            }
            catch
            {
                res = "Failed";
            }
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        public JsonResult UpdateMarks(int id, Mark rs)
        {
            string res = string.Empty;
            try
            {
                dblayer.UpdateMarks(id, rs);
                res = "Successfully Updated...!";
            }
            catch
            {
                res = "Failed";
            }
            return Json(res, JsonRequestBehavior.AllowGet);
        }


        public JsonResult DeleteSubject(int id)
        {

            string res = string.Empty;
            try
            {
                dblayer.DeleteSubject(id);
                res = "data deleted";
            }
            catch (Exception)
            {
                res = "failed";
            }
            return Json(res, JsonRequestBehavior.AllowGet);
        }

        public JsonResult DeleteTeacher(int id)
        {

            string res = string.Empty;
            try
            {
                dblayer.DeleteTeacher(id);
                res = "data deleted";
            }
            catch (Exception)
            {
                res = "failed";
            }
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DeleteStudent(int id)
        {

            string res = string.Empty;
            try
            {
                dblayer.DeleteStudent(id);
                res = "data deleted";
            }
            catch (Exception)
            {
                res = "failed";
            }
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DeleteMarks(int id)
        {

            string res = string.Empty;
            try
            {
                dblayer.DeleteMarks(id);
                res = "data deleted";
            }
            catch (Exception)
            {
                res = "failed";
            }
            return Json(res, JsonRequestBehavior.AllowGet);
        }


    }
}
