# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movies::UseCases::Create do
  describe '.call' do
    let(:params) do
      {
        title: 'new title',
        length: '30',
        director: 'new director',
        genre: 'new genre'
      }
    end

    subject(:create_movies) { described_class.new(params: params).call }

    it 'creates new movie' do
      expect { create_movies }.to change { Movie.count }.by(1)
    end

    it 'returns Movie' do
      expect(create_movies).to be_a_kind_of(Movie)
    end

    it 'creates movie with correct attributes' do
      expect(create_movies).to have_attributes(params)
    end
  end
end
