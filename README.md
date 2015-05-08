# ZaakpayRuby

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

Or install it yourself as:

    $ gem install zaakpay_ruby

## Usage

First you have to make a request to the zaakpay by:

ZaakpayRuby::Request.new(params)

params would be the hash of parameters. Below are the required and optional parameters to pass in the request.

_________________________________________________________________________________
#Parameter	           Optional/Mandatory	    Validation	         Allowed Values
#________________________________________________________________________________
merchantIdentifier	         M	           alphanumeric	           Zaakpay's unique
                                                                   identifier for your
                                                                   website
------------------------------------------------------------------------------------------------
orderId	                     M	           max 20 alphanumeric,    Your unique transaction
                                           must be unique per      identifier
                                           website,we do not
                                           accept duplicate

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/zaakpay_ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
