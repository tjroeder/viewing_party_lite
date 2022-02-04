# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :poro do
  describe 'object' do
    it 'exists and has attributes' do
      char1 = Cast.new({ name: 'Alec Guinness', character: 'Obi-Wan Kenobi' })
      char2 = Cast.new({ name: 'Carrie Fisher', character: 'Leia Organa' })
      cast = [char1, char2]

      review1 = Review.new({ author: 'Taco', content: 'Great Movie!' })
      review2 = Review.new({ author: 'Taco', content: 'Great Movie!' })
      reviews = [review1, review2]

      genres = [{ id: 18, name: 'Adventure' }, { id: 14, name: 'Action' }]
      data = { title: 'Star Wars', id: 11, genres: genres, runtime: 160, vote_average: 9.1, overview: 'In a galaxy far, far away' }
      movie1 = Movie.new(data, cast, reviews)

      expect(movie1).to be_a(Movie)
      expect(movie1).to have_attributes(title: 'Star Wars')
      expect(movie1).to have_attributes(movie_id: 11)
      expect(movie1).to have_attributes(genres: 'Adventure, Action')
      expect(movie1).to have_attributes(runtime: 160)
      expect(movie1).to have_attributes(vote_average: 9.1)
      expect(movie1).to have_attributes(summary: 'In a galaxy far, far away')
    end

    it 'has cast and review objects' do
      char1 = Cast.new({ name: 'Alec Guinness', character: 'Obi-Wan Kenobi' })
      char2 = Cast.new({ name: 'Carrie Fisher', character: 'Leia Organa' })
      cast = [char1, char2]

      review1 = Review.new({ author: 'Taco', content: 'Great Movie!' })
      review2 = Review.new({ author: 'Taco', content: 'Great Movie!' })
      reviews = [review1, review2]

      genres = [{ id: 18, name: 'Adventure' }, { id: 14, name: 'Action' }]
      data = { title: 'Star Wars', id: 11, genres: genres, runtime: 160, vote_average: 9.1, overview: 'In a galaxy far, far away' }
      movie1 = Movie.new(data, cast, reviews)

      expect(movie1.cast.first).to be_a(Cast)
      expect(movie1.reviews.first).to be_a(Review)
      expect(movie1).to have_attributes(cast: [char1, char2])
      expect(movie1).to have_attributes(reviews: [review1, review2])
    end
  end

  describe 'instance methods' do
    describe '#runtime_format' do
      it 'returns runtime formatted greater than one hour' do
        data = { title: 'Star Wars', id: 11, genres: nil, runtime: 160, vote_average: 9.1, overview: 'In a galaxy far, far away' }
        movie1 = Movie.new(data)

        expect(movie1.runtime_formatted).to eq('2 hrs 40 min')
      end

      it 'returns runtime formatted less than one hour' do
        data = { title: 'Star Wars', id: 11, genres: nil, runtime: 105, vote_average: 9.1, overview: 'In a galaxy far, far away' }
        movie1 = Movie.new(data)

        expect(movie1.runtime_formatted).to eq('1 hr 45 min')
      end
    end

    describe '#review_count' do
      it 'returns the count of total reviews' do
        char1 = Cast.new({ name: 'Alec Guinness', character: 'Obi-Wan Kenobi' })
        char2 = Cast.new({ name: 'Carrie Fisher', character: 'Leia Organa' })
        cast = [char1, char2]

        review1 = Review.new({ author: 'Taco', content: 'Great Movie!' })
        review2 = Review.new({ author: 'Taco', content: 'Great Movie!' })
        reviews = [review1, review2]

        genres = [{ id: 18, name: 'Adventure' }, { id: 14, name: 'Action' }]
        data = { title: 'Star Wars', id: 11, genres: genres, runtime: 160, vote_average: 9.1, overview: 'In a galaxy far, far away' }
        movie1 = Movie.new(data, cast, reviews)

        expect(movie1.review_count).to eq(2)
      end
    end
  end
end
