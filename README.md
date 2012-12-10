#TEAMLINE

##A timeline for teams
Teamline is a great way to look back in time and view a team's accomplishments. Teamline aggregates the github activity, tweets and blog posts for a group of people and displays them on a timeline. The timeline also allows you to filter the data by team member, event type, and date.

Play with the app at <http://teamline.io>

##Contributing
We would love any contributions!

####How to contribute:
- Fork the repo
- Git checkout a new branch named based on the work you plan to add
- Make your addition or bug fix and test it to make sure nothing breaks
- Commit
- Submit pull request

##Setting Up Teamline
####Setup configuation files
1. add your computer/username to database.yml
2. Set up your API keys github and twitter

We created an example config file for you, run the following command to copy it into the correct file and put your keys and secrets in config/api_keys.yml
```
cp config/api_keys.example.yml config/api_keys.yml
```

####Run basic setup tasks
    rake bootstrap:setup

##Copyright
Copyright (c) 2012 [Flatiron School](http://flatironschool.com/), [David Baker](https://github.com/davidbakertv), [Matthew Salerno](https://github.com/seldomatt), [Kevin Curtin](https://github.com/kcurtin), [Ericka Ward](https://github.com/ejw1). See [LICENSE](https://github.com/flatiron-school/teamline/blob/master/LICENSE) for details.
