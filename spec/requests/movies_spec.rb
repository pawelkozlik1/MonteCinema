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
    let!(:movie) { create :movie, title: 'title', length: 'PT20S', director: 'director', genre: 'genre' }
    let(:params) do
      {
        id: movie.id,
        title: 'updated title',
        length: 'PT30S',
        director: 'updated director',
        genre: 'updated genre'
      }
    end
    subject { put("/movies/#{movie.id}", params: params) }

    it 'returns success stauts' do
      subject
      expect(response.status).to eq(200)
    end

    it 'updates post params' do
      expect { subject }
        .to change { movie.reload.title }
        .from('title')
        .to('updated title')
        .and change { movie.reload.length }
        .from('PT20S')
        .to('PT30S')
        .and change { movie.reload.director }
        .from('director')
        .to('updated director')
        .and change { movie.reload.genre }
        .from('genre')
        .to('updated genre')
    end
  end

  describe 'DELETE /movies/:id' do
    let!(:movie) { create :movie }
    subject { delete("/movies/#{movie.id}") }

    it 'returns proper status' do
      subject
      expect(response.status).to eq(200)
    end
  end
end
