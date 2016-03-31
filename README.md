![Jelly](app/assets/images/logo-text.png)

**Let's get daily meetings down to minutes.**

Jelly is an application for managing the reports submitted for Jelly
Baby Tree meetings.

Read more about Jelly and this style of meeting at
<https://fishpercolator.co.uk/jelly/>.

![Codeship status](https://codeship.com/projects/16c733a0-f056-0132-a07e-0e935ee940a2/status?branch=master)

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

Jelly follows the [Twelve-Factor App](http://12factor.net/)
specification as closely as possible, which makes it easy to deploy on
any hosting platform. It has been extensively tested with
[Heroku](https://www.heroku.com/) and
[Docker](https://www.docker.com/).

### Configuration

Jelly is configured using environment variables. The variables you
need to know are:

Variable name   | Purpose
----------------|---------
RAILS_ENV       | Set the app to development or production mode (set automatically on Heroku).
SECRET_KEY_BASE | Set a secret for signing sessions (set automatically on Heroku).
DATABASE_URL    | The [URL](http://edgeguides.rubyonrails.org/configuring.html#configuring-a-database) for your PostgreSQL database (set automatically on Heroku).
APPHOST         | Set to the domain of your application (for including links in emails).
EMAIL_SENDER    | The email address that "forgot password" emails will be sent from. Defaults to `jelly@${APPHOST}`. (See notes below if you're using Postmark.)
SMTP_SERVER     | SMTP server name (not needed if using Postmark).
SMTP_PORT       | SMTP server port if not 25 (not needed if using Postmark).
SMTP_DOMAIN     | SMTP authentication domain (not needed if using Postmark).
SMTP_USER       | SMTP authentication user (not needed if using Postmark).
SMTP_PASSWORD   | SMTP authentication password (not needed if using Postmark).
SMTP_AUTH       | SMTP authentication method if not `cram_md5`.

### Heroku

If you just want to deploy Jelly directly to the cloud, we recommend Heroku.

The quickest deployment uses the
[Heroku Postgres](https://addons.heroku.com/heroku-postgresql) and
[Postmark](https://addons.heroku.com/postmark) addons.

The following steps can be done with the Heroku web interface, but for
the purpose of illustration we're using the
[Heroku Toolbelt](https://toolbelt.heroku.com/).

```sh
# Check out the repo
git clone https://github.com/fishpercolator/jelly.git
cd jelly

# Create an app on Heroku (myjelly is an example name)
heroku apps:create myjelly

# Deploy the app codebase to Heroku
#   NOTE: This step automatically sets the RAILS_ENV, SECRET_KEY_BASE and
#   DATABASE_URL parameters
git push heroku master

# Create the database
#   NOTE: This step automatically installs the Postgres addon
heroku run rake db:migrate

# Set the other variables you need, for example:
heroku config:set APPHOST=jelly.fishpercolator.co.uk \
                  EMAIL_SENDER=jelly@fishpercolator.co.uk

# Add a domain alias for your APPHOST (if it's not appname.herokuapp.com)
heroku domains:add jelly.fishpercolator.co.uk

# (Optional) Install the Postmark addon.
#  NOTE: If you don't do this, be sure to set the SMTP_* variables
heroku addons:create postmark:10k

# Open the Postmark web UI: you need to add your $EMAIL_SENDER as a
# sender signature before Postmark will deliver mail for you
heroku addons:open postmark
```

That's it - you're ready to go!

### Docker

Jelly is available for deployment direct from Docker Hub.

Please see the instructions on
[its registry page](https://registry.hub.docker.com/u/fishpercolator/jelly/).

## Development environment

Please fork this repo and help to develop it! Pull requests are welcome.

A ready-made development environment is available using
[Docker Compose](https://docs.docker.com/compose/).

Go to your fork and run the following:

```sh
# Build the local development environment
docker-compose build
docker-compose run web bundle
# Add environment variables to the .env file as you wish, for example:
echo SECRET_KEY_BASE=$(docker-compose run web rake secret) >> .env
echo APPHOST=localhost:3000 >> .env
# Create the database
docker-compose run web rake db:create
docker-compose run web rake db:migrate
# Bring the application online
docker-compose up
```

By default, you should be able to access your development environment
at <http://localhost:3000/>.

If you add gems, you may not want to rebuild your entire environment
to load them. Gems are stored in a separate container volume and it
can be updated with:

```sh
docker-compose run web bundle
```

## Roadmap and known issues

The Jelly source code repository is [hosted at Github](https://github.com/fishpercolator/jelly).

The roadmap is being tracked on the associated [Github issue tracker](https://github.com/fishpercolator/jelly/issues). Please consult that page for details.

## Copyright & license information

MIT licensed. See LICENSE.
