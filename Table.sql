use MarkSheetUi20240115

create table Subject(
	SubjectId int Primary key,
	SubjectName varchar(100),
	CreatedDateTime datetime,
	CreatedBy	int,
	ModifiedDateTime	datetime,
	ModifiedBy int	
)

create table Teacher(
	TeacherId int Primary key,
	TeacherName varchar(100),
	Age int,
	Gender varchar(20),
	Address varchar(200),
	Speciality int ,
	CreatedDateTime datetime,
	CreatedBy	int,
	ModifiedDateTime	datetime,
	ModifiedBy int
)

create table Student(
	StudentId int Primary key,
	StudentName varchar(100),
	Age int,
	Gender varchar(20),
	Address varchar(200),
	ClassId int,
	CreatedDateTime datetime,
	CreatedBy	int,
	ModifiedDateTime	datetime,
	ModifiedBy int
)


create table MarkSheet(
	MarkSheetId int Primary key,
	StudentId int,
	TeacherId int,
	SubjectId int ,
	Marks decimal(5,2),
	CreatedDateTime datetime,
	CreatedBy	int,
	ModifiedDateTime	datetime,
	ModifiedBy int
)







