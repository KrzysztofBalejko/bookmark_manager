require './app'

feature 'viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end
end

feature 'viewing bookmarks' do
  scenario 'bookmarks are visible' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')

    visit '/bookmarks'

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
   end
end

feature 'adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    expect(page).to have_link('Test Bookmark', href: 'http://testbookmark.com')
  end
end
