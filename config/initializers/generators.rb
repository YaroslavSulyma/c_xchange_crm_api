Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
  g.system_tests = nil
  g.test_framework = nil
end
