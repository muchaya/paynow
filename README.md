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
  #some so order stuff
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
 #poll the status of the payment using the poll_url method ie. result.poll_url
end
```
You can use **pay_with_paynow** to redirect to Paynow as shown in the first example. You can also use **poll_url** to check for the status of both express and basic payments.


You can only specify four payment methods. The 'pay_with_paynow' option redirects to paynow. 

Method        | Value  
----------------- | -----------------
Ecocash | ecocash
OneMoney | onemoney
Paynow | pay_with_paynow
Visa or Mastercard | vmc



## List of mandatory and optional fields when setting up your payments ##

#### Basic payments that redirect to Paynow ####
Mandatory         | Optional  
----------------- | -----------------
amount | additionalinfo
method | authemail
reference | tokenize


#### Ecocash and OneMoney #### 
Mandatory         |
----------------- | 
authemail |
amount | 
method |
phone |
reference | 

#### Visa and Mastercard #### 
Mandatory         | Optional  
----------------- | -----------------
authemail | billingline2
amount | billingprovince
billingcity | tokenize
billingcountry | 
billingline1 |
cardnumber | 
cardname | 
cardcvv | 
cardexpiry |
method |
reference |
token |


