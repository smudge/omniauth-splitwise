# OmniAuth Splitwise

An OmniAuth strategy for authenticating to [Splitwise](http://www.splitwise.com). To use it, you'll need to [sign up for a Consumer Key and Secret](https://secure.splitwise.com/oauth_clients).

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-splitwise'

And then execute:

    $ bundle

Or install it yourself:

    $ gem install omniauth-splitwise

## Usage

For Rack apps, in your config.ru:

```ruby
use OmniAuth::Builder do
  provider :splitwise, ENV['SPLITWISE_KEY'], ENV['SPLITWISE_SECRET']
end
```

For Rails apps, in config/initializers/omniauth.rb:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :splitwise, ENV['SPLITWISE_KEY'], ENV['SPLITWISE_SECRET']
end
```

See also: [Integrating OmniAuth Into Your Application](https://github.com/intridea/omniauth#integrating-omniauth-into-your-application).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
