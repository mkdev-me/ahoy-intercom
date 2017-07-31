# Ahoy::Intercom

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ahoy-intercom'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ahoy-intercom

## Usage

Set your environment variable `ENV['INTERCOM_ACCESS_TOKEN']`.
About access token see [here](https://developers.intercom.com/docs/personal-access-tokens)

Include Ahoy::Intercom::Tracker to Ahoy::Store in `/config/initializers/ahoy.rb`
and override `track_event` method.
Like this:
```ruby
def def track_event(name, properties)
  super
  track(name, properties)
end
```


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ahoy::Intercom project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ahoy-intercom/blob/master/CODE_OF_CONDUCT.md).
