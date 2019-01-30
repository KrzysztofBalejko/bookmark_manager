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

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.google.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.reuters.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.bbc.com');")

    visit('/bookmarks')
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.reuters.com')
    expect(page).to have_content('http://www.bbc.com')
  end
end

feature 'adding bookmarks' do
  scenario 'A user can add a bookmark' do
    visit('/')
    fill_in 'Add', with: 'http://www.bbc.com'
  end
end
