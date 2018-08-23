$(document).ready(function() {

	$("#prompt_generator").click(function() {
		$.get(`/prompts/random`, function(data) {
			let randomPrompt = new Prompt(data["id"], data["content"]);
			$("#random_prompt").html(`<p>${randomPrompt.content}</p>`);
		});
	});
})