var app = angular.module('marksheetApp', []);

app.controller('marksheetController', function ($scope, $http) {
    // Default view
  
    // Function to change the view
   

    
    $scope.btnRequired = true;
    $scope.titlee = function () {
        if ($scope.currentView === 'TeachersList') {
            $scope.viewTitle = 'List of Teachers';
        }
        else if ($scope.currentView === 'SubjectsList') {
            $scope.viewTitle = 'List of Subjects';
        }
        else if ($scope.currentView === 'StudentsList') {
            $scope.viewTitle = 'List of Students';
        }
        else if ($scope.currentView === 'MarksList') {
            $scope.viewTitle = 'List of Marks';
        }
    };
    $scope.titlee();
    $scope.changeView = function (view) {
        $scope.currentView = view;
        $scope.titlee();
    }
    $scope.changeView('MarksList');
     
    // Function to view a subject
    $scope.viewSubject = function (subject) {
        $scope.viewTitle = "View Subject";
        $scope.currentView = 'SubjectForm';
        // Set the current subject for viewing
        $scope.buttonvalue = null;
        $scope.Isdisabled = true;
 
        $scope.btnRequired = false;
        $scope.subject = angular.copy(subject);
        
    };
    $scope.viewTeacher = function (teacher) {
        $scope.viewTitle = "View Teacher";
        $scope.currentView = 'TeacherForm';
        // Set the current subject for viewing
        $scope.buttonvalue = null;
        $scope.Isdisabled = true;
        $scope.btnRequired = false;
        $scope.teacher = angular.copy(teacher);
    };
    $scope.viewStudent = function (student) {
        $scope.viewTitle = "View Student";
        $scope.currentView = 'StudentForm';
        // Set the current subject for viewing
        $scope.buttonvalue = null;
        $scope.Isdisabled = true;
        $scope.btnRequired = false;
        $scope.student = angular.copy(student);
    };
    $scope.viewMark = function (mark) {
        $scope.viewTitle = "View Marks";
        $scope.currentView = 'MarksForm';
        // Set the current subject for viewing
        $scope.buttonvalue = null;
        $scope.Isdisabled = true;
        $scope.Isdisabled1 = true;
        $scope.btnRequired = false;
        $scope.mark = angular.copy(mark);
    };

    // Function to viewUpdate form a subject
    $scope.viewUpdateSubject = function (subject) {
        $scope.viewTitle = "Update Subject";
        $scope.currentView = 'SubjectForm';
        $scope.buttonvalue = "Update";
        $scope.Isdisabled = false;
        $scope.subject = angular.copy(subject);
    };
    $scope.viewUpdateTeacher = function (teacher) {
        $scope.viewTitle = "Update Teacher";
        $scope.currentView = 'TeacherForm';
        $scope.Isdisabled = false;
        $scope.buttonvalue = "Update";
        $scope.teacher = angular.copy(teacher);
    };
    $scope.viewUpdateStudent = function (student) {
        $scope.viewTitle = "Update Teacher";
        $scope.currentView = 'StudentForm';
        $scope.buttonvalue = "Update";
        $scope.Isdisabled = false;
        $scope.student = angular.copy(student);
    };
    $scope.viewUpdateMark = function (mark) {
        $scope.viewTitle = "Update Marks";
        $scope.Isdisabled = true;
        $scope.Isdisabled1 = false;
        $scope.currentView = 'MarksForm';
        $scope.buttonvalue = "Update";
        $scope.mark = angular.copy(mark);
    };
     // Function to viewCreate form a subject
    $scope.viewCreateSubject = function () {
        $scope.viewTitle = "Add Subject";
        $scope.currentView = 'SubjectForm';
        $scope.buttonvalue = "Save";
    };
    $scope.viewCreateTeacher = function () {
        $scope.viewTitle = "Add Teacher";
        $scope.currentView = 'TeacherForm';
        $scope.buttonvalue = "Save";
    };
    $scope.viewCreateStudent = function () {
        $scope.viewTitle = "Add Student";
        $scope.currentView = 'StudentForm';
        $scope.buttonvalue = "Save";
    };
    $scope.viewCreateMark = function () {
        $scope.viewTitle = "Add Marks";
        $scope.currentView = 'MarksForm';
        $scope.buttonvalue = "Save";
    };

    $scope.mergeSubject = function () {
        if ($scope.buttonvalue === "Update") {
            $scope.updateSubject();
        } else if ($scope.buttonvalue === "Save") {
            $scope.createSubject();
        }
        
    };
    $scope.mergeTeacher = function () {
        if ($scope.buttonvalue === "Update") {
            $scope.updateTeacher();
        } else if ($scope.buttonvalue === "Save") {
            $scope.createTeacher();
        }
    };
    $scope.mergeStudent = function () {
        if ($scope.buttonvalue === "Update") {
            $scope.updateStudent();
        } else if ($scope.buttonvalue === "Save") {
            $scope.createStudent();
        }
    };
    $scope.mergeMark = function () {
        if ($scope.buttonvalue === "Update") {
            $scope.updateMark();
        } else if ($scope.buttonvalue === "Save") {
            $scope.createMark();
        }
    };


   

    // Function to get the list of subjects
    $scope.getSubjects = function () {
        $http.get("/Home/GetAllSubjects").then(function (response) {
            $scope.subjects = response.data;
        }, function (error) {
            alert('Failed to retrieve subjects.');
        });
    };
    $scope.getTeachers = function () {
        $http.get("/Home/GetTeachers").then(function (response) {
            $scope.teachers = response.data;
        }, function (error) {
            alert('Failed to retrieve Teachers.');
        });
    };
    $scope.getTeachersForSubject = function (id) {
        $http.get("/Home/GetTeachersForSubject?id=" + id).then(function (response) {
            $scope.teachers = response.data;
        }, function (error) {
            alert('Failed to retrieve Teachers.');
        });
    }
    $scope.getStudents = function () {
        $http.get("/Home/GetStudents").then(function (response) {
            $scope.students = response.data;
        }, function (error) {
            alert('Failed to retrieve subjects.');
        });
    };
    $scope.getMarks = function () {
        $http.get("/Home/GetMarks").then(function (response) {
            $scope.marks = response.data;
        }, function (error) {
            alert('Failed to retrieve subjects.');
        });
    };
  

    // Initial load of subjects
    $scope.getSubjects();
    $scope.getTeachers();
    $scope.getStudents();
    $scope.getMarks();
    // Object to store subject data
    $scope.subject = {};
    $scope.teacher = {};
    $scope.student = {};

    // Function to create a new subject

    $scope.createSubject = function () {
        // Check if SubjectName is not empty
        if (!$scope.subject.SubjectName) {
            alert('SubjectName is required.');
            return;
        }

        // Check if SubjectName already exists in the list
        var isDuplicate = $scope.subjects.some(function (existingSubject) {
            return existingSubject.SubjectName.toLowerCase() === $scope.subject.SubjectName.toLowerCase();
        });

        if (isDuplicate) {
            alert('SubjectName already exists in the list.');
            return;
        }

        
        // Prepare subject object for creation
        var subject = {
            Id: $scope.subject.SubjectId,
            SubjectName: $scope.subject.SubjectName
        };

        // Send a request to create the subject
        $http.post("/Home/CreateSubject", subject)
            .then(function (response) {
                // Refresh the subjects list
                $scope.getSubjects();
                $scope.subjects = {};
                alert('Data Submitted.');
                $scope.currentView = 'SubjectsList';
            })
            .catch(function (error) {
                alert('Failed to add subject.');
            });
    };
    $scope.createTeacher = function () {
        // Check if necessary fields are not empty
        if (!$scope.teacher.TeacherName || !$scope.teacher.Age || !$scope.teacher.Address || !$scope.teacher.Speciality) {
            alert('Please fill in all required fields.');
            return;
        }

        // Prepare teacher object for creation
        var teacher = {
            TeacherName: $scope.teacher.TeacherName,
            Age: $scope.teacher.Age,
            Gender: $scope.teacher.Gender,
            Address: $scope.teacher.Address,
            Speciality: $scope.teacher.Speciality
        };

        // Send a request to create the teacher
        $http.post("/Home/CreateTeacher", teacher)
            .then(function (response) {
                // Refresh the teachers list
                $scope.getTeachers();
                $scope.teachers = {};
                alert('Teacher added successfully!');
                $scope.currentView = 'TeachersList';
            })
            .catch(function (error) {
                alert('Failed to add teacher.');
            });
    };
    $scope.createStudent = function () {
        // Check if necessary fields are not empty
        if (!$scope.student.StudentName || !$scope.student.Age || !$scope.student.Address || !$scope.student.ClassId) {
            alert('Please fill in all required fields.');
            return;
        }

        // Prepare teacher object for creation
        var student = {
            StudentName: $scope.student.StudentName,
            Age: $scope.student.Age,
            Gender: $scope.student.Gender,
            Address: $scope.student.Address,
            ClassId: $scope.student.ClassId
        };
        // Send a request to create the teacher
        $http.post("/Home/CreateStudent", student)
            .then(function (response) {
                // Refresh the teachers list
                $scope.getStudents();
                $scope.students = {};
                alert('Student added successfully!');
                $scope.currentView = 'StudentsList';
            })
            .catch(function (error) {
                alert('Failed to add student.');
            });
    };
    $scope.createMark = function () {
        // Check if necessary fields are not empty
        if (!$scope.mark.StudentId || !$scope.mark.Marks || !$scope.mark.SubjectId || !$scope.mark.TeacherId) {
            alert('Please fill in all required fields.');
            return;
        }

        // Prepare teacher object for creation
        var mark = {
            ClassId: $scope.mark.ClassId,
            StudentId: $scope.mark.StudentId,
            Marks: $scope.mark.Marks,
            SubjectId: $scope.mark.SubjectId,
            TeacherId: $scope.mark.TeacherId
        };
        // Send a request to create the teacher
        $http.post("/Home/CreateMarks", mark)
            .then(function (response) {
                // Refresh the teachers list
                $scope.marks = {};
                alert('Student added successfully!');
                $scope.getMarks();
                $scope.currentView = 'MarksList';
            })
            .catch(function (error) {
                alert('Failed to add student.');
            });
    };

    // Function to update a subject
    $scope.updateSubject = function () {

        // Check if SubjectName is not provided
        if (!$scope.subject.SubjectName) {
            alert('SubjectName is required.');
            return;
        }

        // Check if SubjectName already exists in the list excluding the current subject
        var isDuplicate = $scope.subjects.some(function (existingSubject) {
            return (
                existingSubject.SubjectName.toLowerCase() === $scope.subject.SubjectName.toLowerCase() &&
                existingSubject.SubjectId !== $scope.subject.SubjectId
            );
        });

        if (isDuplicate) {
            alert('SubjectName already exists in the list.');
            return;
        }

        // Prepare updated subject object
        var updatedSubject = {
            Id: $scope.subject.SubjectId,
            SubjectName: $scope.subject.SubjectName
        };

        // Send a request to update the subject
        $http.post("/Home/UpdateSubject?id=" + updatedSubject.Id, updatedSubject)
            .then(function (response) {
                // Refresh the subjects list
                $scope.getSubjects();
                alert('Subject updated successfully!');
                $scope.currentView = 'SubjectsList';
            })
            .catch(function (error) {
                alert('Failed to update subject.');
            });
    };
    $scope.updateTeacher = function () {
        // Check if necessary fields are provided
        if (!$scope.teacher.TeacherName || !$scope.teacher.Age || !$scope.teacher.Address || !$scope.teacher.Speciality) {
            alert('Please fill in all required fields.');
            return;
        }

        // Prepare updated teacher object
        var updatedTeacher = {
            TeacherId: $scope.teacher.TeacherId,
            TeacherName: $scope.teacher.TeacherName,
            Age: $scope.teacher.Age,
            Gender: $scope.teacher.Gender,
            Address: $scope.teacher.Address,
            Speciality: $scope.teacher.Speciality
        };

        $http.post("/Home/UpdateTeacher?id=" + updatedTeacher.TeacherId, updatedTeacher)
            .then(function (response) {
                // Refresh the teachers list
                $scope.getTeachers();
                alert('Teacher updated successfully!');
                $scope.currentView = 'TeachersList';
            })
            .catch(function (error) {
                alert('Failed to update teacher.');
            });
    };
    $scope.updateStudent = function () {
        // Check if necessary fields are provided
        if (!$scope.student.StudentName || !$scope.student.Age || !$scope.student.Address || !$scope.student.ClassId) {
            alert('Please fill in all required fields.');
            return;
        }

        // Prepare updated teacher object
        var updatedStudent = {
            StudentId: $scope.student.StudentId,
            StudentName: $scope.student.StudentName,
            Age: $scope.student.Age,
            Gender: $scope.student.Gender,
            Address: $scope.student.Address,
            ClassId: $scope.student.ClassId
        };

        $http.post("/Home/UpdateStudent?id=" + updatedStudent.StudentId, updatedStudent)
            .then(function (response) {
                // Refresh the teachers list
                $scope.getStudents();
                alert('Student updated successfully!');
                $scope.currentView = 'StudentsList';
            })
            .catch(function (error) {
                alert('Failed to update student.');
            });
    };
    $scope.updateMark = function () {
        // Check if necessary fields are provided
        if (!$scope.mark.StudentId || !$scope.mark.Marks || !$scope.mark.SubjectId || !$scope.mark.TeacherId) {
            alert('Please fill in all required fields.');
            return;
        }

        // Prepare updated teacher object
        var updatedMark = {
            MarkSheetId : $scope.mark.MarkSheetId,
            ClassId: $scope.mark.ClassId,
            StudentId: $scope.mark.StudentId,
            Marks: $scope.mark.Marks,
            SubjectId: $scope.mark.SubjectId,
            TeacherId: $scope.mark.TeacherId
        };

        $http.post("/Home/UpdateMarks?id=" + updatedMark.MarkSheetId, updatedMark)
            .then(function (response) {
                // Refresh the teachers list
                $scope.getMarks();
                alert('Marks updated successfully!');
                $scope.changeView('MarksList')
            })
            .catch(function (error) {
                alert('Failed to update marks.');
            });
    };
 

    // Function to delete a subject
    $scope.deleteSubject = function (id) {
        var confirmDelete = window.confirm("Are you sure you want to delete?");
        if (confirmDelete) {
            $http.get("/Home/DeleteSubject?id=" + id).then(function (response) {
                alert(response.data);
                $scope.getSubjects();
            }, function (error) {
                alert("Failed to delete subject.");
            });
        } else {
            alert("Delete operation cancelled");
        }
    };
    $scope.deleteTeacher = function (id) {
        var confirmDelete = window.confirm("Are you sure you want to delete?");
        if (confirmDelete) {
            $http.get("/Home/DeleteTeacher?id=" + id).then(function (response) {
                alert(response.data);
                $scope.getTeachers();
            }, function (error) {
                alert("Failed to delete subject.");
            });
        } else {
            alert("Delete operation cancelled");
        }
    };
    $scope.deleteStudent = function (id) {
        var confirmDelete = window.confirm("Are you sure you want to delete?");
        if (confirmDelete) {
            $http.get("/Home/DeleteStudent?id=" + id).then(function (response) {
                alert(response.data);
                $scope.getStudents();
            }, function (error) {
                alert("Failed to delete Student.");
            });
        } else {
            alert("Delete operation cancelled");
        }
    };
    $scope.deleteMark = function (id) {
        var confirmDelete = window.confirm("Are you sure you want to delete?");
        if (confirmDelete) {
            $http.get("/Home/DeleteMarks?id=" + id).then(function (response) {
                alert(response.data);
                $scope.getMarks();
            }, function (error) {
                alert("Failed to delete Student.");
            });
        } else {
            alert("Delete operation cancelled");
        }
    };
    
   

});
