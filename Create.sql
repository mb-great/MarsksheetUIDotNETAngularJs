use MarkSheetUi20240115

--Subject
create proc InsertSubject
	@SubjectName VARCHAR(100)
AS 
BEGIN 
	DECLARE @Id int, @CreatedDateTime DATETIME = getdate(),	@CreatedBy INT = NULL,	@ModifiedDateTime DATETIME = NULL,	@ModifiedBy int = NULL
    -- Find the maximum Id in the Employee table
    SELECT @Id = ISNULL(MAX(SubjectId), 0) + 1
    FROM Subject
	insert into Subject(SubjectId,	SubjectName	,CreatedDateTime	,CreatedBy	,ModifiedDateTime	,ModifiedBy)
	values(@Id,	@SubjectName	,@CreatedDateTime	,@CreatedBy	,@ModifiedDateTime	,@ModifiedBy)
END   

------------------@SubjectName VARCHAR(100)
exec InsertSubject 'English'
exec InsertSubject 'Physics'
exec InsertSubject 'Chemistry'
exec InsertSubject 'Maths'
exec InsertSubject 'Computer Science'




--Student
create proc InsertStudent
	@StudentName varchar(100)	,
	@Age int	,
	@Gender	varchar(20),
	@Address	varchar(200),
	@ClassId INT
AS 
BEGIN 
	DECLARE @Id int, @CreatedDateTime DATETIME = getdate(),	@CreatedBy INT = NULL,	@ModifiedDateTime DATETIME = NULL,	@ModifiedBy int = NULL
    -- Find the maximum Id in the Employee table
    SELECT @Id = ISNULL(MAX(StudentId), 0) + 1
    FROM Student
	insert into Student(StudentId	,StudentName	,Age	,Gender	,Address	,ClassId	,CreatedDateTime	,CreatedBy	,ModifiedDateTime	,ModifiedBy)
	values(@Id	,@StudentName	,@Age	,@Gender	,@Address	,@ClassId	,@CreatedDateTime	,@CreatedBy	,@ModifiedDateTime	,@ModifiedBy)
END

--@StudentName @Age @Gender @Address @ClassId 
exec InsertStudent 'Aarav Sharma', 20, 'Male', 'Delhi', 1
exec InsertStudent 'Diya Patel', 21, 'Female', 'Maharashtra', 2
exec InsertStudent 'Arjun Kumar', 22, 'Male', 'Karnataka', 3
exec InsertStudent 'Ananya Singh', 23, 'Female', 'West Bengal', 4
exec InsertStudent 'Aryan Yadav', 24, 'Male', 'Tamil Nadu', 5
exec InsertStudent 'Zara Reddy', 25, 'Female', 'Telangana', 1
exec InsertStudent 'Kabir Singh', 26, 'Male', 'Gujarat', 2
exec InsertStudent 'Vihaan Verma', 27, 'Male', 'Rajasthan', 3
exec InsertStudent 'Anika Joshi', 28, 'Female', 'Uttar Pradesh', 4
exec InsertStudent 'Aisha Gupta', 29, 'Female', 'Delhi', 5
exec InsertStudent 'Kabir Sharma', 30, 'Male', 'Maharashtra', 1
exec InsertStudent 'Siya Singh', 31, 'Female', 'Karnataka', 2
exec InsertStudent 'Aarav Verma', 32, 'Male', 'West Bengal', 3
exec InsertStudent 'Ishita Patel', 33, 'Female', 'Tamil Nadu', 4
exec InsertStudent 'Rohan Kumar', 34, 'Male', 'Telangana', 5
exec InsertStudent 'Anvi Yadav', 35, 'Female', 'Gujarat', 1
exec InsertStudent 'Aryan Singh', 36, 'Male', 'Rajasthan', 2
exec InsertStudent 'Riya Verma', 37, 'Female', 'Uttar Pradesh', 3
exec InsertStudent 'Sahil Joshi', 38, 'Male', 'Delhi', 4
exec InsertStudent 'Pari Sharma', 39, 'Female', 'Maharashtra', 5



--Teacher
create proc InsertTeacher
	@TeacherName varchar(100)	,
	@Age int	,
	@Gender	varchar(20),
	@Address	varchar(200),
	@Speciality int
AS 
BEGIN 
	DECLARE @Id int, @CreatedDateTime DATETIME = getdate(),	@CreatedBy INT = null,	@ModifiedDateTime DATETIME = NULL,	@ModifiedBy int = NULL
    -- Find the maximum Id in the Employee table
    SELECT @Id = ISNULL(MAX(TeacherId), 0) + 1
    FROM Teacher
	insert into Teacher(TeacherId ,TeacherName ,Age ,Gender	,Address, Speciality 	,CreatedDateTime	,CreatedBy	,ModifiedDateTime	,ModifiedBy)
	values(@Id	,@TeacherName	,@Age	,@Gender	,@Address,	@Speciality,	@CreatedDateTime	,@CreatedBy	,@ModifiedDateTime	,@ModifiedBy)
