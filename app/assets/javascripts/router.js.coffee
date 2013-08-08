# For more information see: http://emberjs.com/guides/routing/

Library.Router.map ()->
  @resource 'books', ->
    @resource 'books.book', {path: ':book_id'}
    @route 'new'

Library.BooksRoute = Ember.Route.extend
  model: (params) ->
    Library.Book.findAll()

Library.BooksNewRoute = Ember.Route.extend
  model: (params) ->
    Library.Book.create()