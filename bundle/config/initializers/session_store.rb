# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bundle_session',
  :secret      => '0f84f2892a7ef202ae2f26eb11e35c0edbaf2ad253a99540ee2565380fba8cdd3d43508968b85e5836aaa01516c14bbdd2e2f958c6028ac9a9db5311ce9ced90'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
