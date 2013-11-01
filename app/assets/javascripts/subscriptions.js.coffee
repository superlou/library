Ember.Application.initializer
  name: 'fayeSubscriptions'
  after: 'store'

  initialize: (container, application)->
    client = new Faye.Client('http://' + window.location.hostname + ':9292/faye')
    store = container.lookup('store:main')

    # Books
    client.subscribe '/books/new', (data)->
      store.find('book', data.id)

    client.subscribe '/books/update', (data)->
      store.find('book', data.id).then (book)->
        book.reload()

    client.subscribe '/books/delete', (data)->
      store.find('book', data.id).then (book)->
        book.deleteRecord()

    # Patrons
    client.subscribe '/patrons/new', (data)->
      store.find('patron', data.id)

    client.subscribe '/patrons/update', (data)->
      store.find('patron', data.id).then (patron)->
        patron.reload()

    client.subscribe '/patrons/delete', (data)->
      store.find('patron', data.id).then (patron)->
        patron.deleteRecord()

    # Checkouts
    client.subscribe '/checkouts/new', (data)->
      store.find('checkout', data.id)

    client.subscribe '/checkouts/update', (data)->
      store.find('checkout', data.id).then (checkout)->
        checkout.reload()

    client.subscribe '/checkouts/delete', (data)->
      store.find('checkout', data.id).then (checkout)->
        checkout.deleteRecord()