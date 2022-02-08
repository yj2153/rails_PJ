CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                        # required
    config.fog_credentials = {
    provider:              'AWS',                        # required
        aws_access_key_id:     "#{ENV["AWS_ACCESS_ID"]}",                        # required
        aws_secret_access_key: "#{ENV["AWS_ACCESS_SECRET_KEY"]}",                        # required
        region:                "#{ENV["AWS_REGION"]}",             # asia-korea server 名称
        endpoint:              "#{ENV["AWS_S3_END_POINT"]}" # asia-korea server
    }
    config.fog_directory  = 'XXXXXXXXXXX'                          # required
    config.fog_public     = true                                        # optional, defaults to true
    config.fog_attributes = { } # optional, defaults to {}
    
    # イメージを持つポスターを削除しaws s3 serverにも自動削除を行う
    config.remove_previously_stored_files_after_update = true
end