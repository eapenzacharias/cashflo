# cashFlo

> Rails application to track your cash flow

| ![](https://user-images.githubusercontent.com/49812651/161870023-731acda2-e065-4a8d-ab35-d4e0960b2d85.png) | ![](https://user-images.githubusercontent.com/49812651/161870169-a292cd94-d4a6-4ad3-b6db-9ed42f1ade23.png) | ![](https://user-images.githubusercontent.com/49812651/161870268-993ea45b-ccd0-4eb7-9baf-eb778bde6d78.png) | ![](https://user-images.githubusercontent.com/49812651/161870516-d6802bf5-238d-43b8-9ab6-162a8540f4fe.png) |
|:---:|:---:|:---:|:---:|

| ![](https://user-images.githubusercontent.com/49812651/161870318-986c304c-1d4d-43e5-827e-1d3d0fdd9c02.png) | ![](https://user-images.githubusercontent.com/49812651/161870615-264bcd6d-7141-481b-bf55-e431695e84c2.png) | ![](https://user-images.githubusercontent.com/49812651/161870590-32fda25b-f908-444a-8aaf-267ac3fee830.png) | ![](https://user-images.githubusercontent.com/49812651/161871290-1243073c-5103-4c53-a7cc-1a2ce8b87138.png) |
|:---:|:---:|:---:|:---:|

cashFlo is a mobile web application where you can manage your budget: you have a list of transactions associated with a category, so that you can see how much money you spent and on what.

## Built With

- Ruby on Rails
- [Tailwind CSS](https://tailwindcss.com/)
- [Alpine.js](https://alpinejs.dev/)

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
bundle install
```

### Usage

Run the following command to start the server, then go to http://localhost:3000

```sh
rails db:create # create database
rails db:migrate # migrate tables

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
- LinkedIn: [@eapenzac](https://linkedin.com/in/eapenzac)

## Acknowledgments
- Design Inspiration [Gregoire Vella on Behance](https://www.behance.net/gregoirevella).

## Show your support

Give a ⭐️ if you like this project!
