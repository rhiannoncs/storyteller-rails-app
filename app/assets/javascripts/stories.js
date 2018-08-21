$(document).ready(function() {
	$(".js-story-details").click(function() {
		show_details(this);
	})

	$(".js-next-story").click(function() {
		show_story(this);
	})
})

function show_details(button) {
	var id = $(button).data("id");
	$.get(`/stories/${id}/details`, function(data) {
		let story = new Story(data["id"], data["title"], data["genre"], data["description"], data["contributors"]);
		$(`#detail-box-${id}`).html(story.details());
	})
}

function show_story(link) {
	var id = $(link).data("id");
	$.get(`/stories/${id}/details`, function(data) {
		let story = new Story(data["id"], data["title"], data["genre"], data["description"], data["team"], data["contributors"], data["submissions"]);
		$(".story_title").text(story.title);
		$(".story_team").html(`<h3><a href="/teams/${story.team.id}">By: ${story.team.name}</a></h3>`);
		$(".story_status").text("Status: ");
		$(".story_contributors").html(story.contributor_details());
		$(".story_content").html(story.content());

	})
}

function Story(id, title, genre, description, team, contributors, submissions) {
	this.id = id;
	this.title = title;
	this.genre = genre;
	this.description = description;
	this.team = team;
	this.contributors = contributors;
	this.submissions = submissions;
}

Story.prototype.details = function() {
	let authors = [];
	this.contributors.forEach(function(contributor) {
		authors.push(contributor.name);
	})
	let details = `<strong>Genre:</strong> ${this.genre}<br><strong>Description:</strong> ${this.description}<br>
	<strong>Contributors:</strong> ${authors}`;
	return details
}

Story.prototype.contributor_details = function() {
	let contributor_details = "";
	this.contributors.forEach(function(contributor) {
		contributor_details += `<a href="/users/${contributor.id}">${contributor.name}</a><br>`
	})
	return contributor_details
}

Story.prototype.content = function() {
	let content = "";
	this.submissions.forEach(function(submission) {
		content += `<p>${submission.content}</p>`
	})
	return content;
}
