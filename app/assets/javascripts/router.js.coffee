# For more information see: http://emberjs.com/guides/routing/

Library.Router.map ()->

  @route 'books.search', {path: '/books/search'}

  @resource 'books', ->
    @route 'new'
    @resource 'books.book', {path: ':book_id'}

  @resource 'patrons', ->
    @resource 'patrons.patron', {path: ':patron_id'}
    @route 'new'

  @resource 'checkouts', ->
    @resource 'checkouts.checkout', {path: ':checkout_id'}
    @route 'new'

  @route 'checkout'
  @route 'checkin'

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

Library.CheckoutsRoute = Ember.Route.extend
  model: (params)->
    Library.Checkout.findAll()

Library.CheckoutsNewRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set('book_code', '')
    controller.set('patron_code', '')
    controller.set('model', Library.Checkout.create())

Library.CheckoutRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set('book_code', '')
    controller.set('patron_code', '')
    controller.set('model', Library.Checkout.create())

Library.CheckinRoute = Ember.Route.extend
  model: (params)->
    Library.Checkout.find({status: 'out'})