# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie requests', type: :request do
  describe 'GET /movies/:id' do
    let(:movie) { create :movie }

    it 'returns status 200' do
      get("/movies/#{movie.id}")
      expect(response.status).to eq(200)
    end

    it 'returns correct body' do
      get("/movies/#{movie.id}")
      expect(JSON.parse(response.body)).to eq(
        {
          'id' => movie.id,
          'title' => movie.title,
          'length' => movie.length,
          'director' => movie.director,
          'genre' => movie.genre
        }
      )
    end
  end

  describe 'POST /movies' do
    let(:params) do
      {
        title: title,
        length: 'PT20S',
        director: 'Movie director',
        genre: 'Movie genre'
      }
    end
    let(:title) { 'title' }
    subject { post('/movies', params: params) }

    it 'returns created status' do
      subject
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /movies/:id' do
    let(:movie) { create :movie }
    let(:params) do
      {
        id: movie.id,
        title: 'updated title',
        length: 'PT30S',
        director: 'updated director',
        genre: 'updated ganre'
      }
    end
    subject { put("/movies/#{movie.id}", params: params) }

    it 'returns success stauts' do
      subject
      expect(response.status).to eq(200)
    end
  end
end
