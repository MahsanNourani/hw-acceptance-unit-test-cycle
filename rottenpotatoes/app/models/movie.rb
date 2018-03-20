class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def movies_with_same_director
    results = []
    Movie.where(director: self.director).find_each do |movie|
      if movie != self
        results += [movie.title];
      end
    end
    puts results;
    return results
  end
end
