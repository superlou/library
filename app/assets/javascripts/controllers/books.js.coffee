Library.BooksController = Ember.ArrayController.extend
  filterQuery: ''

  filteredModel: (->
    @get('model').filter (item, index, enumerable)=>
      return false unless item.get('isLoaded')
      item.match_filter(@get('filterQuery'))

  ).property('model.@each', 'filterQuery')

Library.BooksIndexController = Ember.Controller.extend
  needs: 'books'
  books: Ember.computed.alias("controllers.books")

  creationHistory: (->

    counts = {}
    @get('books').forEach (book)->
      counts[book.get('created_at')] = 1 + (counts[book.get('created_at')] || 0)

    countArray = []

    for k, v of counts
      item = [k, v]
      countArray.push(item)

    countArray
  ).property('books', 'books.@each.isDone')

Library.BooksSearchController = Ember.Controller.extend
  search: ->
    # this is waiting on QueryParams implementation
    @transitionToRoute('books', {test: 'here'})

Library.BooksBookController = Ember.ObjectController.extend
  actions:
    delete: ->
      @get('content').deleteRecord()
      @get('content').save()
      @transitionToRoute('books')

  resetErrors: (->
    @set 'errors', null
  ).observes('isEditing')

Library.BooksEditController = Ember.ObjectController.extend
  actions:
    save: ->
      @get('content').save().then(
        (val)=>
          @transitionToRoute('books.book', @get('content'))
        (err)=>
          @set 'errors', err
      )

    cancel: ->
      @get('content').rollback()
      @transitionToRoute('books.book', @get('content'))

Library.BooksCloneVolumeController = Ember.ObjectController.extend
  actions:
    save: ->
      @get('content').save().then(
        (val)=>
          @transitionToRoute('books.book', @get('content'))
        (err)=> @set 'errors', err
      )

    cancel: ->
      @transitionToRoute('books.book', @get('basis_model'))

Library.BooksNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @get('model').save().then(
        (val)=> @transitionToRoute('books.book', @get('model'))
        (err)=> @set 'errors', err
      )

    cancel: ->
      @transitionToRoute('books')