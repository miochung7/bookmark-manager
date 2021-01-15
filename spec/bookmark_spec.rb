require 'bookmark'
require 'database_helpers'

describe '.all' do
  it 'returns a list of bookmarks' do

    bookmark = Bookmark.create(url: 'http://www.twitter.com', title: 'Twitter')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')
    
    bookmarks = Bookmark.all

    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmark
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.title).to eq 'Twitter'
    expect(bookmarks.first.url).to eq 'http://www.twitter.com'
  end
end

describe '.create' do
  it 'a new bookmark' do

    bookmark = Bookmark.create(url: 'http://www.github.com', title: 'Github')
    persisted_data = persisted_data(id: bookmark.id)
    
    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data['id']
    expect(bookmark.url).to eq 'http://www.github.com'
    expect(bookmark.title).to eq 'Github'
  end
end

describe '.delete' do
  it 'deletes a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.github.com', title: 'Github')
    Bookmark.delete(id: bookmark.id)
    expect(Bookmark.all).not_to include(bookmark)
  end
end