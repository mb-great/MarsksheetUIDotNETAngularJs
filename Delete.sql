use MarkSheetUi20240115

alter proc DeleteStudent
 @Id int
as 
begin
 delete from Student where StudentId = @Id
end

alter proc DeleteTeacher
 @Id int
as 
begin
 delete from Teacher where TeacherId = @Id
end

alter proc DeleteSubject
 @Id int
as 
begin
 delete from Subject where SubjectId = @Id
end

alter proc DeleteMarks
 @Id int
as 
begin
 delete from Marksheet where MarksheetId = @Id
end