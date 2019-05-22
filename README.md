# Med Card REST API

#### Created By Ben Ghalami

This is an API with the ability to Create, View, Delete, and Edit Users, as well as Create, View, Delete, and Edit those Users Med Cards and State IDs

See the app in action at [HERE!](https://med-card-api-beng.herokuapp.com/)

## Endpoints

```
GET '/api/v1/users'  
	- See all Users
POST '/api/v1/users'  
	- Create a new User
	- Takes the following as JSON in the BODY
	- NONE of the fields can be empty
	- {    
	    "name": {VARCHAR},  
	    "email_address": {VARCHAR},
	    "date_of_birth": {YYYY-MM-DD}
	  }
    - MUST include HTTP header:
      `Content-Type` with value `application/json`
GET '/api/v1/users/:id'  
	- Show a single User with State ID and Medical Recommendation
	- EXAMPLE:
	  {
	    id: 1,
	    name: "Ben",
	    email_address: "ben@ben.com",
	    date_of_birth: "1992-08-05",
	    state_id: {
		  id_number: 4,
	      state: "Kansas",
	      expiration_date: "1995-08-05(EXPIRED)",
	      path_to_image: "/file/file/file/file.jpg"
	    },
	    medical_recommendation: {
		  recommendation_number:  4,
	      issuer: "A Doctor",
		  state: "Kansas",
	      expiration_date: "1995-08-05(EXPIRED)",
		  path_to_image: "/file/file/file/file.jpg"
       }
	}
PUT '/api/v1/users:id'  
	- Update an existing User
	- Takes any combination of the following JSON
	- {    
	  "name": {VARCHAR},  
	  "email_address": {VARCHAR},
	  "date_of_birth": {YYYY-MM-DD}
	  }
	- MUST include HTTP header:
      `Content-Type` with value `application/json`
DELETE '/api/v1/users:id'
	- Permanantly deletes a User and associated State ID and
	  Medical Recommendation from the database


GET '/api/v1/users/:user_id/state_id'
	- View a Users State ID info
	- EXAMPLE:
	  {
		id_number: 4,
	    state: "Kansas",
	    expiration_date: "1995-08-05(EXPIRED)",
	    path_to_image: "/file/file/file/file.jpg"
	  }
POST '/api/v1/users/:user_id/state_id'
	- Create a State ID for a User
	- Takes the following as JSON in the BODY
	- NONE of the fields can be empty
	- {    
	  "id_number": {INTEGER},
	  "state": {VARCHAR},
	  "expiration_date": {YYYY-MM-DD},
	  "path_to_image": {VARCHAR}
	  }
    - MUST include HTTP header:
      `Content-Type` with value `application/json`
PUT '/api/v1/users/:user_id/state_id'  
	- Edit an existing User State ID
	- Takes any combination of the following JSON
	- {    
	  "id_number": {INTEGER},
	  "state": {VARCHAR},
	  "expiration_date": {YYYY-MM-DD},
	  "path_to_image": {VARCHAR}
	  }
	- MUST include HTTP header:
      `Content-Type` with value `application/json`
DELETE '/api/v1/users/:user_id/state_id'
	- Permanently deletes a Users State ID


GET '/api/v1/users/:user_id/medical_recommendation'
	- View a Users Medical Recommendation
	- EXAMPLE:
	    {
		  recommendation_number: 4,
		  issuer: "A Doctor",
		  state: "Kansas",
		  expiration_date: "1995-08-05(EXPIRED)",
		  path_to_image: "/file/file/file/file.jpg"
	    }
POST '/api/v1/users/:user_id/medical_recommendation'  
	- Create a Medical Recommendation for a User
	- Takes the following as JSON in the BODY
	- NONE of the fields can be empty
	- {
		recommendation_number: {INTEGER},
		issuer: {VARCHAR},
		state: {VARCHAR},
		expiration_date: {YYYY-MM-DD},
		path_to_image: {VARCHAR}
	  }
    - MUST include HTTP header:
      `Content-Type` with value `application/json`
PUT '/api/v1/users/:user_id/medical_recommendation'  
	- Edit an existing User Medical Recommendation
	- Takes any combination of the following JSON
	- {
		recommendation_number: {INTEGER},
		issuer: {VARCHAR},
		state: {VARCHAR},
		expiration_date: {YYYY-MM-DD},
		path_to_image: {VARCHAR}
	  }
	- MUST include HTTP header:
      `Content-Type` with value `application/json`
DELETE '/api/v1/users/:user_id/medical_recommendation'
	- Permanently deletes a Users Medical Recommendation
	  from the DataBase
```

## Initial Setup

1. Clone the repository into a directory of your choosing:
  ```shell
  git clone git@github.com:GhostGroup/api-test-beng.git
  ```
2. Navigate into the new directory.
3.  Checkout the Dev branch

```shell
  git co branch dev
  ```
4. Install the dependencies:
  ```shell
  bundle install
  ```
  5. Run the following command to create, migrate, and seed the database
  ```shell
  rake db:create db:migrate db:seed
  ```


## Running the Server Locally

To see your code in action locally, you need to fire up a development server. From the root of the project  
use the command:

```shell
rails server
```

Once the server is running, visit in your browser, or with [PostMan](https://www.getpostman.com/):

* `http://localhost:3000/` to run your application.

* The DB should be populated with 3 test Users for you to play around with

* To quit the server simply press Ctrl + C to shut it down.


## Built With
#### Tech
* [Rails 5.1.7](https://rubyonrails.org/)
* [Ruby 2.4.1](https://www.ruby-lang.org/en/)
* [PostgreSQL](https://www.postgresql.org/)
* And last but CERTAINLY not least, [Stack Overflow](https://stackoverflow.com/)
#### Gems
 * [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
 * [RSpec](https://rspec.info/)
 * [Capybara](https://github.com/teamcapybara/capybara)
 * [Launchy](https://github.com/copiousfreetime/launchy)
 * [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)
 * [SimpleCov](https://github.com/colszowka/simplecov)
 * [Factory Bot](https://github.com/thoughtbot/factory_bot)
 * [Pry](https://github.com/pry/pry)
 * [RB Readline](https://github.com/ConnorAtherton/rb-readline)

 #### Organic
 * [Food](https://en.wikipedia.org/wiki/Food)
 * [Coffee](https://en.wikipedia.org/wiki/Coffee)
 * [My Brain](https://en.wikipedia.org/wiki/Human_brain)
 * [My Hands](https://en.wikipedia.org/wiki/Hand)
