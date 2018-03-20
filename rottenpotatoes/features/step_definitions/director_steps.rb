# Given (^/the following movies exist$/)
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
    puts movie;
  end
end

When(/I go to the edit page for "([^"]*)$/) do |movie_title|
    # movie = Movie.find (title:movie_title)
    expect(current_path).to eq '/edit'
end

When (/I fill in "(.*)" with "(.*)$/) do |element, text|
  puts "************" +  element;
  fill_in element.downcase, with: text
end

When (/I press "(.*)$/) do |element|
    click_on element
end

Then /^the director of "(.*)" should be "(.*)"$/ do |title_value, director_value|
  movie = Movie.find_by_title(title_value)
  puts (movie.title + "**" + movie.director)
  expect(movie.director).to eq director_value
end