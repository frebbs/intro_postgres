require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    connection = ENV['ENVIRONMENT'] == 'test' ? PG.connect(dbname: 'bookmark_manager_test') : PG.connect(dbname: 'bookmark_manager')
    result = connection.exec('SELECT * FROM bookmarks')
    result.map do |bookmark|
      Bookmark.new(bookmark['id'],
                   bookmark['title'],
                   bookmark['url']
                  )
    end
  end

  def self.create(options)
    connection = ENV['ENVIRONMENT'] == 'test' ? PG.connect(dbname: 'bookmark_manager_test') : PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{options[:title]}', '#{options[:url]}') RETURNING id, title, url")
    Bookmark.new(result.first['id'], result.first['title'], result.first['url'])
  end

  def self.delete(id:)
    connection = ENV['ENVIRONMENT'] == 'test' ? PG.connect(dbname: 'bookmark_manager_test') : PG.connect(dbname: 'bookmark_manager')
    connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def ==(other)
    @id == other.id
  end
end