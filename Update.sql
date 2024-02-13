use MarkSheetUi20240115

--subject
create proc UpdateSubject
    @ID int,
	@SubjectName VARCHAR(100)
AS 
BEGIN 
	DECLARE	@ModifiedDateTime DATETIME = getdate(),	@ModifiedBy int = NULL
    
	update  Subject
	set
	SubjectName=@SubjectName,
	ModifiedDateTime=@ModifiedDateTime
	,ModifiedBy=@ModifiedBy
	where SubjectId=@Id;
END






--Student
create proc UpdateStudent
	@Id int,
	@StudentName varchar(100)	,
	@Age int	,
	@Gender	varchar(20),
	@Address	varchar(200),
	@ClassId INT
AS 
BEGIN 
	DECLARE	@ModifiedDateTime DATETIME = getdate(),	@ModifiedBy int = NULL
    -- Find the maximum Id in the Employee table
	update Student
	set  
	StudentName=@StudentName 	,
	Age=@Age	,
	Gender=@Gender	,
	Address=@Address	,
	ModifiedDateTime=@ModifiedDateTime
	,ModifiedBy=@ModifiedBy,
	ClassId=@ClassId 
	where StudentId = @Id;
END





--Teacher
create proc UpdateTeacher
	@Id int,
	@TeacherName varchar(100)	,
	@Age int	,
	@Gender	varchar(20),
	@Address	varchar(200),
	@Speciality int
AS 
BEGIN 
	DECLARE	@ModifiedDateTime DATETIME = getdate(),	@ModifiedBy int = NULL
	update Teacher
	set
	TeacherName = @TeacherName,
	Age = @Age,
	Gender = @Gender,
	Address	= @Address,
	ModifiedDateTime=@ModifiedDateTime
	,ModifiedBy=@ModifiedBy,
	Speciality =@Speciality
	where TeacherId =@Id 
END





--Marksheet
alter proc UpdateMarks 
	@Id int,
	@StudentId int ,
	@TeacherId int,
	@Marks decimal(5,2),
	@SubjectId int
AS 
BEGIN 
	DECLARE	@ModifiedDateTime DATETIME = getdate(),	@ModifiedBy int = NULL
	update MarkSheet
	set
	StudentId =	@StudentId,    
	TeacherId =	@TeacherId, 
	ModifiedDateTime=@ModifiedDateTime
	,ModifiedBy=@ModifiedBy,
	Marks    =	@Marks,
	SubjectId  = @SubjectId 
	where MarkSheetId =@Id
END

