# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_reader-nest_session',
  :secret      => '78fb90c42a0218a2074704aa9846e37d90042b609b78d45d924c780517095279786a1f78e974e4ed219774dc7a5fdeba4cc4c2796c65600b1f9a311bca3b06d2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
