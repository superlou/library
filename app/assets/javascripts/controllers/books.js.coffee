Library.BooksController = Ember.ArrayController.extend

  needs: 'booksIndex'
  filterNameBinding: 'controllers.booksIndex.filterName'
  filterVolumeBinding: 'controllers.booksIndex.filterVolume'

  filteredModel: (->
    result = @get('model').filter (item, index, enumerable)=>
      title = item.get('title').toLowerCase()

      if title.indexOf(@get('filterName').toLowerCase()) < 0
        return false


      filterVolume = @get('filterVolume').toLowerCase()

      if filterVolume
        if item.get('volume')
          volume = item.get('volume').toString().toLowerCase()
        else
          return false

        if volume.indexOf(filterVolume) < 0
          return false


      true
  ).property('model.isLoaded', 'filterName', 'filterVolume')

Library.BooksIndexController = Ember.Controller.extend
  filterName: ''
  filterVolume: ''

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
    saveEdit: ->
      @get('content').save().then(
        (val)=>
          @transitionToRoute('books.book', @get('content'))
        (err)=> @set 'errors', err
      )

    cancelEdit: ->
      @get('content').reload()
      @transitionToRoute('books.book', @get('content'))

Library.BooksNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @get('model').save().then(
        (val)=> @transitionToRoute('books.book', @get('model'))
        (err)=> @set 'errors', err
      )
