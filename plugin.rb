# frozen_string_literal: true

# name: discourse-override-smtp
# about: Override smtp server email
# version: 0.0.1
# authors: Billy
# url: https://github.com/billykidz/discourse-override-smtp
# required_version: 3.0.0

enabled_site_setting :override_smtp_enabled

after_initialize do
  
  DiscourseEvent.on(:before_email_send) do |*params|

    if SiteSetting.override_smtp_enabled
  
      message, type = *params

      message.delivery_method.settings[:address] = SiteSetting.override_smtp_address
      message.delivery_method.settings[:port] = SiteSetting.override_smtp_port
      message.delivery_method.settings[:domain] = SiteSetting.override_smtp_domain
      message.delivery_method.settings[:user_name] = SiteSetting.override_smtp_username
      message.delivery_method.settings[:password] = SiteSetting.override_smtp_password
      message.delivery_method.settings[:authentication] = SiteSetting.override_smtp_authentication_mode
      message.delivery_method.settings[:enable_starttls] = SiteSetting.override_smtp_enable_starttls
      message.delivery_method.settings[:enable_starttls_auto] = SiteSetting.override_smtp_enable_starttls_auto
      message.delivery_method.settings[:openssl_verify_mode] = SiteSetting.override_smtp_openssl_verify_mode
      message.delivery_method.settings[:ssl] = SiteSetting.override_smtp_ssl
      message.delivery_method.settings[:tls] = SiteSetting.override_smtp_tls
      message.delivery_method.settings[:open_timeout] = SiteSetting.override_smtp_open_timeout
      message.delivery_method.settings[:read_timeout] = SiteSetting.override_smtp_read_timeout
      
    end
   
  end
      
end

# override_smtp_enabled
# message.delivery_method.settings is like:
# {:address=>"localhost",
#  :port=>1025,
#  :domain=>"localhost.localdomain",
#  :user_name=>,
#  :password=>,
#  :authentication=plain>,
#  :enable_starttls=>true,
#  :enable_starttls_auto=>false,
#  :openssl_verify_mode=>none,
#  :ssl=>,
#  :tls=>,
#  :open_timeout=>5,
#  :read_timeout=>30,
#  :return_response=>true}

# address of smtp server used to send emails
#smtp_address =
# port of smtp server used to send emails
#smtp_port = 25
# domain passed to smtp server
#smtp_domain =
# username for smtp server
#smtp_user_name =
# password for smtp server
#smtp_password =
# smtp authentication mechanism
#smtp_authentication = plain
# enable TLS encryption for smtp connections
#smtp_enable_start_tls = true
# mode for verifying smtp server certificates
# to disable, set to 'none'
#smtp_openssl_verify_mode =
# force implicit TLS as per RFC 8314 3.3
#smtp_force_tls = false
# number of seconds to wait while attempting to open a SMTP connection
#smtp_open_timeout = 5
# Number of seconds to wait until timing-out a SMTP read(2) call
#smtp_read_timeout = 30
# number of seconds to wait while attempting to open a SMTP connection only when
# sending emails via group SMTP
#group_smtp_open_timeout = 30
# Number of seconds to wait until timing-out a SMTP read(2) call only when sending
# emails via group SMTP
#group_smtp_read_timeout = 60
