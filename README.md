# README

A simple store manager using Ruby On Rails.

You can checkout demo at https://storemanager19.herokuapp.com/

Ïnitial setup
* rake db:setup rake db:migrate

Run test suit
* bundle exec rspec spec

This project uses mysql(development) and postgres(production) database, you can change it by your own. This is only necessary for heroku deployment purposes, as it doesn't work well with mysql.
