//Global Declarations Start
var currentUser;

var items = document.querySelectorAll(".items");

var allClubItems = document.querySelectorAll(".clubitem");

var curActiveClub = {
	Id: "",
	Name: "",
	AllMessages: [],
	AllMembers: [],
	AllEvents: []
};

var IntervalId;
//Global Declarations End

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

//Window events Start
$(window).on("load", (event) => {
	setCurrentUser().then(() => {
		console.log("Current user Details :", currentUser);
		//To change Status for current user
		$.ajax({
			type: "POST",
			url: "Api/changeUserStatus.php",
			data: {
				UserId: currentUser.Id,
				Status: 'active',
			},
			success: async function (result, status, xhr) {
				response = JSON.parse(result);

			},
		});

		//To initialize dashboard by default on entering home page
		$(".dashboardTab").show();
		dashboardFeed();
		// $(".myClubsTab").show();
		// $(".myClubsCard").hide();
	});
});

$(window).on('beforeunload', function () {
	$.ajax({
		type: "POST",
		url: "Api/changeUserStatus.php",
		data: {
			UserId: currentUser.Id,
			Status: 'inactive',
		},
		success: async function (result, status, xhr) {
			response = JSON.parse(result);

		},
	});
});

//Window events Start

let makeActive = function (event) {
	//console.log(event) ;
	items.forEach((element) => {
		//console.log(element);
		element.classList.remove("active-item");
		element.classList.add("inactive-item");
		$(".tab").hide();
	});
	let currentId = event.target.id;
	if (currentId != "myClubs") {
		clearInterval(IntervalId);
	}
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
			$("#myClubEnteredTab").hide();
			$(".myClubsTab").show();
			$(".myClubsCard").show();
			displayMemberClubs();
		default:
			break;
	}
};

let makeClubTabActive = function (event) {
	let targetId = event.target.id;
	allClubItems.forEach(item => {
		item.classList.remove("activeClub-item");
		if (item.id == targetId) {
			item.classList.add("activeClub-item");
		}
	});
	document.querySelectorAll(".clubTab").forEach(tab => {
		tab.classList.add("inactiveClub-tab");
	});
	switch (targetId) {
		case "chatRoomTab":
			document.getElementById("chatbox").classList.remove("inactiveClub-tab");
			break;
		case "eventsTab":
			document.getElementById("clubEvents").classList.remove("inactiveClub-tab");
			$(".eventsWrapper").show();
			$(".createEventWrapper").hide();
			break;
		case "extrasTab":
			document.getElementById("clubExtras").classList.remove("inactiveClub-tab");
			break;
		default:
			break;
	}

}

allClubItems.forEach(item => {
	item.addEventListener("click", makeClubTabActive);
});

items.forEach(item => {
	item.addEventListener("click", makeActive);
});

//Multiselect in update form Code START
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
// Multiselect in update form Code END

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
			clubElement.id = "myClub-" + club.Id;
			clubElement.innerHTML = `
        <div>
            <span>Name:</span><span id="my_clubName-${club.Id}">${club.Name}</span><br>
            <span>Category:</span><span id="my_clubCategory-${club.Id}">${club.Categories}</span><br>
            <span>Description:</span><span id="my_clubDescription-${club.Id}">${club.Description}</span>
        </div>
        <button class= "clubButton" id="my_clubEnter-${club.Id}" onclick="enterClub(this.id)">Enter</button>
		<button class= "clubButton" id="my_clubLeave-${club.Id}" onclick="leaveClub(this.id)">Leave</button>
    `;

			myClubsCard.appendChild(clubElement);
		});
	}
}

