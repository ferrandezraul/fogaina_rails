# La Fogaina

This project implements a ruby on rails web application that is based on refinerycms gem.
The application is a web application which contains a content management system for a customer which is selling bread.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You need to install [RVM](https://rvm.io) for handeling ruby dependencies. 
See Gemfile and .ruby-version to see ruby version used.
You need to install [PostgreSQL](https://www.postgresql.org/)

### Installing

Clone this repository on your machine:

```
$ git clone https://github.com/ferrandezraul/fogaina.git
```
### Building
Cd into the cloned repository:
```
$ cd fogaina
```
If RVM was installed correctly it will detect the file .ruby-version and .ruby-gemset and it will create the gemsets for you or ask you to create them.

Run the following command to have the gems listed in Gemfile:
```
$ bundle install
```
Then, you need to configure the database.
The application expects to have a postgresql user called "raul" and a database named "development_fogaina"

Run the following command to create the database:
```
$ rake db:create
```
The command above will read the file config/database.yml and it will create the database development_fogaina if it does not exist already.
If you want to delete the database and create a new one, run the following commands:
```
$ rake db:drop
$ rake db:create
$ rake db:migrate
```
Then you can fill the database with data from db/seeds.rb with the command:
```
$ rake db:seed
```
Afterwards, you will be able to start the application with the command:
```
$ rails s
```
and open your browser with the following URL:
```
http://localhost:3000/
```
Run again the command:
```
$ rails s
```
and you should see the default content for the web application.

Tip: You can create, migrate and seed the database with a single command:
```
$ rake db:setup
```

### Configuring and running the unit tests

TODO

### Configuring and running the integration tests

TODO






