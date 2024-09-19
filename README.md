# README

## Redis configuration
To use Redis in your Rails project, you need to install both:

1. The Redis server (if not already installed on your system)
2. The redis gem (to connect your Rails app to the Redis server)


### 1. Steps to install redis in your system (ubuntu)
1. Install Redis Server
If you don’t have the Redis server installed on your machine, follow these steps:

``` bash
sudo apt update
sudo apt install redis-server
```

2. Run the redis server

```bash
redis-server
```

3. Commands for redis server
```bash
# check status
sudo systemctl status redis-server

# start redis
sudo systemctl start redis-server

# restart redis
sudo systemctl restart redis-server

# stop redis
sudo systemctl stop redis-server
```

### 2. Steps to connect rails app to redis server
1. Add this to your Gemfile:

```bash
gem 'redis'
```

2. Then install the gem

```bash
bundle install

# test
rails c
redis = Redis.new
redis.set("test_key", "Hello Redis!")
redis.get("test_key") 
```

## Sidekiq Configuration
1. Add this to your Gemfile

```bash
gem 'sidekiq'
```

2. Then install the gem

```bash
bundle install
```

3. Configure Sidekiq in Your Rails Application

```bash
# set up an initializer for Sidekiq by creating a new file
touch config/initializers/sidekiq.rb

# add this into the sidekiq.rb file
# This tells Sidekiq to connect to the local Redis server.
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end
```

4. Update config/application.rb
This tells Rails to use Sidekiq for background jobs:
Add this line inside the class Application < Rails::Application block:

```bash
config.active_job.queue_adapter = :sidekiq
```

5. Run the Sidekiq server to process jobs. In a separate terminal window, run:

```bash
bundle exec sidekiq
```
By default, Sidekiq will look for jobs in Redis on localhost:6379.
