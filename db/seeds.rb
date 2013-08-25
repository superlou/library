# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Patron.delete_all
Book.delete_all
Checkout.delete_all

books_file_path = File.join Rails.root, 'db', 'seed', 'manga_library_notes.csv'
books_file = File.open(books_file_path, "r:ISO-8859-1")
books = CSV.parse(books_file, headers: true)

books.each do |book|
  title = book['Title']
  code = book['Number']
  subtitle = book['Subtitle']
  volume = (book['Volume'] != '0') ? book['Volume'] : nil
  oversized = (book['Oversized'] == '1')
  non_standard_size = (book['Non Standard Size'] == '1')
  category = book['Category']
  publisher = book['Publisher']
  author = book['Author']
  language = book['Language']
  adult = (book['18+'] == '1')
  stock = book['Copies Owned'].to_i
  notes = book['Notes']
  created_at = Chronic.parse(book['Date Aq'])

  puts '-----------'
  puts "[#{code}] #{title}, #{volume}"

  Book.create(
    title: title,
    code: code,
    notes: notes,
    volume: volume,
    created_at: created_at,
    adult: adult,
    stock: stock,
    subtitle: subtitle,
    oversized: oversized,
    non_standard_size: non_standard_size,
    category: category,
    publisher: publisher,
    author: author,
    language: language
    )
end