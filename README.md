# Paynow ZW
Paynow is a simple and slightly opinionated Ruby abstraction of the Paynow API in Zimbabwe. 

The aim of this library is to provide a clean interface when interacting with the Paynow API. Wrappers in other languages offer a similar interface to create payments but Paynow ZW is simpler, it unifies different modes of payment.

## Installation ##

Installation from rubygems:

```bash
gem install paynow
```

Or, if you're using bundler, add the following line to your Gemfile:

```bash
gem 'paynow'
```

And then run:

```bash
bundle install
```

Next, run the generator:

```bash
rails g paynow:install
```

Finally, the generator creates a config file at `config/initializers/paynow.rb`. Head over to that file, uncomment **all** the configs and alter them with values applicable to your application.

## Usage ##

The following example demonstrates how to do a payment using Paynow ZW 

```ruby
result = Paynow::Payment.create(
  amount: 20.21,
  reference: 1984,
  method: "pay_with_paynow", # use this value for payments redirecting to paynow
  additional_info: "Dance to the end of love weekend pass"
)

if result.success?
  #some so order stuff
  redirect_to paynow_redirect_url
else
  puts result.status
end
```

The next example demonstrates how to do an express mobile money payment 

```ruby
result = Paynow::Payment.create(
  amount: 19.98,
  reference: 405,
  method: "ecocash", # Or use "onemoney"
  phone: "0771111111",
  authemail: "bles@heyheyhey.com",
  additional_info: "The Hanging Gardens of Beatenberg" # optional
)
                    
if result.success?
 #do some order stuff
 #poll the status of the payment using the poll_url method ie. result.poll_url
end
```
You can use **pay_with_paynow** to redirect to Paynow as shown in the first example. You can also use the **poll_url** to check for the status of both express and basic payments.

The last example demonstrates how to do an express visa or mastercard payment
```ruby
result = Paynow::Payment.create(
  additionalinfo: "Matthew Field Solo Debut ", #optional
  amount: 18.90,
  authemail: "bles@heyheyhey.com", 
  billingline1: "11 Wembley Street",
  billingline2: "Italia", # optional
  billingcity: "Mutare",
  billingprovince: "Manicaland", #optional
  billingcountry: "Zimbabwe",
  cardnumber: "4242424242424242",
  cardname: "visa",
  cardcvv: "344",
  method: "vmc",
  reference: 405,
)
```

You can only specify four payment methods. The 'pay_with_paynow' option redirects to paynow. 

Method        | Value  
----------------- | -----------------
Ecocash | ecocash
OneMoney | onemoney
Paynow | pay_with_paynow
Visa or Mastercard | vmc

## Note ##
For more in-depth documentation, head over to https://developers.paynow.co.zw/quickstart.html

To generate integration keys, head over to https://developers.paynow.co.zw/docs/integration_generation.html

There are a few features in the pipeline. They probably won't change how you interact with the Paynow API using this library. 



 