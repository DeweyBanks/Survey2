[![Build Status](https://travis-ci.org/DeweyBanks/Survey2.svg?branch=master)](https://travis-ci.org/DeweyBanks/Survey2)
[![Code Climate](https://codeclimate.com/github/DeweyBanks/Survey2/badges/gpa.svg)](https://codeclimate.com/github/DeweyBanks/Survey2)
[![Coverage Status](https://coveralls.io/repos/github/DeweyBanks/Survey2/badge.svg)](https://coveralls.io/github/DeweyBanks/Survey2)

[<img src="http://www.deweybanks.com//assets/SurveyMakerLogo-ae170a18cb0ad54521588923b0856a2fa4a241b5198976391d5169def8fc6192.png">](https://survey-constructor.herokuapp.com/)

### SurveyMaker is an app for creating and taking surveys.

## Getting started

SurveyMaker works with Rails 4.2.8 It uses Facebook oath strategy with Devise.
You will need to aquire an APP_ID and APP_SECRET from Facebook.
To set up your version with Facebook visit:
[Facebook for Developers](https://developers.facebook.com/)

 clone the repo with:

```console
$ git clone git@github.com:DeweyBanks/survey.git
```

Then run
```console
$ bundle install
```

Next, you need to seed the database:

```console
$ rake db:seed
```

Create an .env file with the following keys:
```
APP_ID = "Your APP ID"
APP_SECRET = "Your APP SECRET"
ADMIN_EMAIL = "Your Email"
ADMIN_PASSWORD = "Your Password"
GMAIL_DOMAIN = "Site URL"
GMAIL_USERNAME = "Gmail Username"
GMAIL_PASSWORD = "Gmail Password"
```

Start your server and sign in/create your account. Make sure to add preferences
in the admin section.

To run the test suite
```console
$ rspec
```

#### User Stories
    Vistor = A user with no user_account
    User = A user who has signed up with a user_account. Has all abilites of Vistor.
    Admin = A User whos email matches the app's admin email. Has all abilities of User.

    As a Vistor I should be able to create a user_account using my Facebook account.
    As a Vistor I should be able to create a user_account using my email.
    As a Vistor I should be able to see all of the surveys created.
    As a Vistor I should be able to take all of the surveys created.
    As a Vistor I should be able to see the results of all the surveys created.
    As a Vistor I should be able to post the results of a survey to my Facebook Page.

    As a User I should be able to create a survey.
    As a User I should be able to see all of the comments left about a survey.
    As a User I should be able to post a comment.
    As a User I should be able to edit my comment.
    As a User I should be able to delete my comment.
    As a User I should be able to visit 'My Account' page
    As a User I should be able to edit my user information.
    As a User I should be able to see all of my surveys.
    As a User I should be able to edit my surveys.
    As a User I should be able to delete my surveys.
    As a User I should be able to delete my account.

    As an Admin I should be able to see all user_accounts
    As an Admin I should be able to delete a comment.
    As an Admin I should be able to delete a User account.
    As an Admin I should be able to ban an email from creating an account.


a working example can be found at:
[SurveyMaker on Heroku](https://survey-constructor.herokuapp.com/ "Survey Maker")
