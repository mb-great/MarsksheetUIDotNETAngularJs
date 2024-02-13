use MarkSheetUi20240115

create proc GetSubjects
as
begin
select * from Subject
end


create proc GetStudents
as
begin
select * from Student
end




create proc GetTeachers
as
begin
select * from Teacher
end



alter proc GetMarkSheet
as
begin
select * from MarkSheet
end

alter proc GetMarkSheetCustom
as
begin
select m.MarkSheetId, m.Marks,
	   s.StudentId,
	   t.TeacherId,t.TeacherName,
	  s.StudentName,s.ClassId,sub.SubjectId,
		sub.SubjectName
	    from MarkSheet m 
	inner join  Teacher t on t.TeacherId =m.TeacherId
	inner join  Student s on s.StudentId =m.StudentId
	inner join Subject sub on  sub.SubjectId= t.Speciality
end;




alter proc GetTeacherWithSubjectName
as
begin
select TeacherId,TeacherName,Age,Gender,Address,Speciality,SubjectId,SubjectName
from Teacher t
inner Join Subject s on  s.SubjectId= t.Speciality
end

alter proc GetTeachersForSubject 
@Id int
as
begin
select TeacherId,TeacherName,Age,Gender,Address,Speciality,SubjectId,SubjectName
from Subject s 
inner Join Teacher t on  s.SubjectId= t.Speciality where s.SubjectId=@Id
end



--join fetch teacher
select *
from Teacher t
inner Join Subject s on  s.SubjectId= t.Speciality



--join fetch markshet
select m.MarkSheetId, m.Marks,
	   s.StudentId,
	   t.TeacherId,t.TeacherName,
	  s.StudentName,
		sub.SubjectName
	    from MarkSheet m 
	inner join  Teacher t on t.TeacherId =m.TeacherId
	inner join  Student s on s.StudentId =m.StudentId
	inner join Subject sub on  sub.SubjectId= t.Speciality
	

select * from Subject
select * from Student
select * from Teacher
select * from MarkSheet 

delete from Subject
delete from Student
delete from Teacher
delete from MarkSheet 



select * from Student where StudentName like '_a%';
select * from Student where StudentName in ('Kabir Singh','kabir sharma');
select * from Student where Age in (26,30);
select * from Student where Age between 20 and 30;
select * from Student where Age <>30 ;


-- group number of students under teachher
select TeacherName, COUNT(StudentId) as NoOfStudents
from Teacher t 
left join Student s on s.Address =t.Address
group by TeacherName







SubjectId	SubjectName	CreatedDateTime	CreatedBy	ModifiedDateTime	ModifiedBy
1	English	2024-01-16 12:34:26.153	NULL	NULL	NULL
2	Physics	2024-01-16 12:34:26.153	NULL	NULL	NULL
3	Chemistry	2024-01-16 12:34:26.153	NULL	NULL	NULL
4	Maths	2024-01-16 12:34:26.153	NULL	NULL	NULL
5	Computer Science	2024-01-16 12:34:26.153	NULL	NULL	NULL









--function
alter FUNCTION dbo.NumberToWords(@input INT)
RETURNS NVARCHAR(max)
AS
BEGIN
    DECLARE @resultString NVARCHAR(max) = '';

    IF @input = 0
    BEGIN
        SET @resultString = 'zero ';
    END
    ELSE
    BEGIN
        DECLARE @digit INT = 0;

        WHILE @input > 0
        BEGIN
            SET @digit = @input % 10;
            SET @input = @input / 10;

            SET @resultString = 
                CASE 
                    WHEN @digit = 0 THEN 'zero'
                    WHEN @digit = 1 THEN 'one'
                    WHEN @digit = 2 THEN 'two'
                    WHEN @digit = 3 THEN 'three'
                    WHEN @digit = 4 THEN 'four'
                    WHEN @digit = 5 THEN 'five'
                    WHEN @digit = 6 THEN 'six'
                    WHEN @digit = 7 THEN 'seven'
                    WHEN @digit = 8 THEN 'eight'
                    WHEN @digit = 9 THEN 'nine'
                END +' '+ @resultString;
        END
    END

    RETURN @resultString; 
END;


SELECT  dbo.NumberToWords(5168464);






--triggers
create Table MarksAudit(
	AuditId int Primary Key,
	MarksId int,
	AuditType Nvarchar(50),
	AuditTime datetime
)



alter TRIGGER AfterMarksChangeTrigger 
ON MarkSheet
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    DECLARE @NextAuditId INT;

    -- Calculate the next available AuditId
    SELECT @NextAuditId = ISNULL(MAX(AuditId), 0) + 1
    FROM MarksAudit;

    -- Insert audit records for inserted marks
    INSERT INTO MarksAudit (MarkSheetId, AuditType, AuditTime, AuditId)
    SELECT MarkSheetId, 'INSERT', GETDATE(), @NextAuditId
    FROM INSERTED;

    -- Insert audit records for updated marks
    INSERT INTO MarksAudit (MarkSheetId, AuditType, AuditTime, AuditId)
    SELECT MarkSheetId, 'UPDATE', GETDATE(), @NextAuditId
    FROM INSERTED;

    -- Insert audit records for deleted marks
    INSERT INTO MarksAudit (MarkSheetId, AuditType, AuditTime, AuditId)
    SELECT MarkSheetId, 'DELETE', GETDATE(), @NextAuditId
    FROM DELETED;
END;

select * from MarksAudit



ALTER TABLE MarksAudit
ADD NewAuditId INT IDENTITY(1,1);

-- Step 2: Set IDENTITY_INSERT to ON
SET IDENTITY_INSERT MarksAudit ON;

-- Step 3: Update the new column with the data from the old column
UPDATE MarksAudit
SET NewAuditId = AuditId;

-- Step 4: Set IDENTITY_INSERT to OFF
SET IDENTITY_INSERT MarksAudit OFF;

-- Step 5: Drop the old column
ALTER TABLE MarksAudit
DROP COLUMN AuditId;

-- Step 6: Rename the new column to the original column name if needed
EXEC sp_rename 'MarksAudit.NewAuditId', 'AuditId', 'COLUMN';