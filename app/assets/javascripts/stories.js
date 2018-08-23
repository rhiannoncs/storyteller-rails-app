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
		let story = new Story(data["id"], data["title"], data["genre"], data["description"], data["team"], data["next_public"], 
			data["contributors"], data["submissions"]);
		$(`#detail-box-${id}`).html(story.details());
	})
}

function show_story(link) {
	var id = $(link).data("id");
	$.get(`/stories/${id}/details`, function(data) {
		let story = new Story(data["id"], data["title"], data["genre"], data["description"], data["team"], data["next_public"],
			data["contributors"], data["submissions"]);
		$(".story_title").text(story.title);
		$(".story_team").html(`<h3><a href="/teams/${story.team.id}">By: ${story.team.name}</a></h3>`);
		$(".story_status").text("Status: ");
		$(".story_contributors").html(story.contributor_details());
		$("#story_content").html(story.content());
		$(".js-next-story").data("id", story.next_public.id);
		$("#new_submission").empty();

	})
}

class Story {
	constructor (id, title, genre, description, team, next_public, contributors, submissions) {
	this.id = id;
	this.title = title;
	this.genre = genre;
	this.description = description;
	this.team = team;
	this.next_public = next_public;
	this.contributors = contributors;
	this.submissions = submissions;
	}

	details() {
		let authors = [];
		this.contributors.forEach(function(contributor) {
		authors.push(contributor.name);
		})
		let details = `<strong>Genre:</strong> ${this.genre}<br><strong>Description:</strong> ${this.description}<br>
		<strong>Contributors:</strong> ${authors}`;
		return details
	}

	contributor_details() {
		let contributor_details = "";
		this.contributors.forEach(function(contributor) {
			contributor_details += `<a href="/users/${contributor.id}">${contributor.name}</a><br>`
		})
		return contributor_details
	}

	content() {
		let content = "";
		this.submissions.forEach(function(submission) {
			content += `<p>${submission.content}</p>`
		})
		return content;
		}
}

