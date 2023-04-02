var currentUser;
$(".tab").hide();
async function setCurrentUser() {
	let response;
	await $.ajax({
		type: "POST",
		url: "Api/getCurrentUserApi.php",
		data: {},
		success: async function (result, status, xhr) {
			response = JSON.parse(result);

		},
	});
	if (response.status == "true") {
		currentUser = response.userDetails;
		$("#userName").html(currentUser.FirstName + " " + currentUser.LastName);
		$("#userEmail").html(currentUser.Email);
		$("#userImage").attr("src", currentUser.ProfilePic);
	}
	else {
		console.log("User didnt login");
		window.location.replace("login.html");
	}

}
setCurrentUser().then(() => {
	console.log("Current user Details :", currentUser);
	//To initialize dashboard by default on entering home page
	$(".dashboardTab").show();
	dashboardFeed();
});

var items = document.querySelectorAll(".items");

let makeActive = function (event) {
	//console.log(event) ;
	items.forEach((element) => {
		//console.log(element);
		element.classList.remove("active-item");
		element.classList.add("inactive-item");
		$(".tab").hide();
	});
	let currentId = event.target.id;
	//console.log(event.target);
	document.getElementById(currentId).classList.remove("inactive-item");
	document.getElementById(currentId).classList.add("active-item");
	switch (currentId) {
		case "dashboard":
			$(".dashboardTab").show();
			dashboardFeed();
			break;
		case "userDetails":
			$(".userDetailsTab").show();
			selectedItems = [];
			setFiledsInUpdateForm();
			break;
		case "createClub":
			$(".createClubTab").show();
			break;
		case "joinClub":
			$(".joinClubTab").show();
			break;
		case "myClubs":
			$(".myClubsTab").show();
			displayMemberClubs();
		default:
			break;
	}
};

for (let i = 0; i < items.length; i++) {
	items[i].addEventListener("click", makeActive);
}

let dropdown = document.querySelector(".multiselect-dropdown");
let menu = document.querySelector(".menu");
let listContainer = document.querySelector(".selectedList-container");
let selectedItems = [];

dropdown.onclick = (event) => {
	event.currentTarget.classList.toggle("show");
};

menu.addEventListener("click", (event) => {
	event.stopPropagation();

	let item = event.target.innerHTML;

	if (!selectedItems.includes(item)) {
		selectedItems.push(item);
		showSelectedItems(item);
	}
});

function showSelectedItems(item) {
	let itemSpan = document.createElement("span");
	let crossIcon = document.createElement("i");

	itemSpan.innerHTML = item;
	itemSpan.classList.add("selectedItem");

	crossIcon.classList.add("fa-solid", "fa-xmark");
	itemSpan.append(crossIcon);

	itemSpan.addEventListener("click", deleteItem);
	listContainer.append(itemSpan);
}

function deleteItem(event) {
	event.stopPropagation();
	let item = event.currentTarget;
	selectedItems.pop(item.innerText);
	item.remove();
}

//Written by ajay

async function handleCreateClub() {
	let name = $("#clubname").val();
	let description = $("#Description").val();
	let category = $("#selectCategory").val();
	let ownerId = currentUser.Id;

	console.log(name, description, category, ownerId);

	await $.ajax({
		type: "POST",
		url: "Api/createClubApi.php",
		data: {
			Name: name,
			OwnerId: ownerId,
			Categories: category,
			Description: description,
		},
		success: async function (result, status, xhr) {
			result = JSON.parse(result);
			alert(result.message);
		},
	});
}

async function getClubDetails() {
	let response;
	await $.ajax({
		type: "POST",
		url: "Api/getClubDetails.php",
		data: {
			ClubId: $("#joinInput").val(),
		},
		success: async function (result, status, xhr) {
			response = JSON.parse(result);
		},
	});
	console.log("Requested Club Details", response);
	$("#reqName").html(response.club.Name);
	$("#reqOwner").html(response.owner.FirstName + " " + response.owner.LastName);
	$("#reqCategory").html(response.club.Categories);
	$("#reqDescription").html(response.club.Description);
}

async function joinClub() {
	let response;
	await $.ajax({
		type: "POST",
		url: "Api/joinClubApi.php",
		data: {
			ClubId: $("#joinInput").val(),
			UserId: currentUser.Id,
		},
		success: async function (result, status, xhr) {
			response = JSON.parse(result);

		},
	});
	console.log("Join Club Response", response);
	alert(response.message);
}

