# Jelly

Jelly is an application for managing the reports submitted for Jelly Baby Tree meetings.

## Jelly Baby Tree meetings

This style of meeting is a variation on the Scrum-style daily meeting, in which each member of the team is encouraged to present a brief report, containing the
following information:

1. The thing the team member is **most excited about** today. It may be work-related, it may not.

2. The three **achievements** the team member is most proud of from the previous day.

3. The three **tasks** the team member would most like to achieve today.

4. People **who can help** the team member achieve these goals.

5. A jelly baby on the tree, representing the team member's current **emotion**. The team member may explain this or may not, but it helps the team to understand how the team member is feeling that day.

Each report is accompanied by a slide for a visual cue and to keep the conversation on-topic.

This web-based app allows the team members to enter their slides before the meeting and then automatically organizes them into a presentation for use during the meeting.

## Installation

### Local installation

This is a standard Rails application based on PostgreSQL. Make sure you have
the following installed:

* Ruby 1.9 or above
* Rails 3.2 or above
* Bundler (gem install bundler)
* PostgreSQL server
* A Gmail or Google Apps Mail account (used to send email)

Next, install all the gem dependencies:

```console
$ bundle install
```

Install the PostgreSQL database (use password *j3llyb4by* if you don't want to edit database.yml):

```console
$ sudo -u postgres createuser -DPRS jelly
Enter password for new role: 
Enter it again: 
$ sudo -u postgres createdb -O jelly jelly
$ rake db:migrate
```

Finally, configure the application to work with your Gmail/Google Apps account. This is done using environment variables. The easiest way to do this is to create a file `config/initializers/00dev.rb` (which is in the `.gitignore` so will not be checked into Git):

```ruby
# Set up dev environment (will not be checked into git).
conf = {
  # Set to your Apps domain if you use Google Apps
  'GMAIL_DOMAIN' => 'gmail.com',
  # Must be the full email address you use to log into Gmail or Google Apps
  'GMAIL_USER' => 'someuser@gmail.com',
  # Gmail/Google Apps password
  'GMAIL_PASS' => 'sekrit',
  # Set this to the hostname for URLs that appear in development emails 
  'APPHOST' => 'localhost:3000',
  # Set this to an email address that will receive all email in development mode
  'DEV_EMAIL' => 'rich.daley.uk@gmail.com'
}
conf.each {|k,v| ENV[k] = v}
```
Now the application should be ready to run!

```console
$ rails server
```
Once you've registered a user, you'll probably want to make it an admin user. This can be done with a simple rake command:

```console
$ rake admin:add[user@example.com]
user@example.com is now an admin
```

### Installation to Heroku

[Heroku](http://www.heroku.com/) makes deployment of the app to the cloud ridiculously easy.

Once you have a Heroku account and the Heroku toolchain set up, all you need to do is:

```console
$ heroku login
Enter your Heroku credentials.
Email: user@example.com
Password (typing will be hidden): 
Authentication successful.
$ heroku create
Creating calm-shore-7081... done, stack is cedar
http://calm-shore-7081.herokuapp.com/ | git@heroku.com:calm-shore-7081.git
Git remote heroku added
$ heroku config:add GMAIL_DOMAIN=gmail.com
Setting config vars and restarting calm-shore-7081... done, v2
GMAIL_DOMAIN: gmail.com
$ # Do the above step for each of the config variables in your 00dev.rb
$ git push heroku
$ heroku run rake db:migrate
```

And that should be it! Your app should be ready to view at the URL Heroku assigned you during the `heroku create` step.

## Roadmap and known issues

The Jelly source code repository is [hosted at Github](https://github.com/pedantic-git/jelly).

The roadmap is being tracked on the associated [Github issue tracker](https://github.com/pedantic-git/jelly/issues). Please consult that page for details.

## Copyright & license information

See LICENSE.
