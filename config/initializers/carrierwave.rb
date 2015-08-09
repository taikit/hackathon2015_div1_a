if Rails.env == 'production'
  CarrierWave.configure do |config|
    config.fog_credentials = {
        :provider => 'AWS',
        :aws_access_key_id => ENV['access_id'],
        :aws_secret_access_key => ENV['access_pass'],
        :region => 'ap-northeast-1',
        :path_style => true,
    }

    config.fog_public = true
    config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
    config.fog_directory = 'anklebsh'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/anklebsh'
  end
end