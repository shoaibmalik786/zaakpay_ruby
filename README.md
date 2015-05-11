## Donations and sponsoring

If you want to support this project please visit the Gittip and Flattr pages.

[![Gittip donate button](https://img.shields.io/gratipay/shoaibmalik786.svg)](https://gratipay.com/shoaibmalik786 "Donate weekly to this project using Gratipay")


Currently the donations will be used to cover the hosting costs (domain name etc).

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

To Make a transaction using debit card or credit card.

  result = ZaakpayRuby::Transaction.sale(

    merchantIdentifier: 'Merchant Id of Zaakpay merchant account',
    orderId: 'Order675786, this must be unique',
    returnUrl: 'url where you want the response',
    buyerEmail: 'a@b.com',
    buyerFirstName: 'First name',
    buyerLastName: 'Last name',
    buyerAddress: 'Address',
    buyerCity: 'city',
    buyerState: 'state',
    buyerCountry: 'country',
    buyerPincode: 'zipcode',
    buyerPhoneNumber: '9874563210',
    txnType: '1',
    zpPayOption: '1',
    mode: '1',
    currency: 'INR',
    amount: '200000, amount should be in Paisa',
    merchantIpAddress: request.remote_ip,
    purpose: '1',
    productDescription: 'Test',
    shipToAddress: 'Shipping Address',
    shipToCity: 'shipping city',
    shipToState: 'shipping state',
    shipToCountry: 'shipping country',
    shipToPincode: 'shipping pincode',
    shipToPhoneNumber: 'shipping phone number',
    shipToFirstname: 'Ship To First Name',
    shipToLastname: 'Ship To Last Name',
    txnDate: '2015-05-11'
  )

For more information about the request parameters, go through the link provided below.

  https://www.zaakpay.com/developers#viewA

After that store the result with checksum from zaakpay api as

  @zaakpay_data = result
This @zaakpay_data must pass in the form.

For ex:

    <!DOCTYPE html>

    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <title>Zaakpay</title>
        </head>
        <body onload="javascript:submitForm()">
	        <center>
		        <table width="500px;">
		    	    <tr>
		    		    <td align="center" valign="middle">Do Not Refresh or Press Back
		    		    <br/> Redirecting to Zaakpay</td>
		    	    </tr>
		    	    <tr>
		    		    <td align="center" valign="middle">
		    			    <form action="https://api.zaakpay.com/transact" method="post">
		                        <% @zaakpay_data.each do |key, value| %>
		                          <input type="hidden" name="<%= key %>" value="<%= value %>" />
		                        <% end %>
		    			   </form>
		    		    </td>
			        </tr>
		        </table>
	        </center>
	        <script type="text/javascript">
	          function submitForm(){
	        		var form = document.forms[0];
	        		form.submit();
	        	}
	        </script>
    		</body>
    </html>



Get response by using this method
This should be in the action of the return Url
  response = ZaakpayRuby::Response.new(request.raw_post)

For response parameters, go to the

  https://www.zaakpay.com/developers#viewA_1


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/shoaibmalik786/zaakpay_ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
