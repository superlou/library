# For more information see: http://emberjs.com/guides/routing/

Library.Router.map ()->
  @resource 'books', ->
    @resource 'books.book', {path: ':book_id'}
    @route 'new'

  @resource 'patrons', ->
    @resource 'patrons.patron', {path: ':patron_id'}, ->
    @route 'new'

Library.BooksRoute = Ember.Route.extend
  model: (params)->
    Library.Book.findAll()

Library.BooksNewRoute = Ember.Route.extend
  model: (params)->
    Library.Book.create()

Library.PatronsRoute = Ember.Route.extend
  model: (params)->
    Library.Patron.findAll()

Library.PatronsNewRoute = Ember.Route.extend
  model: (params)->
    Library.Patron.create()