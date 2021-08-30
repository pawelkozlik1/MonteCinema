# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { 'Movie title' }
    length { 'PT20S' }
    director { 'Movie director' }
    genre { 'Movie genre' }
  end
end
