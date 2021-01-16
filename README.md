# Sweater Weather (or, Whether Sweater?)

This app was created by Hope McGee.
[LinkedIn](linkedin.com/in/hope-mcgee) | [GitHub](github.com/users/hopesgit) | [Turing School Alumni Portfolio](https://alumni.turing.io/alumni/hope-mcgee)

This application is the backend for a fictional front-end that reports weather data from The OpenWeather API and presents it in visually-impressive format.

## Technical stuff:

* Ruby version: 2.5.3
* Rails version: 5.2.4.3
* This project is hosted on Heroku and tested using Travis CI.

## Getting started
To begin, clone or download this repo and run this in your terminal:
- `bundle install`
- `rails db:create`
- `rails db:migrate`
- `figaro install`
- This will install a file in the config folder called `application.yml`. Please be sure to fill in the `MAPQUEST_API_KEY` and `OPEN_WEATHER_API_KEY` with your own keys, which you can get from [here (MapQuest)](https://developer.mapquest.com/) and [here (OpenWeather)](https://openweathermap.org/api)

Happy mapping!
