# Supported tags

* `1.0.2`, `1.0`, `latest`

# ![Jelly](https://raw.githubusercontent.com/fishpercolator/jelly/master/app/assets/images/logo-text.png)

Jelly is an application for managing the reports submitted for Jelly
Baby Tree meetings.

Read more about Jelly and this style of meeting at
<https://fishpercolator.co.uk/jelly/>.

Find the source on Github at [fishpercolator/jelly](https://github.com/fishpercolator/jelly).

# How to use this image

## Using a [`postgres`](https://registry.hub.docker.com/u/library/postgres/)` container

### Start a database container

    $ docker run -d --name jelly-pg -e POSTGRES_USER=wibble -e POSTGRES_PASSWORD=wobble postgres

### Create the database using rake

	$ docker run --rm --link jelly-pg:db fishpercolator/jelly rake db:create
	$ docker run --rm --link jelly-pg:db fishpercolator/jelly rake db:schema:load

The `--link` should link your postgres container using the name `db`.

### Start a Jelly container

First, get yourself a unique value to use as `SECRET_KEY_BASE`:

    $ docker run --rm fishpercolator/jelly rake secret
    9ebfbb9f5ecf99fc7ea10e368400ea02bee34ffe4590fffc63a489dc01b4a431604526a6fc5ba6d696282ccb8878aeb1f74b8d56acb1a35415ca2f2d87ab00a2

Then start your container:

	$ docker run -d -p 3000:3000 --name jelly-web --link jelly-pg:db -e SECRET_KEY_BASE=9ebfbb9f5ecf99fc7ea10e368400ea02bee34ffe4590fffc63a489dc01b4a431604526a6fc5ba6d696282ccb8878aeb1f74b8d56acb1a35415ca2f2d87ab00a2 fishpercolator/jelly
	
Rails is exposed on port 3000, which you can open up or link to another container, such as [`nginx`](https://registry.hub.docker.com/u/library/nginx/).

## Using your own PostgreSQL database

If you have your own PostgreSQL database that is running outside of Docker (e.g. in Amazon RDS), then simply specify its URL as the `DATABASE_URL` instead of using `--link`. For example, in the schema step above:

    $ docker run --rm -e DATABASE_URL='postgres://user:password@host.amazonaws.com:5432/jelly_production' rake db:schema:load

# Configuration

All configuration variables are described in the [application README](https://github.com/fishpercolator/jelly/blob/master/README.md) on Github.

You *must* specify the `SECRET_KEY_BASE` variable or your sessions will be exposed to attack because Jelly will revert to the default key in the Dockerfile.

# Supported Docker versions

This image is supported on Docker version 1.6.0 and above.

# User feedback

If you have any problems with or questions about this Docker image, please contact Fish Percolator through a [Github issue](https://github.com/fishpercolator/jelly/issues).
