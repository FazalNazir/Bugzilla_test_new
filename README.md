# Bugzilla
  Bugzilla is a web application made in ruby on rails. It is a simple system to keep track of projects and further work assigned and to be done by Managers, Developers and Testers.
  Following are some details that would help you to get this app up and running in your system.
#### Ruby version
ruby 2.7
#### Rails version
rails 5.2
### System dependencies
#### Configuration
* Make sure you set all these configurations in your system before using this app.
* Make sure to have ruby installed. You can check by running following command:
```console
~$ ruby -v
* Make sure to have rails installed as well.
~$ rails -v
* Install and enable postgresql.
```console
~$ sudo yum install postgresql-server postgresql-contrib
* Create postgres database cluster.
```console
~$ sudo postgresql-setup initdb
```
* Install necessary gems.
```console
~$ bundle install
```
* Run following data to initialize DB with seed data.
```console
~$ rails db:seed
```
* Run Rails server.
```console
~$ rails s
```
* You are all set. Now you can run this app on your system.
#### Author/Developer
* Muhammad Asad Yasin
