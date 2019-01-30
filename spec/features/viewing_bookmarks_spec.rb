require './app'

feature 'viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end
end

feature 'viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create(url: 'http://www.google.com')
    Bookmark.create(url: 'http://www.reuters.com')
    Bookmark.create(url: 'http://www.bbc.com')
    visit('/bookmarks')
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.reuters.com')
    expect(page).to have_content('http://www.bbc.com')
  end
end

feature 'adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://testbookmark.com')
    click_button('Submit')
    expect(page).to have_content 'http://testbookmark.com'
  end
end
