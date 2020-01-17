require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks in an array' do
      # Add the test data
      bookmark_1 = Bookmark.create(title: 'Makers Academy', url: "http://makersacademy.com")
      bookmark_2 = Bookmark.create(title: 'Destroy All Software', url: "http://destroyallsoftware.com")
      bookmark_3 = Bookmark.create(title: 'Google', url: "http://google.com")

      expected_bookmarks = [
        bookmark_1,
        bookmark_2,
        bookmark_3
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      expect(Bookmark.create(title: 'Test Bookmark', url: 'http://www.testbookmark.com').id).not_to be_nil
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '#==' do
    it 'two Bookmarks are equal if their IDs match' do
      bookmark_1 = Bookmark.new(1, 'Test Bookmark', 'http://testbookmark.com')
      bookmark_2 = Bookmark.new(1, 'Test Bookmark', 'http://testbookmark.com')

      expect(bookmark_1).to eq bookmark_2
    end
  end
end