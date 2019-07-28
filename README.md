# Hahamut

[![Build Status](https://travis-ci.com/elct9620/hahamut.svg?branch=master)](https://travis-ci.com/elct9620/hahamut) [![Coverage Status](https://coveralls.io/repos/github/elct9620/hahamut/badge.svg?branch=master)](https://coveralls.io/github/elct9620/hahamut?branch=master)

The [Bahamut Forum](https://gamer.com.tw)'s Chatbot ruby client implements

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hahamut'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hahamut

## Usage

If you are using Rack, just run it

```ruby
run Hahamut::Engine
```

If you are using Rails, mount it in your `config/routes.rb`

```ruby
mount Hahamut::Engine => '/hahamut'
```

### Configure

This gem is support multiple chatbot, we can use `#setup` to configure it.

```ruby
# config/initializers/hahamut.rb

Hahamut::Engine.setup do |config|

  # Strong recommendation to put in credentials or environment variables
  config.register bot_id: 'YOUR_BOT_ID',
                  token: 'YOUR_BOT_TOKEN',
                  secret: 'YOUR_BOT_SECRET'
end
```

### Handling Event

When you setup Hahamut, you can set handler

```ruby
# config/initializers/hahamut.rb

Hahamut::Engine.setup do |config|

  # Your bot register

  # Option 1
  config.on_message do |bot, event|
    # Implement your bot behavior
  end

  # Option 2
  config.handler = ChatbotHandler
end
```

> If you want to use the handler object, you must implement a `#call` method

### Sending Message

Current support message types

* Text
* Image
* Sticker
* BotStart
* BotEvent

When you receive a message, you will get the bot instance and event.
To send a message, you have to use bot instance to send a message object.

```ruby
message = Hahamut::Message::Text.new(text: 'Hello World')
bot.send_to 'RECIPIENT_ID', message
```

> BotStart can accept `init` attribute with BotEvent, it can help you write less JSON for it.
> This feature will be improved in the future to make it easier to use.

### Upload Image

Same as send a message, we need a bot instance.
The result is a `Hahamut::Message::Image` object and you can send to the user directly.

```ruby
image = bot.upload('IMAGE_PATH')
bot.send_to 'RECIPIENT_ID', image
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/elct9620/hahamut. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Hahamut project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/elct9620/hahamut/blob/master/CODE_OF_CONDUCT.md).
