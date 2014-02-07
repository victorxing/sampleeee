# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '5661d4ba4812cbf556d29b4d88ed4ba022c4c9b62ff24bc3426b12e5aa23aae8a7b7ab2b13fc28dd0b1f283232a2bcdb2664364ae99bac9d1f02aef4f93b908e'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret');
  if File.exists?(token_file)
    # Use the exists token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token