END

--@TeacherName	,@Age	,@Gender	,@Address,	@Speciality,,	@CreatedDateTime	,@CreatedBy	,@ModifiedDateTime	,@ModifiedBy
exec InsertTeacher 'Mrs. Gupta', 30, 'Female', 'Delhi', 1
exec InsertTeacher 'Mr. Kumar', 32, 'Male', 'Maharashtra', 2
exec InsertTeacher 'Mrs. Reddy', 35, 'Female', 'Karnataka', 3
exec InsertTeacher 'Mr. Singh', 28, 'Male', 'West Bengal', 4
exec InsertTeacher 'Mrs. Verma', 31, 'Female', 'Tamil Nadu', 5




--Marksheet
create proc InsertMarks
	@StudentId int ,
	@TeacherId int,
	@Marks decimal(5,2),
	@SubjectId int
AS 
BEGIN 
	DECLARE @Id int, @CreatedDateTime DATETIME = getdate(),	@CreatedBy INT = NULL,	@ModifiedDateTime DATETIME = NULL,	@ModifiedBy int = NULL
    -- Find the maximum Id in the Employee table
    SELECT @Id = ISNULL(MAX(MarkSheetId), 0) + 1
    FROM MarkSheet
	insert into MarkSheet(MarkSheetId ,StudentId ,TeacherId ,Marks,CreatedDateTime	,CreatedBy	,ModifiedDateTime,ModifiedBy,SubjectId)
	values(@Id ,@StudentId ,@TeacherId ,@Marks,@CreatedDateTime	,@CreatedBy	,@ModifiedDateTime	,@ModifiedBy,@SubjectId)
END

--StudentId	TeacherId	Marks, SubjectId	CreatedDateTime	CreatedBy	ModifiedDateTime	ModifiedBy

exec InsertMarks 1, 1, 85.9, 5  -- Computer Science
exec InsertMarks 2, 2, 78.5, 4  -- Maths
exec InsertMarks 3, 3, 92.0, 3  -- Chemistry
exec InsertMarks 4, 4, 88.3, 2  -- Physics
exec InsertMarks 5, 5, 94.6, 1  -- English
exec InsertMarks 6, 1, 86.2, 5  -- Computer Science
exec InsertMarks 7, 2, 89.7, 4  -- Maths
exec InsertMarks 8, 3, 93.8, 3  -- Chemistry
exec InsertMarks 9, 4, 80.5, 2  -- Physics
exec InsertMarks 10, 5, 87.9, 1 -- English
exec InsertMarks 11, 1, 85.9, 5 -- Computer Science
exec InsertMarks 12, 2, 78.5, 4 -- Maths
exec InsertMarks 13, 3, 92.0, 3 -- Chemistry
exec InsertMarks 14, 4, 88.3, 2 -- Physics
exec InsertMarks 15, 5, 94.6, 1 -- English
exec InsertMarks 16, 1, 86.2, 5 -- Computer Science
exec InsertMarks 17, 2, 89.7, 4 -- Maths
exec InsertMarks 18, 3, 93.8, 3 -- Chemistry
exec InsertMarks 19, 4, 80.5, 2 -- Physics
exec InsertMarks 20, 5, 87.9, 1 -- English
exec InsertMarks 1, 5, 85.9, 5  -- Computer Science
exec InsertMarks 2, 4, 78.5, 4  -- Maths
exec InsertMarks 4, 3, 92.0, 3  -- Chemistry
exec InsertMarks 4, 4, 88.3, 4  -- Physics
exec InsertMarks 5, 1, 94.6, 1  -- English











































-- Insert realistic students
exec InsertStudent 'Rajesh Sharma', 22, 'male', 'Delhi', 11
exec InsertStudent 'Priya Patel', 21, 'female', 'Gujarat', 12
exec InsertStudent 'Arun Kumar', 23, 'male', 'Bihar', 13
exec InsertStudent 'Sneha Singh', 24, 'female', 'Uttar Pradesh', 14
exec InsertStudent 'Manoj Verma', 25, 'male', 'Haryana', 15

-- Insert realistic teachers
exec InsertTeacher 'Anita Kapoor', 35, 'female', 'Maharashtra', 21
exec InsertTeacher 'Rajeev Mishra', 32, 'male', 'Uttarakhand', 22
exec InsertTeacher 'Suman Gupta', 38, 'female', 'West Bengal', 23
exec InsertTeacher 'Vikram Singh', 40, 'male', 'Punjab', 24
exec InsertTeacher 'Kavita Sharma', 33, 'female', 'Rajasthan', 25

-- Insert random marks
exec InsertMarks 1, 21, 85.9, 6  -- Biology
exec InsertMarks 2, 22, 78.5, 7  -- History
exec InsertMarks 3, 23, 92.0, 8  -- Geography
exec InsertMarks 4, 24, 88.3, 9  -- Economics
exec InsertMarks 5, 25, 94.6, 10 -- Political Science
