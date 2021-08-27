# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movies::UseCases::Update do
  describe '.call' do
    let(:movie) { create :movie }
    let(:params) do
      {
        title: 'updated title',
        length: '32',
        director: 'updated director',
        genre: 'updated genre'
      }
    end

    subject(:update_movies) { described_class.new(id: movie.id, params: params).call }

    it 'updates movie' do
      expect { update_movies }
        .to change { movie.reload.title }
        .from('Movie title')
        .to('updated title')
        .and change { movie.reload.length }
        .from('PT20S')
        .to('PT32S')
        .and change { movie.reload.director }
        .from('Movie director')
        .to('updated director')
        .and change { movie.reload.genre }
        .from('Movie genre')
        .to('updated genre')
    end
  end
end
