require 'bookmark'

RSpec.describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.times.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.github.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.bbc.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.o2.pl');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include('http://www.times.com')
    expect(bookmarks).to include('http://www.github.com')
    expect(bookmarks).to include('http://www.bbc.com')
    expect(bookmarks).to include('http://www.o2.pl')
    end
  end

end
