# README

## Heroku URL
https://secret-caverns-60431.herokuapp.com/

## Ruby Version
ruby-2.2.3

## Project-bootstrapping

###Database setup
From a postgres console:

```shell
CREATE DATABASE development;
CREATE DATABASE test;
```

###Clone Github Repo
```shell
git clone https://github.com/paulafeleggakis/bakery-app.git
cd bakery-app
bundle exec rails db:migrate db:seed db:test:prepare
bundle install
bundle exec rails s
```
The app should be available on localhost:3000
