class SiteController < ApplicationController
  require 'yaml'

  def index
    get_picture_keys

  end

  def connect_s3
    creds = YAML.load_file('config/secrets/aws.yml')
    creds = Aws::Credentials.new(creds["development"]["config"]["access_key_id"], creds["development"]["config"]["secret_access_key"])
    return Aws::S3::Client.new(region:'us-west-1', credentials: creds)
  end

  def get_picture_keys
    bucket_name = "super-pups"
    marker = ""
    s3 = connect_s3
    @keys = []
    if s3
      resp = s3.list_objects(bucket: 'super-pups', :marker=>marker, max_keys: 15)

      unless resp.size==0
        resp.contents.each do |object|
          @keys.push(object.key)
          marker = object.key
          puts "#{object.key} => #{object.etag}"
        end
      end
    end
  end

end
