# Steps to getting it working

## Locally

1. Clone this application locally
2. Install all dependencies with `bundle install`
3. Create the database
  1. Copy the `database.default.yml` to `database.yml`
  2. This is used locally by your server for your local environment
  3. Run `rake db:create` to create the database
  4. Run `rake db:migrate` to create/ update all new and existing tables
4. Try running the app locally with `rails s`

## Deploying on heroku

[Reference Heroku guide] (https://devcenter.heroku.com/articles/getting-started-with-rails5#rake)

1. Login into heroku using the toolbelt - `heroku login`
  1. ```Enter your Heroku credentials.
    Email: schneems@example.com
    Password:
    Could not find an existing public key.
    Would you like to generate one? [Yn]
    Generating new SSH public key.
    Uploading ssh public key /Users/adam/.ssh/id_rsa.pub```
2. Create your application - `heroku create`
  1. ```Creating app... done, infinite-scrubland-50119
    https://infinite-scrubland-50119.herokuapp.com/ | https://git.heroku.com/infinite-scrubland-50119.git```
3. Verify that the heroku remote is present (it works very much like git) - `git config --list | grep heroku
`
  1. ```remote.heroku.url=https://git.heroku.com/infinite-scrubland-50119.git
    remote.heroku.fetch=+refs/heads/*:refs/remotes/heroku/*```
4. Deploy your code - `git push heroku master`
5. If you are using the database in your application you need to manually migrate the database by running: - `heroku run rake db:migrate`
  1. Any commands after the heroku run will be executed on a Heroku dyno. You can obtain an interactive shell session by running $ heroku run bash
6. You’ve deployed your code to Heroku. You can now instruct Heroku to execute a process type. Heroku does this by running the associated command in a dyno, which is a lightweight container that is the basic unit of composition on Heroku.
Let’s ensure we have one dyno running the web process type:
  1. `heroku ps:scale web=1`
  2. You can check the state of the app’s dynos. The heroku ps command lists the running dynos of your application: `heroku ps`
  3. Here, one dyno is running. We can now visit the app in our browser with `heroku open`
7. View the logs. If you run into any problems getting your app to perform properly, you will need to check the logs.
  1. You can view information about your running app using one of the logging commands, `heroku logs`
8. Let's visit the app on [heroku.com] (www.heroku.com)

## Rails Admin

1. Create a user account
2. Take a look at your database record for the users table, what do you see?
3. Take a look at the user.rb script and compare it to how attributes are defined in the database, what is different?
4. Now use sql to update the user_level to give yourself admin access
5. Try using the rails_admin dashboard, where can you find the url path of the admin panel?