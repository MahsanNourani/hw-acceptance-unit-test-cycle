require 'rails_helper'

# describe MoviesController do 
    
#     describe '#director' do
#         context "When specified movie has a director" do
            
#             it "should find movies with the same director" do
            
#             @movie_id ="1234"
#             @movie = double('fake_movie' , :director => 'James Cameron')
            
#             expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
#             expect(@movie).to receive(:samedirector)
            
#             gets :director , :id => @movie_id
                
#             expect(response).to render_template(:director)
#             end 
            
#         end
#         context "When specified movie has no director" do
#             it "should redirect to the home page" do
#                 @movie_id = '1234'
#                 @movie = double('fake_movie').as_null_object
#                 expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
#                 get :director , :id => @movie_id
#                 expect(response).to redirect_to(movies_path)
                
                
                
#             end
#         end
        
#     end
# end   


describe Movie do
    
    describe '#similar_movies' do
        
        it 'should find movies by the same director' do
            movie1 = Movie.create! :director => "Paul Newman"
            movie2 = Movie.create! :director =>  "Paul Newman"
            puts movie1.movies_with_same_director;
            puts movie2.director;
            expect(movie1.movies_with_same_director).to include(movie2.title)
        end 
        
        it 'should find movies by different director' do
            movie1 = Movie.create! :director => "Paul Newman"
            movie2 = Movie.create! :director => "James Cameron"
            expect(movie1.movies_with_same_director).not_to include(movie2.title)
        end 
        
    end
end