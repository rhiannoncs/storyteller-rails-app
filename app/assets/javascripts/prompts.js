$(document).ready(function() {
	$(".js-prompts").click(function() {
		show_prompts();
	})
})

function show_prompts() {
	fetch('/prompts')
		.then((response) => response.json())
		.then(function(data) {
			data.forEach(function(entry) {
				let new_prompt = new Prompt(entry.id, entry.content)
				$("#prompt_box").append(`${new_prompt.content}<br>`)
			})
		})
}

class Prompt {
	constructor(id, content) {
		this.id = id;
		this.content = content;
	}
}