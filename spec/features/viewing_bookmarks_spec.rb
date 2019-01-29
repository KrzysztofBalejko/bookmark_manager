require './app'

feature 'viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end
end

feature 'viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://www.reuters.com")
    expect(page).to have_content("http://www.bbc.com")
  end
end
