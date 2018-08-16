$(document).ready(function() {
	$(".js-story-details").click(function() {
		var id = $(this).data("id");
		$.get(`/stories/${id}/details`, function(data) {
			$(`#detail-box-${id}`).html(details(data));
		})
	})
})

function details(story_data) {
	let authors = []
	story_data["contributors"].forEach(function(contributor) {
		authors.push(contributor.name);
	})
	let details = `<strong>Genre:</strong> ${story_data["genre"]}<br>
	<strong>Description:</strong> ${story_data["description"]}<br><strong>Contributors:</strong> ${authors}`;
	return details
}
