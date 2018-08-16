$(document).ready(function() {

	$("#prompt_generator").click(function() {
		$.get(`/prompts/random`, function(data) {
			$("#random_prompt").html(`<p>${data["content"]}</p>`)
		});
	});
})