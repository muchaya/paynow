# Paynow ZW
Paynow ZW is a simple and slightly opinionated Ruby abstraction of the Paynow API

The aim of this library is to provide a clean interface when interacting with the PAYNOW API. Wrappers in other languages offer a similar interface to create payments but Paynow ZW is simpler, it unifies creating regular and express payments.

## Installation ##

Installation from rubygems:

```bash
gem install paynow-zw
```

Or, if you're using bundler, add the following line to your Gemfile:

```bash
gem 'paynow-zw'
```

And then run:

```bash
bundle install
```

Run the following generator:

```bash
rails g paynow:install
```

Finally, head over to config/initializers/paynow.rb. Uncomment the configs and alter them with values applicable to your application.

## Usage ##

The following example demonstrates how to do a payment using Paynow ZW 

```ruby
result = Paynow::Payment.create(
  amount: 20.21,
  reference: 1984,
  method: "pay_with_paynow",
  additional_info: "Dance to the end of love weekend pass"
)

if result.success?
  #do so order stuff
  redirect_to paynow_redirect_url
else
  puts result.status
end
```

The next example demonstrates how to do an express payment using Paynow ZW

```ruby
result = Paynow::Payment.create(
  amount: 19.98,
  reference: 405,
  method: "ecocash",
  phone: "0771111111",
  authemail: "bles@heyheyhey.com",
  additional_info: "The Hanging Gardens of Beatenberg"
)
                    
if result.success?
 #do some order stuff
 #poll the status of the payment using the poll_url method
end
```
## Optional and Mandatory fields when setting up your payments ##

###### All payments ######
mandatory: amount, reference, method
optional:  additionalinfo, authemail, tokenize

###### Mobile money (Ecocash and OneMoney) ###### 
mandatory: amount, reference, method, phone, authemail

###### Visa or Mastercard ######
mandatory: cardnumber, cardname, cardcvv, cardexpiry, billingline1, billingcity, billingcountry, token, authemail
optional: billingline2, billingprovince



