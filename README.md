# README

* this application allows the user to request blog posts from a website and receive a standardized filtered list from it. The original API allows only one tag filter per request, so the current application was developed to allow for simultaneous filters for several tags. This application is also configured to store the posts in a local server for future faster and less expensive queries of similar tags.

* To run this application, firstly run 'bundle install' to install the proper gems

* Then run 'rails s' to start a local server that will receive GET requests

* Open the browser (tested with Google Chrome) and go to localhost:3000/api/ping to get route 1

* localhost:3000/api/ping?tags=[REPLACE]. (put how many tags as you wish). Tags are mandatory

* you may insert a sortBy query parameter to order the results by any post attribute - if you choose a wrong one, an error msg will be shown. You can put an extra query parameter 'direction' that can contain either desc or asc

* to run the tests, just run bundle exec rspec

* the caching is prepared (through the storage of posts in a local database), but not turned on

* several validations on the query parameters are included (you can't use direction, without sortBy, for example)