async function enterClub(elementId) {
	let clubId = elementId.slice(13);
	currentInteractiveClub = clubId
	console.log("Entering Club - ", clubId);
	$('#myClubsCard').hide();
	$("#myClubEnteredTab").show();
	allClubItems = document.querySelectorAll(".clubitem");
	allClubItems.forEach(item => {
		item.addEventListener("click", makeClubTabActive);
	});
	clearInterval(IntervalId);
	document.getElementById('eventsWrapper').innerHTML = "";
	if (curActiveClub.Id != clubId) {
		//Changing Global active club to the new one by resetting it.

		curActiveClub.Id = clubId;
		curActiveClub.Name = document.getElementById(`my_clubName-${clubId}`).innerText;
		curActiveClub.AllMessages = [];
		curActiveClub.AllMembers = [];
		curActiveClub.AllEvents = [];

		let allMembers = []
		//Resetting the chatbox and Activeusers section.
		document.getElementById("chatboxBody").innerHTML = "";
		document.getElementById("activeUsersWrapper").innerHTML = "";
		document.getElementById("inactiveUsersWrapper").innerHTML = "";
		console.log("Active Club Changed ->", curActiveClub);

		document.getElementById("chatboxHeader").innerHTML = curActiveClub.Name;

		//Api call to get all memebers of club and initiate them.
		await $.ajax({
			type: "POST",
			url: "Api/getAllMembersOfClub.php",
			data: {
				ClubId: clubId,
			},
			success: async function (result, status, xhr) {
				console.log(result);
				result = JSON.parse(result);
				allMembers = result.Members;
			},
		});
		curActiveClub.AllMembers = allMembers;
		allMembers.forEach(member => {
			appendMemberInClub(member);
		});

	}
	await loadAllClubMessages();
	await loadAllEvents();
	IntervalId = window.setInterval(loadAllClubMessages, 5000);

}

async function leaveClub(Id) {
	if (confirm("Do you want to leave the club?") == true) {
		clubId = Id.slice(-1);
		await $.ajax({
			type: "POST",
			url: "Api/leaveClub.php",
			data: {
				UserId: currentUser.Id,
				ClubId: clubId
			},
			success: async function (result, status, xhr) {
				response = JSON.parse(result);
				let leftClub = document.getElementById("myClub-" + clubId);
				leftClub.remove();
			},
		});
	}

}

async function sendMessageToClub() {
	let messageText = document.getElementById("TextMessage").value;
	let dateObject = new Date();
	//dateObject.getHours() + "." + dateObject.getMinutes() + "." + dateObject.getSeconds();
	// To add time in hours
	let time = ((dateObject.getHours().toString().length == 1) ? "0" + dateObject.getHours().toString() : dateObject.getHours().toString()) + ".";
	//To add time in minutes
	time += ((dateObject.getMinutes().toString().length == 1) ? "0" + dateObject.getMinutes().toString() : dateObject.getMinutes().toString()) + ".";
	//To add time in seconds
	time += dateObject.getSeconds();
	// To add date
	let date = ((dateObject.getDate().toString().length == 1) ? "0" + dateObject.getDate().toString() : dateObject.getDate().toString()) + ":";
	//To add month
	date += (((Number(dateObject.getMonth()) + 1).toString().length == 1) ? "0" + (Number(dateObject.getMonth()) + 1) : (Number(dateObject.getMonth()) + 1)) + ":"
	//To add year
	date += dateObject.getFullYear();
	let timeStamp = time + "/" + date;
	let curMessageObj = {
		Message: messageText,
		ClubId: curActiveClub.Id,
		UserId: currentUser.Id,
		UserPic: currentUser.ProfilePic,
		UserName: currentUser.FirstName + " " + currentUser.LastName,
		TimeStamp: timeStamp
	}
	console.log(curMessageObj);
	if (messageText != "") {
		console.log("Message", messageText);
		await $.ajax({
			type: "POST",
			url: "Api/insertMessage.php",
			data: curMessageObj,
			success: async function (result, status, xhr) {
				result = JSON.parse(result);
				if (result.status == 'true') {
					document.getElementById("TextMessage").value = '';
					curMessageObj['Id'] = result.Id;
					appendMessageToChatBox(curMessageObj);
				}
			},
		});

	}
}

