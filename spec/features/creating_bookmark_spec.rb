
feature 'Adding a new bookmark' do
  scenario 'user can add a bookmark to Bookmark Manager' do
  
  visit('/bookmarks/new')
  fill_in('url', with: 'http://www.github.com')
  click_button('Submit')
  expect(page).to have_content('http://www.github.com')
  end
end