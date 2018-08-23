$(document).ready(function() {
	$("#new_submission").submit(function() {
		event.preventDefault();
		let values = $(this).serialize();
		let story_id = $("#submission_story_id").val();
		let posting = $.post(`/stories/${story_id}/submissions`, values);

		posting.done(function(data) {
			$("#story_content").append(data["content"]);
			$("#submission_content").val('');
		});
	});
})