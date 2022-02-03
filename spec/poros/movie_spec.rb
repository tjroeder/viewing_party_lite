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

  # describe 'factory object' do
  #   it 'should build a valid movie object' do
  #     genres = [{ id: 18, name: 'Adventure' }, { id: 14, name: 'Action' }]
  #     data = { title: 'Star Wars', id: 11, genres: genres, runtime: 160, vote_average: 9.1, overview: 'In a galaxy far, far away' }

  #     movie = build(:movie, title: 'abc', movie_id: 5, genres: 'xyz', runtime: 11, vote_average: 3, summary: 'defsdfksdfm')
  
  #     expect(movie).to be_a(Movie)
  #     expect(movie.title).to eq('abc')
  #     expect(movie.movie_id).to eq(5)
  #     expect(movie.genres).to eq('xyz')
  #     expect(movie.runtime).to eq(11)
  #     expect(movie.vote_average).to eq(3)
  #     expect(movie.summary).to eq('defsdfksdfm')
  #   end
  # end
end