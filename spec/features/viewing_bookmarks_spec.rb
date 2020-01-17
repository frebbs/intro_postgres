require 'pg'

feature 'Viewing bookmarks' do
  scenario 'Visiting /bookmarks shows me all the bookmarks' do
    # Add the test data
    Bookmark.create(title: 'Makers Academy', url: "http://makersacademy.com")
    Bookmark.create(title: 'Destroy All Software', url: "http://destroyallsoftware.com")
    Bookmark.create(title: 'Google', url: "http://google.com")

    visit('/')

    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "Destroy All Software"
    expect(page).to have_content "Google"
  end
end