$(document).ready(function() {
	$(".js-story-details").click(function() {
		show_details(this);
	})
})

function show_details(button) {
	var id = $(button).data("id");
	$.get(`/stories/${id}/details`, function(data) {
		let story = new Story(data["id"], data["title"], data["genre"], data["description"], data["contributors"])
		$(`#detail-box-${id}`).html(story.details());
	})
}

function Story(id, title, genre, description, contributors) {
	this.id = id;
	this.title = title;
	this.genre = genre;
	this.description = description;
	this.contributors = contributors;
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
