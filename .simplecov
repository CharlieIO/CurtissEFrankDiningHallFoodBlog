SimpleCov.start 'rails' do
  add_filter "/features"
  add_filter "app/mailers"
  add_filter "app/jobs"
  add_filter "app/channels"
end
