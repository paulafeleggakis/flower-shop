# README

## Heroku Endpoint
https://guarded-depths-29391.herokuapp.com/

## Ruby Version
ruby 2.2.3p173

## Rails Version
5.0.1

## Project-bootstrapping

###Database setup
From a postgres console:

```shell
CREATE DATABASE development;
CREATE DATABASE test;
```

###Clone Github Repo
```shell
git clone https://github.com/paulafeleggakis/flower-shop.git
cd flower-shop
bundle exec rails db:migrate db:seed db:test:prepare
bundle install
bundle exec rails s
```
The app should be available on localhost:3000
