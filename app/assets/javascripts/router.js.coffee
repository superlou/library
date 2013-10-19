# For more information see: http://emberjs.com/guides/routing/

client = new Faye.Client('http://' + window.location.hostname + ':9292/faye')

Library.Router.map ()->

  @route 'books.search', {path: '/books/search'}

  @resource 'books', ->
    @route 'new'
    @resource 'books.book', {path: ':book_id'}
    @route 'edit', {path: ':book_id/edit'}
    @route 'clone_volume', {path: ':book_id/clone_volume'}

  @resource 'patrons', ->
    @route 'new'
    @resource 'patrons.patron', {path: ':patron_id'}
    @route 'edit', {path: ':patron_id/edit'}

  @resource 'checkouts', ->
    @resource 'checkouts.checkout', {path: ':checkout_id'}
    @route 'new'

  @route 'checkout', {queryParams: ['bookCode']}
  @route 'checkin'

  @resource 'settings', ->
    @route 'general'
    @route 'events'


Library.BooksRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set 'model', @get('store').findAll('book')

    client.subscribe '/books/new', (data)->
      model = controller.get('model').reload()

    client.subscribe '/books/update', (data)->
      model = controller.get('model').reload()

    client.subscribe '/books/delete', (data)->
      model = controller.get('model').reload()

Library.BooksBookRoute = Ember.Route.extend
  model: (params)->
    @get('store').find('book', params.book_id)

Library.BooksNewRoute = Ember.Route.extend
  model: (params)->
    @get('store').createRecord('book', {title: 'New Book'})

Library.BooksCloneVolumeRoute = Ember.Route.extend
  setupController: (controller, model)->
    basis_model = model
    basis_id = model.get('id')

    @get('store').find('book', basis_id).then (item)=>
      cloned_book_params = Library.Book.cloneVolumeFrom(item)
      cloned_book = @get('store').createRecord('book', cloned_book_params)
      controller.set('model', cloned_book)
      controller.set('basis_model', basis_model)

Library.PatronsRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set 'model', @get('store').findAll('patron')

    client.subscribe '/patrons/new', (data)->
      model = controller.get('model').reload()

    client.subscribe '/patrons/update', (data)->
      model = controller.get('model').reload()

    client.subscribe '/patrons/delete', (data)->
      model = controller.get('model').reload()

Library.PatronsNewRoute = Ember.Route.extend
  model: (params)->
    @get('store').createRecord 'patron',
      { keepCheckoutHistory: true }


Library.CheckoutsRoute = Ember.Route.extend
  model: (params)->
    @get('store').findAll('checkout')

Library.CheckoutsNewRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set('book_code', '')
    controller.set('patron_code', '')
    controller.set('model', @get('store').createRecord('checkout', {}))

Library.CheckoutRoute = Ember.Route.extend
  setupController: (controller, context, queryParams)->
    controller.set('model', @get('store').createRecord('checkout', {}))
    controller.set('book_code', queryParams.bookCode)
    controller.set('patron_code', '')

Library.CheckinRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set 'model', @get('store').find('checkout', {status: 'out'})

    client.subscribe '/checkouts/update', (data)->
      controller.set 'model', @get('store').find('checkout', {status: 'out'})

Library.SettingsEventsRoute = Ember.Route.extend
  model: (params)->
    @get('store').findAll('event')