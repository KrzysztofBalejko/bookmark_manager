require 'bookmark'

RSpec.describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.reuters.com")
      expect(bookmarks).to include("http://www.bbc.co.uk")
    end
  end

end
