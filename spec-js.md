# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
	- Used jQuery throughout code in welcome.js, stories.js and submissions.js
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
	- Rendering public stories with jQuery and AMS JSON.  See show_story() in stories.js.
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
	- Prompts index renders on the user dashboard using jQuery and AMS JSON.  See prompts.js.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
	- A story has many contributors and submissions.  See show_story() in stories.js and story_serializer.
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
	- Add submission to story via jQuery.  See submissions.js.
- [x] Translate JSON responses into js model objects.
	- Responses are turned into Story objects.  See stories.js.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
	- Story.details(), Story.contributor_details(), Story.content() in stories.js.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