async function displayMemberClubs() {
	let response;
	await $.ajax({
		type: "POST",
		url: "Api/getAllMemberClubsApi.php",
		data: {
			UserId: currentUser.Id,
		},
		success: async function (result, status, xhr) {
			console.log(result);
			response = JSON.parse(result);
		},
	});
	console.log("My clubs Response from Api", response);
	if (response.status == "false") {
		alert(response.message);
	} else {
		let myClubsCard = document.getElementById("myClubsCard");
		myClubsCard.innerHTML = "";
		response.allClubs.forEach((club) => {
			let clubElement = document.createElement("div");
			clubElement.classList.add("my_club");

			clubElement.innerHTML = `
        <div>
            <span>Name:</span><span id="my_clubName-${club.Id}">${club.Name}</span><br>
            <span>Category:</span><span id="my_clubCategory-${club.Id}">${club.Categories}</span><br>
            <span>Description:</span><span id="my_clubDescription-${club.Id}">${club.Description}</span>
        </div>
        <button id="my_clubEnter-${club.Id}">Enter</button>
    `;

			myClubsCard.appendChild(clubElement);
		});
	}
}

async function updateUserDetails() {
	let firstName = document.getElementById("firstname").value;
	let lastName = document.getElementById("lastname").value;
	let phone = document.getElementById("phone").value;
	let email = document.getElementById("email").value;
	let dob = document.getElementById("DOB").value;
	console.log(document.getElementById("uploadPicture").value);
	let reqBodyData = new FormData();
	reqBodyData.append("FirstName", firstName);
	reqBodyData.append("LastName", lastName);
	reqBodyData.append("DateOfBirth", dob);
	reqBodyData.append("Phone", phone);
	reqBodyData.append("Email", email);
	reqBodyData.append("Interests", JSON.stringify(selectedItems));
	reqBodyData.append("Id", currentUser.Id);

	let file = document.querySelector("#uploadPicture");
	if (file.value != "") {
		reqBodyData.append("ProfilePic", file.files[0], "image.jpg");
	}


	//Api call to update details in database
	let xhr = new XMLHttpRequest();
	xhr.open("POST", "Api/updateUserDetailsApi.php");
	xhr.onload = () => {
		if (xhr.status != 200) {
			console.log(`Error ${xhr.status}: ${xhr.statusText}`);
		} else {
			console.log(xhr.response.length);
		}
	};
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			let response = xhr.responseText;
			console.log("Update User Details Api Response", response);
			//Api call to refresh current session with updated details
			$.ajax({
				type: "POST",
				url: "Api/updateSessionVariable.php",
				data: {
					Id: currentUser.Id,
				},
				success: async function (result, status, xhr) {
					console.log(result);
					window.location.reload();
				},
				async: false,
			});
		}
	};
	xhr.onerror = () => console.log("Request failed");
	xhr.send(reqBodyData);


}

async function setFiledsInUpdateForm() {
	listContainer.innerHTML = "";
	document.getElementById("firstname").value = currentUser.FirstName;
	document.getElementById("lastname").value = currentUser.LastName;
	document.getElementById("phone").value = currentUser.MobileNumber;
	document.getElementById("email").value = currentUser.Email;
	document.getElementById("DOB").value = currentUser.DateOfBirth;
	selectedItems = JSON.parse(currentUser.Interests);
	console.log(selectedItems);
	selectedItems.forEach(item => {
		showSelectedItems(item);
	});

}

async function logoutUser() {
	await $.ajax({
		type: "POST",
		url: "Api/logoutApi.php",
		data: {},
		success: async function (result, status, xhr) {
			console.log(result);
			window.location.replace("login.html");
		},
	});
}

async function dashboardFeed() {
	let clubs = [];
	await $.ajax({
		type: "POST",
		url: "Api/getAllClubsApi.php",
		data: {
			Id: currentUser.Id,
		},
		success: async function (result, status, xhr) {
			let response = JSON.parse(result);
			console.log(response);
			if (response.status == "true") {
				clubs = response.clubs;
			}
		},
	});
	let parentElement = document.getElementById("dashboardCard");
	parentElement.innerHTML = "";
	clubs.forEach(club => {
		let clubElement = document.createElement("div");
		clubElement.classList.add("dashboard-clubCard");
		clubElement.id = "dashboardClubItem-" + club.Id;
		clubElement.innerHTML = `
				<div style="display: flex;">
					<div class="dashboard-clubDetails">
						<div><h5>Name:</h5>${club.Name}</div>
						<div><h5>Club Id:</h5>${club.Id}</div><br>
						<div><h5>Category:</h5>${club.Categories}</div>
						<div><h5>Total Members:</h5>${club.TotalMembers}</div><br>
						<div><h5>Description:</h5></div><p>${club.Description}</p>
					</div>
					<div class="dashboard-clubOperations">
						<button>Join Club</button>
					</div>
				</div>
				<div class="dashboard-clubOwner">
					<h5>Created By: </h5>
					<span>${club.FirstName + " " + club.LastName}</span>
					<img src="${club.ProfilePic}" alt="">
				</div>
    `;

		parentElement.appendChild(clubElement);
	});
}