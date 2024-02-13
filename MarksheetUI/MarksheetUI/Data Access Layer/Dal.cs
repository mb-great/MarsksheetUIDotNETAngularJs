using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MarksheetUI.Models
{
    public class Dal
    {
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);

        public DataSet GetAllSubjects()
        {
            SqlCommand com = new SqlCommand("GetSubjects", con);
            com.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds;
        }

        public DataSet GetTeachers()
        {
            SqlCommand com = new SqlCommand("GetTeacherWithSubjectName", con);
            com.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds;
        }
        public DataSet GetTeachersForSubject(int id)
        {
            SqlCommand com = new SqlCommand("GetTeachersForSubject", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Id", id);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds;
        }

        public DataSet GetStudents()
        {
            SqlCommand com = new SqlCommand("GetStudents", con);
            com.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds;
        }
        public DataSet GetMarks()
        {
            SqlCommand com = new SqlCommand("GetMarkSheetCustom", con);
            com.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds;
        }


        public void CreateSubject(Subject rs)
        {
            SqlCommand com = new SqlCommand("InsertSubject", con);
            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@SubjectName", rs.SubjectName);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }

        public void CreateTeacher(Teacher rs)
        {
            SqlCommand com = new SqlCommand("InsertTeacher", con);
            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@TeacherName", rs.TeacherName);
            com.Parameters.AddWithValue("@Age", rs.Age);
            com.Parameters.AddWithValue("@Gender", rs.Gender);
            com.Parameters.AddWithValue("@Address", rs.Address);
            com.Parameters.AddWithValue("@Speciality", rs.Speciality);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }
        public void CreateStudent(Student rs)
        {
            SqlCommand com = new SqlCommand("InsertStudent", con);
            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@StudentName", rs.StudentName);
            com.Parameters.AddWithValue("@Age", rs.Age);
            com.Parameters.AddWithValue("@Gender", rs.Gender);
            com.Parameters.AddWithValue("@Address", rs.Address);
            com.Parameters.AddWithValue("@ClassId", rs.ClassId);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }
        public void CreateMarks(Mark rs)
        {
            SqlCommand com = new SqlCommand("InsertMarks", con);
            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@StudentId", rs.StudentId);
            com.Parameters.AddWithValue("@TeacherId", rs.TeacherId);
            com.Parameters.AddWithValue("@Marks", rs.Marks);
            com.Parameters.AddWithValue("@SubjectId", rs.SubjectId);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }

        public void DeleteSubject(int id)
         {
            SqlCommand com = new SqlCommand("DeleteSubject", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Id", id);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }

        public void DeleteTeacher(int id)
        {
            SqlCommand com = new SqlCommand("DeleteTeacher", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Id", id);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }
        public void DeleteStudent(int id)
        {
            SqlCommand com = new SqlCommand("DeleteStudent", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Id", id);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }
        public void DeleteMarks(int id)
        {
            SqlCommand com = new SqlCommand("DeleteMarks", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Id", id);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }

        public void UpdateSubject(int id, Subject rs)
        {
            SqlCommand com = new SqlCommand("UpdateSubject", con);
            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@ID", id);
            com.Parameters.AddWithValue("@SubjectName", rs.SubjectName);
            con.Open();

            com.ExecuteNonQuery();
            con.Close();
        }
        public void UpdateTeacher(int id, Teacher rs)
        {
            SqlCommand com = new SqlCommand("UpdateTeacher", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Id", id);
            com.Parameters.AddWithValue("@TeacherName", rs.TeacherName);
            com.Parameters.AddWithValue("@Age", rs.Age);
            com.Parameters.AddWithValue("@Gender", rs.Gender);
            com.Parameters.AddWithValue("@Address", rs.Address);
            com.Parameters.AddWithValue("@Speciality", rs.Speciality);
            con.Open();

            com.ExecuteNonQuery();
            con.Close();
        }
        public void UpdateStudent(int id, Student rs)
        {
            SqlCommand com = new SqlCommand("UpdateStudent", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Id", id);
            com.Parameters.AddWithValue("@StudentName", rs.StudentName);
            com.Parameters.AddWithValue("@Age", rs.Age);
            com.Parameters.AddWithValue("@Gender", rs.Gender);
            com.Parameters.AddWithValue("@Address", rs.Address);
            com.Parameters.AddWithValue("@ClassId", rs.ClassId);
            con.Open();

            com.ExecuteNonQuery();
            con.Close();
        }
        public void UpdateMarks(int id, Mark rs)
        {
            SqlCommand com = new SqlCommand("UpdateMarks", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Id", id);
            com.Parameters.AddWithValue("@StudentId", rs.StudentId);
            com.Parameters.AddWithValue("@TeacherId", rs.TeacherId);
            com.Parameters.AddWithValue("@Marks", rs.Marks);
            com.Parameters.AddWithValue("@SubjectId", rs.SubjectId);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }

    }
}