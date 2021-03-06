# Kele

A Ruby Gem API client to access the Bloc API; Bloc student project. 

Rather than using cURL to access the Bloc Application API, you can use this gem to access student information in your own Rails application or API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kele'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kele

## Usage

Once installed, you can Initialize and authorize Kele wih a Bloc username and password using IRB. 

You can find all of Bloc's documentation here: https://blocapi.docs.apiary.io/

```ruby
$ irb
>> require 'kele'
=> true
>> Kele.new("jane@gmail.com", "abc123")
```
Here are a few examples:

Retrieve the current user:

```ruby
$ irb
>> require 'kele'
=> true
>> kele_client = Kele.new("jane@gmail.com", "abc123")
>> kele_client.get_me
```
Retrieve a list of their mentor's availability:
```ruby
$ irb
>> require 'kele'
=> true
>> kele_client = Kele.new("jane@gmail.com", "abc123")
>> kele_client.get_mentor_availability
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/allyrv/bloc-kele.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
