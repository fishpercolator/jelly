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
EMAIL_SENDER    | The email address that "forgot password" emails will be sent from. Defaults to jelly@${APPHOST}. (See notes below if you're using Postmark.)
SMTP_SERVER     | SMTP server name (not needed if using Postmark).
SMTP_PORT       | SMTP server port if not 25 (not needed if using Postmark).
SMTP_DOMAIN     | SMTP authentication domain (not needed if using Postmark).
SMTP_USER       | SMTP authentication user (not needed if using Postmark).
SMTP_PASSWORD   | SMTP authentication password (not needed if using Postmark).
SMTP_AUTH       | SMTP authentication method if not `cram_md5`.

### Heroku

If you just want to deploy Jelly directly to the cloud, we recommend Heroku.

TODO

### Docker

TODO

## Development environment

TODO

## Roadmap and known issues

The Jelly source code repository is [hosted at Github](https://github.com/fishpercolator/jelly).

The roadmap is being tracked on the associated [Github issue tracker](https://github.com/fishpercolator/jelly/issues). Please consult that page for details.

## Copyright & license information

See LICENSE.
