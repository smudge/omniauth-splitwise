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

## Example

In the `example/` directory, run the provided Sinatra application for a demo:

    $ cd example/
    $ bundle
    $ SPLITWISE_KEY=abc123 SPLITWISE_SECRET=def456 rackup

Then visit [localhost:9292](http://localhost:9292) to try it out.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# License

Copyright (C) 2014 by Nathan Griffith

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.