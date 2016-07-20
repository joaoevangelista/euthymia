# Euthymia

***Because knowing your emotions matters***

[![build status](https://gitlab.com/joaoevangelista/euthymia/badges/master/build.svg)](https://gitlab.com/joaoevangelista/euthymia/commits/master)

## Development

### Ruby version:
`>= 2.2.5`

Be sure to install rails gem globally and have Devkit if needed for your platform.

### Configuration:
  - Set `TEST_KEY` env var to generated string from `rake secret ` also set a `DEV_KEY` to another generated string from `rake secret ` so they can be used on secrets.yml without been shared.


### Database creation
On the first use set a `DATABASE_URL` with user password and database
this uri will be used for development, on testing you need to set up
an uri named `POSTGRES_TEST_URI` which will set the database to be the test one

To migrate the database run `rake db:migrate`.

### Database initialization
After migrating the database run `rake db:seed` if you want to have sample data to work with, especially an user.

### Test suite:
Execute bundle with rspec `bundle exec rspec`, don't forget to check your style with `rubocop --auto-correct`.

## Contributing

All contributions are really apreciated, specially bug fixes and tests,
if you are going to create a new feature, please first create an issue so we can
discuss how to do it on a better way.

For more information see our [Contributing guide](./CONTRIBUTING.md).
