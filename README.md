Hestia
================

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Rails Composer is open source and supported by subscribers. Please join RailsApps to support development of Rails Composer.

Ruby on Rails
-------------

This application requires:

- Ruby 2.2.1
- Rails 4.2.0

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------
To test CAS login, change hosts using
```
sudo nano /etc/hosts
```
Add the line:
```
127.0.0.1 vgk.ugent.be
```

To start the server, issue these commands from within the project folder:
```
bundle
sudo rails s -p 80
```
(Running Webrick as root is dangerous!)

Setting up CMS
Go to /cms_admin to access CMS settings
Auth as in config>initializers>comfortable_mexican_sofa.rb
HTTP Authentication (use Incognito if necessary)
```
username
password
```

Create New Site
```
Hostname = localhost:3000
```
Create New Layout
```
App Layout = application
```
Create Page using default layout on localhost:3000/randomname

WORK IN PROGRESS

Documentation and Support
-------------------------

Issues
-------------

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------
