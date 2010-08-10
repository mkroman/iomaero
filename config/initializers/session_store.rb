# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_IOMaero_session',
  :secret      => '2f5f6f4652e4924ec6b0459ef56521e51edb506c903e1198b73b2815551e47a2f929d2ebd501100d9e399458abadfedfd928ca52efa77bbc15f6a6fc70866757'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
