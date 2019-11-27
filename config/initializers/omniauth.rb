OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '761570606352-85bn7021dq0d8fhaugq41kogdr18efph.apps.googleusercontent.com', 'PfJmqBZ9d0AZfu_l13ajPHFQ',
    {
      client_options: {
        ssl: {
          ca_file: Rails.root.join("cacert.pem").to_s
        }
      }
    }
end

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :office365, ENV['8d678c1b-2ec2-4fc6-b2d6-781f4480f9c0'], ENV['p2GUvCM2/eAQfK0A[0-ApwasPjXMnHn-'], :scope => 'https://outlook.office.com/mail.read'
  end
