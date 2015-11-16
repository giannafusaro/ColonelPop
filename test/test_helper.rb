ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'webmock'

include WebMock::API

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Create some fake movie data
  @all_movies = 5.times.inject([]) do |memo, i|
    memo << {
      id: i+1,
      title: Faker::Company.catch_phrase,
      overview: Faker::Lorem.paragraph,
      release_date: Faker::Date.backward.to_s,
      rating: %w(G PG PG-13 R NC-17).sample,
      poster_120x171: (poster=Faker::Company.logo),
      poster_240x342: poster,
      poster_400x570: poster,
      directors: [{ id: rand(1000), name: Faker::Name.name }]
    }
  end

  # Stub API calls
  endpoint = "https://api-public.guidebox.com/v1.43/US/#{Rails.application.secrets[:guidebox_api_key]}"
  stub_request(:any,"#{endpoint}/movies/all/0/15/all/all").to_return(status: 200, body: { results: @all_movies }.to_json)
  stub_request(:any,"#{endpoint}/movie/#{@all_movies.first[:id]}").to_return(status: 200, body: @all_movies.first.to_json)
  stub_request(:any,"#{endpoint}/movie/#{@all_movies.second[:id]}").to_return(status: 200, body: @all_movies.second.to_json)
end
