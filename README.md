# The Official Website of Azbolt

Setup
* Clone the repository into your local directory
* `bundle install`
* `npm install -g gulp-cli`
* `npm install`

Running Local Server
* `EXECJS_RUNTIME=Node bundle exec middleman server` to run Middleman Server using NodeJS [*(Middleman Server always hangs using default runtime)*](https://github.com/middleman/middleman/issues/1367)
* `http://localhost:4567/` to access your middleman site

Deploy to Github Pages
* `git remote add gh-pages git@github.com:azbolt/azbolt-staging.git` for adding staging repository to remote list.
* `rake deploy:production` will deploy to `azbolt.github.io`
* `rake deploy:staging` will deploy to `azbolt-staging`

Gulp uncss
* Using `gulp uncss` to remove unnecessary css
* Use minified classes in ignore list
