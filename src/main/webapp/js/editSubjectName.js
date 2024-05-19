
const editSubjectNameBtns = document.querySelectorAll(".subjectName-edit-icon")
const subjectNameEdits = document.querySelectorAll(".subjectName-edit")
const subjectListData = document.querySelector(".card-body.subject-list-data")
const changeSubjectNameForm = document.querySelector(".card-body.change-subjectName")
const cancelChangeSubjectNameBtn = document.querySelector(".change-subjectName-cancel-btn")

editSubjectNameBtns.forEach(function(editSubjectNameBtn) {
	editSubjectNameBtn.addEventListener('click', function() {
		subjectListData.style.width = '50%'
		changeSubjectNameForm.classList.remove('hidden')
		subjectNameEdits.forEach(function(subjectNameEdit) {
			subjectNameEdit.classList.remove("active")
		});
		editSubjectNameBtn.parentElement.classList.add("active")
	})
});


cancelChangeSubjectNameBtn.addEventListener('click', function() {
	subjectListData.style.width = '100%'
	changeSubjectNameForm.classList.add('hidden')
	subjectNameEdits.forEach(function(subjectNameEdit) {
		subjectNameEdit.classList.remove("active")
	});

});