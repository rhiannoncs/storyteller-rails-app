$(document).ready(function() {
	$(".js-story-details").click(function() {
		var id = $(this).data("id");
		$.get(`/stories/${id}/details`, function(data) {
			alert(data["title"]);
		})
	})
})