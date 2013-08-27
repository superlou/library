# For more information see: http://emberjs.com/guides/routing/

client = new Faye.Client('http://" + window.location.host + ":9292/faye')

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
  setupController: (controller)->
    controller.set 'model', Library.Book.findAll()

    client.subscribe '/books/new', (data)->
      model = controller.get('model').reload()

    client.subscribe '/books/update', (data)->
      model = controller.get('model').reload()

    client.subscribe '/books/delete', (data)->
      model = controller.get('model').reload()

Library.BooksNewRoute = Ember.Route.extend
  model: (params)->
    Library.Book.create()

Library.PatronsRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set 'model', Library.Patron.findAll()

    client.subscribe '/patrons/new', (data)->
      model = controller.get('model').reload()

    client.subscribe '/patrons/update', (data)->
      model = controller.get('model').reload()

    client.subscribe '/patrons/delete', (data)->
      model = controller.get('model').reload()

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
  setupController: (controller)->
    controller.set 'model', Library.Checkout.find({status: 'out'})

    client.subscribe '/checkouts/update', (data)->
      controller.set 'model', Library.Checkout.find({status: 'out'})