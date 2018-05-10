# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
	-User has_many Prompts 
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
	-Prompt belongs_to User
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
	-User has_many Stories through Submissions
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
	-Submission.content
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
	-Prompt, Story, Submission, Team, User
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
	-Team.open_membership URL: /teams
- [x] Include signup (how e.g. Devise)
	-User Create/Application authenticate methods
- [x] Include login (how e.g. Devise)
	-Sessions Controller, Application verify methods
- [x] Include logout (how e.g. Devise)
	-Sessions Controller
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
	-OmniAuth
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
	-URL: stories/1/submissions
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
	-URL: stories/1/submissions/new
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate