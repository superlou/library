Library.BooksController = Ember.ArrayController.extend
  filterQuery: ''

  filteredModel: (->
    result = @get('model').filter (item, index, enumerable)=>
      full_title = item.get('full_title').toLowerCase()


      if full_title.indexOf(@get('filterQuery').toLowerCase()) < 0
        return false

      true
  ).property('model.isLoaded', 'filterQuery')

Library.BooksIndexController = Ember.Controller.extend()

Library.BooksSearchController = Ember.Controller.extend
  search: ->
    # this is waiting on QueryParams implementation
    @transitionToRoute('books', {test: 'here'})

Library.BooksBookController = Ember.ObjectController.extend
  actions:
    delete: ->
      @get('content').deleteRecord()
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
        (err)=> @set 'errors', err
      )

    cancel: ->
      @get('content').reload()
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