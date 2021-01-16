feature 'Updating bookmark' do
  scenario 'A user can update a bookmark' do
    
    # Add the test data
    
    bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
    fill_in('title', with: 'New URL')
    fill_in('url', with: 'http://www.new-url.com')
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('New URL', href: 'http://www.new-url.com')
  end
end