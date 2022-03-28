# cashFlo

> Rails application to track your cash flow

cashFlo is a mobile web application where you can manage your budget: you have a list of transactions associated with a category, so that you can see how much money you spent and on what.

## Built With

- Ruby on Rails
- Tailwind CSS

## Getting Started

### Prerequisites

- Ruby
- Postgres server

### Setup

Clone this repo and enter the directory.

```sh
git clone git@github.com:eapenzacharias/cashflo.git && cd cashflo
```

### Install

Run the following command to install all the dependencies.

```sh
bundler install
```

### Usage

Run the following command to start the server, then go to http://localhost:3000

```sh
rails db:create # create database
rails db:migrate # migrate tables
rails db:seed # load all data in database from seed.rb

bin/dev # necessary to start the app for the first time
---- or ----
rails s # can be used after starting the app at least once
```

### Run tests

```sh
bundle exec rspec spec
```

## Author

👤 **Eapen Zacharias**

- GitHub: [@eapenzacharias](https://github.com/eapenzacharias)
- Twitter: [@eapenzac](https://twitter.com/eapenzac)
- LinkedIn: [LinkedIn](https://linkedin.com/in/eapenzac)


## Show your support

Give a ⭐️ if you like this project!
