# For more information see: http://emberjs.com/guides/routing/

Library.Router.map ()->
  @resource 'books', ->
    @resource 'books.book', {path: ':book_id'}

Library.BooksRoute = Ember.Route.extend
  model: (params) ->
    Library.Book.findAll()