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

Set your environment variable `INTERCOM_ACCESS_TOKEN`.
About access token see [here](https://developers.intercom.com/docs/personal-access-tokens)

Inherit your Ahoy::Store fom Ahoy::Intercom::Store in `/config/initializers/ahoy.rb`
```ruby
class Ahoy::Store < Ahoy::Intercom::Store

end
```


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ahoy::Intercom project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ahoy-intercom/blob/master/CODE_OF_CONDUCT.md).
