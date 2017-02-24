# README

## Heroku Endpoint
https://guarded-depths-29391.herokuapp.com/

## GitHub Repo
https://github.com/paulafeleggakis/flower-shop.git

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

## Approach to Solving Brief
Please refer to design_documentation folder for supporting documentation.

* Create user stories in Trello.
* Use a noun extraction approach to help with class identification.
* Sketch up rough class diagram (this was revised as I progressed through the task)
* Initialize repo on GitHub.
* Dev approach can be seen through my commit history.
* Deploy onto Heroku 

## Limitations of Solution and Possible Improvements

* Unable to get Tulip selections working - pending spec created. I did not want to deploy Tulips as a Product, as I did not feel this was ready for Production.

* Additional work on the UI (lots!!)

* If an order has multiple line items of the same Product type, it may be worth combining these into a single line item.

* Bundle and BundleTotals models share attributes - there may be scope to make this more DRY.

* Controller and View testing

* Run the app through a CI tool (predefined pipeline) and deploy to prod only on green build.


