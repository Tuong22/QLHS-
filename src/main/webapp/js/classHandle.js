
const editClassNameBtns = document.querySelectorAll(".className-edit-icon")
const removeClassBtns = document.querySelectorAll(".removeClass-icon")
const classNameEdits = document.querySelectorAll(".className-edit")
const classListData = document.querySelector(".card-body.class-list-data")
const changeClassNameForm = document.querySelector(".card-body.change-className")
const removeClassForm = document.querySelector(".card-body.remove-class")

const cancelChangeNameBtn = document.querySelector(".change-className-cancel-btn")
const cancelRemoveNameBtn = document.querySelector(".remove-class-cancel-btn")

const searchClassBtn = document.querySelector(".search-class-btn")
const addClassBtn = document.querySelector(".add-class-btn")

function getParent(element, selector) {
	while (element.parentElement) {
		if (element.parentElement.matches(selector)) {
			return element.parentElement
		}
		element = element.parentElement
	}
}

editClassNameBtns.forEach(function(editClassNameBtn) {
	editClassNameBtn.addEventListener('click', function() {
		classListData.style.width = '50%'
		changeClassNameForm.classList.remove('hidden')
		classNameEdits.forEach(function(classNameEdit) {
			classNameEdit.classList.remove("active")
		});
		removeClassBtns.forEach(function(removeClassBtn) {
			removeClassBtn.classList.add("hidden")
		})
		getParent(editClassNameBtn, ".className-edit").classList.add("active")
		searchClassBtn.setAttribute("disabled", "")
		addClassBtn.setAttribute("disabled", "")
		document.getElementById("classNameOld").setAttribute("value", getParent(editClassNameBtn, ".className-edit").textContent)
	})
});

removeClassBtns.forEach(function(removeClassBtn) {
	removeClassBtn.addEventListener('click', function() {
		classListData.style.width = '50%'
		removeClassForm.classList.remove('hidden')
		classNameEdits.forEach(function(classNameEdit) {
			classNameEdit.classList.remove("active")
		});
		editClassNameBtns.forEach(function(editClassNameBtn) {
			editClassNameBtn.classList.add("hidden")
		});
		getParent(removeClassBtn, ".className-edit").classList.add("active")
		searchClassBtn.setAttribute("disabled", "")
		addClassBtn.setAttribute("disabled", "")
		document.getElementById("classNameRemove").setAttribute("value", getParent(removeClassBtn, ".className-edit").textContent)
	})
});


cancelChangeNameBtn.addEventListener('click', function() {
	classListData.style.width = '100%'
	changeClassNameForm.classList.add('hidden')
	classNameEdits.forEach(function(classNameEdit) {
		classNameEdit.classList.remove("active")
	});
	removeClassBtns.forEach(function(removeClassBtn) {
		removeClassBtn.classList.remove("hidden")
	})
	searchClassBtn.removeAttribute("disabled")
	addClassBtn.removeAttribute("disabled")
});

cancelRemoveNameBtn.addEventListener('click', function() {
	classListData.style.width = '100%'
	removeClassForm.classList.add('hidden')
	classNameEdits.forEach(function(classNameEdit) {
		classNameEdit.classList.remove("active")
	});
	editClassNameBtns.forEach(function(editClassNameBtn) {
		editClassNameBtn.classList.remove("hidden")
	});
	searchClassBtn.removeAttribute("disabled")
	addClassBtn.removeAttribute("disabled")
});