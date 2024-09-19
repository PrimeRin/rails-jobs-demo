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