async function appendMessageToChatBox(messageObj) {
	curActiveClub.AllMessages.push(messageObj);
	// console.log("Appending message", curActiveClub);
	let message = document.createElement("div");
	message.classList.add("message");
	if (messageObj.UserId == currentUser.Id) {
		message.classList.add("sentMessage");
	}
	message.innerHTML = `
		<img src="${messageObj.UserPic}"">
		<div class="messageText">
			<span>${messageObj.UserName}</span>
				<p>${messageObj.Message}</p>
			<span class="timeStamp">${(messageObj.TimeStamp).slice(0, 5) + " " + (messageObj.TimeStamp).slice(8)}</span>
		</div>
	`;

	document.getElementById("chatboxBody").insertBefore(message, document.getElementById("chatboxBody").firstChild);

	var chatboxBody = document.getElementById('chatboxBody');
	chatboxBody.scrollTop = chatboxBody.scrollHeight;

}

async function appendMemberInClub(member) {
	let parent;
	if (member.Status == 'active') {
		parent = document.getElementById("activeUsersWrapper");
	}
	else {
		parent = document.getElementById("inactiveUsersWrapper");
	}
	// console.log("AppendMemberInClub", member);
	let child = document.createElement("div");
	child.classList.add("clubMember");
	child.id = "clubMember-" + member.Id;
	child.innerHTML = `
		<div class="userStatus"></div>
		<img src="${member.ProfilePic}" alt="">
		<span>${member.FirstName + " " + member.LastName}</span>
	`;
	parent.appendChild(child);


}

async function loadAllClubMessages() {
	$.ajax({
		type: "POST",
		url: "Api/getAllDataOfClub.php",
		data: {
			ClubId: curActiveClub.Id
		},
		success: async function (result, status, xhr) {
			let response = JSON.parse(result);
			console.log("LoadingClub", response);
			let receivedMessages = response.messages;
			let receivedMembers = response.AllMembers;

			//Updating messages.
			for (let i = curActiveClub.AllMessages.length; i < receivedMessages.length; i++) {
				appendMessageToChatBox(receivedMessages[i]);
			}

			//Updating activeMembers
			for (let i = 0; i < receivedMembers.length; i++) {

				if (i >= curActiveClub.AllMembers.length) {
					curActiveClub.AllMembers.push(receivedMembers[i])
					appendMemberInClub(receivedMembers[i]);
				}
				if (receivedMembers[i].Status != curActiveClub.AllMembers[i].Status) {
					console.log("Status Changed", receivedMembers[i]);
					//changing the status in global variable.
					curActiveClub.AllMembers[i].Status = receivedMembers[i].Status;
					console.log("After Updating-->", curActiveClub.AllMembers);
					//Rerendering based on changed status
					await document.getElementById("clubMember-" + receivedMembers[i].Id).remove();
					appendMemberInClub(receivedMembers[i]);

				}

			}

		},
	});

}
//For events tab in myclubs
async function loadAllEvents() {
	await $.ajax({
		type: "POST",
		url: "Api/getAllEventsOfClub.php",
		data: {
			ClubId: curActiveClub.Id
		},
		success: async function (result, status, xhr) {
			result = JSON.parse(result);
			console.log("Events->", result.allEvents);
			curActiveClub.AllEvents = result.allEvents;
			curActiveClub.AllEvents.forEach(event => {
				let child = document.createElement('div');
				child.classList.add('eventCard');
				child.innerHTML = `
					Name: ${event.Name} <br>
					Venue: ${event.Venue} <br>
					Date/Time:${event.Date + " " + event.Time} <br>
					Description: <br>
					&emsp;${event.Description}
					<br>
					<div class=" organizer paricipantsWrapper">
						<h6 style="margin-left: 10px; color: rgb(192, 78, 78);">Organizer</h6>
						<div class="participant">
							<img src="${event.OrganizerPic}" alt="">
							<span>${event.OrganizerName}</span>
						</div>
					</div>
					<button onclick="enrollEvent(this.id)" id="Enroll-${event.Id}" >Enroll</button>
					<button onclick="viewEventParticipants(this.id)" id="viewparticipants-${event.Id}">View Participants</button>
					<div class="paricipantsWrapper" id="paricipantsWrapper-${event.Id}">
					</div>
				`;

				let parent = document.getElementById('eventsWrapper');
				parent.appendChild(child);

			});
		},
	});
}

