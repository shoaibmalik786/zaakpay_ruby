# ZaakpayRuby
zaakpay_ruby is a ruby gem that demonstrates the integration of a ruby-on-rails application with Zaakpay's api.

A payment Gateway gem with easy installation and integration with rails 3, 4
-Payment Gateway Services.
-More than you want payment options with.
-major credit cards, debit cards and 52 netbanking banks.
-Fastest Merchant Approval.
-Smooth integration across 22 platforms.
-Start in minutes.
-Multi-Currency Processing Service with 13 currencies.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zaakpay_ruby'
```

And then execute:

    $ bundle

And run this command to create initializer file

    $ rails generate zaakpay_ruby:install

Or install it yourself as:

    $ gem install zaakpay_ruby

## Usage
First and foremost, you have to signup on the https://zaakpay.com for getting merchant_id and secret_key

For setting your account, go to https://www.zaakpay.com/developers#view3
Save your settings as per your requirements.

For transaction by buyer

First you have to make a request to the zaakpay by:
  request = ZaakpayRuby::Request.new(params)

Params would be the hash of parameters. Below are the required and optional parameters to pass in the request.
For more information about the request parameters, go through the link provided below.

   https://www.zaakpay.com/developers#viewA

Get response by using this method
  response = ZaakpayRuby::Response.new(request.raw_post)

For response parameters, go to the

  https://www.zaakpay.com/developers#viewA_1


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/zaakpay_ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
