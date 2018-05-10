# Storyteller
***
A collaborative storytelling application, built using Ruby on Rails.  Users can create accounts and teams, join teams that are open for membership and create and edit stories with those teams. Users can also view stories created by others, if the stories are set to "public" and create and view writings prompts for story inspiration.

##Installation Guide
***
To get started, fork and clone this repository. From the file directory, run rake db:migrate, and then bundle install.

To enable Facebook log-in, create a file at the base of the directory called .env. Go to [the Facebook developer page](https://developers.facebook.com) to create an App ID and App Secret. The instructions [here](https://medium.com/@chinnatiptaemkaeo/integrate-omniauth-facebook-to-rails-5-1389d760d92a), under step 1, are useful. Paste these into your .env file in this format:

```
FACEBOOK_KEY=
FACEBOOK_SECRET=
```

Run the application with the command

```
thin start --ssl
```

##Contributor's Guide
***
Please file an issue on this repository to report any problems. Pull requests are welcomed, and may be integrated based on the discretion of the maintainer.

##License
***
This project is licensed under the MIT License - see the [LICENSE.md](..blob/master/LICENSE) file for more information.
