# Given (^/the following movies exist$/)
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

When(/I go to the edit page for "([^"]*)$/) do |movie_title|
    # movie = Movie.find (title:movie_title)
    expect(current_path).to eq '/edit'
end

When (/I fill in "(.*)" with "([^"]*)$/) do |element, text|
  fill_in element.downcase, with: text
end

When (/I press "([^"]*)$/) do |element|
    click_on element
end

Then /^the director of "(.*)" should be "(.*)"$/ do |title_value, director_value|
  movie = Movie.find_by_title(title_value)
  expect(movie.director).to eq director_value
end

When /I follow "([^"]*)$/ do |element|
  click_on element
end

Then /I should see "([^"]*)$/ do |text|
  page.should have_content text
end

Then /I should not see "([^"]*)$/ do |text|
  page.should_not have_content text
end