# OmniAuth Splitwise

An OmniAuth strategy for authenticating to [Splitwise](http://www.splitwise.com).
To use it, you'll need to [sign up for a Consumer Key and Secret](https://secure.splitwise.com/oauth_clients).

As of 2020, this gem uses OAuth 2.0 to interface with Splitwise.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-splitwise'

And then execute:

    $ bundle

Or install it yourself:

    $ gem install omniauth-splitwise

## App Setup

For Rack apps, in your config.ru:

```ruby
use OmniAuth::Builder do
  provider :splitwise, ENV.fetch('SPLITWISE_KEY'), ENV.fetch('SPLITWISE_SECRET')
end
```

For Rails apps, in config/initializers/omniauth.rb:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :splitwise, ENV.fetch('SPLITWISE_KEY'), ENV.fetch('SPLITWISE_SECRET')
end
```

See also: [Integrating OmniAuth Into Your Application](https://github.com/intridea/omniauth#integrating-omniauth-into-your-application).

### Usage

Once a successful OAuth2 request has been made, several fields are available immediately:

```ruby
auth = request.env['omniauth.auth']

auth['provider']  # => 'splitwise'
auth['uid']       # => Splitwise User ID
auth['info']      # => A hash containing 'first_name', 'last_name', and 'email'
auth['extra']     # => The full user hash from /api/v3.0/get_current_user
```

Additionally, the bearer token may be extracted and reused:

```ruby
auth = request.env['omniauth.auth']

token = auth['credentials']['token']
client = OAuth2::Client.new(ENV["SPLITWISE_KEY"], ENV["SPLITWISE_SECRET"])
access_token = OAuth2::AccessToken.new(client, splitwise_token)

# Start making API requests:
access_token.get('/api/v3.0/get_current_user').parsed
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
