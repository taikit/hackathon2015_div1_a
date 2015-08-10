if Rails.env == 'production'
  CarrierWave.configure do |config|
    config.storage = :aws
    config.aws_bucket = 'anklebsh'
    config.aws_acl = 'public-read'

    # The maximum period for authenticated_urls is only 7 days.
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

    # Set custom options such as cache control to leverage browser caching
    config.aws_attributes = {
        expires: 1.week.from_now.httpdate,
        cache_control: 'max-age=604800'
    }

    config.aws_credentials = {
        access_key_id: ENV['AC_ID'],
        secret_access_key: ENV['AC_PATH'],
        region: 'ap-northeast-1'
    }

  end
end