function displayCreateEvent() {
	$(".eventsWrapper").hide();
	$(".createEventWrapper").show();
	console.log("button clicked");
}

function displayShowEvent() {
	$(".eventsWrapper").show();
	$(".createEventWrapper").hide();
	console.log("button clicked");
}

async function createClubEvent() {
	let eventName = $('#eventName').val();
	let eventVenue = $('#eventVenue').val();
	let eventDate = $('#eventDate').val();
	let eventTime = $('#eventTime').val();
	let eventDescription = $('#eventDescription').val();

	await $.ajax({
		type: "POST",
		url: "Api/createClubEvent.php",
		data: {
			Name: eventName,
			Venue: eventVenue,
			Date: eventDate,
			Time: eventTime,
			Description: eventDescription,
			OrganizerId: currentUser.Id,
			OrganizerName: currentUser.FirstName + currentUser.LastName,
			OrganizerPic: currentUser.ProfilePic,
			ClubId: curActiveClub.Id
		},
		success: async function (result, status, xhr) {
			console.log(result);
			result = JSON.parse(result);
		},
	});

}

async function enrollEvent(Id) {
	let eventId = Id.slice(-1);
	await $.ajax({
		type: "POST",
		url: "Api/enrollEvent.php",
		data: {
			EventId: eventId,
			UserId: currentUser.Id,
			UserName: currentUser.FirstName + " " + currentUser.LastName,
			UserPic: currentUser.ProfilePic
		},
		success: async function (result, status, xhr) {
			console.log("Enrolled successfully.");
		},
	});
}

async function viewEventParticipants(Id) {
	let eventId = Id.slice(-1);
	await $.ajax({
		type: "POST",
		url: "Api/getEventParticipants.php",
		data: {
			EventId: eventId,
		},
		success: async function (result, status, xhr) {
			result = JSON.parse(result);
			let parent = document.getElementById("paricipantsWrapper-" + eventId);
			parent.innerHTML = "";
			result.allParticipants.forEach(participant => {
				let child = document.createElement("div");
				child.classList.add("participant");
				child.innerHTML = `
						<img src="${participant.UserPic}" alt="">
						<span>${participant.UserName}</span>
				`;
				parent.appendChild(child);
			});
		},
	});
}

async function closeClub() {
	$("#myClubEnteredTab").hide();
	$("#myClubsCard").show();

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
	$.ajax({
		type: "POST",
		url: "Api/changeUserStatus.php",
		data: {
			UserId: currentUser.Id,
			Status: 'inactive',
		},
		success: async function (result, status, xhr) {
			response = JSON.parse(result);

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
			console.log("Dashboard Feed ", response);
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
						<button id="dashboardClub-${club.Id}" onclick="joinClubFromFeed(this.id)">Join Club</button>
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

async function joinClubFromFeed(Id) {
	let response;
	let clubId = Id.slice(-1);
	await $.ajax({
		type: "POST",
		url: "Api/joinClubApi.php",
		data: {
			ClubId: clubId,
			UserId: currentUser.Id,
		},
		success: async function (result, status, xhr) {
			response = JSON.parse(result);
		},
	});
	console.log("Join Club Response", response);
	alert(response.message);
	let elementId = "dashboardClubItem-" + clubId;
	let joinedClub = document.getElementById(elementId);
	joinedClub.remove();
}