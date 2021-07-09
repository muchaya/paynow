#Use this hook to configure the parameters necessary for your payments to work
#Uncomment all the commented configs and use values applicable to your own application
#Consider using rails credentials for sensitive secrets 
Paynow.setup do |config|

  # ==> Configure Paynow Secrets,
  #config.integration_id = Rails.application.credentials.paynow[:integration_id]
  #config.integration_key = Rails.application.credentials.paynow[:integration_key]

  # ==> Configure Paynow Urls
  #config.resulturl = "http://www.worldieweirdos.com/search?q=resulturl"
  #config.returnurl = "http://www.worldieweirdos.com/search?q=returnurl"
end


