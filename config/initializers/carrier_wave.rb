if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider => 'AWS',
      :aws_access_key_id => ENV['AKIAITRGZTDPSK4CZAFQ'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory = ENV['recipesaverimages']
  end
end