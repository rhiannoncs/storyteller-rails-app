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
		let story = new Story(data["id"], data["title"], data["genre"], data["description"], data["contributors"], data["submissions"]);
		$(".story_title").text(story.title);
	})
	console.log(id);
}

function Story(id, title, genre, description, contributors, submissions) {
	this.id = id;
	this.title = title;
	this.genre = genre;
	this.description = description;
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
