Library.BooksController = Ember.ArrayController.extend

  needs: 'booksIndex'
  filterNameBinding: 'controllers.booksIndex.filterName'

  filteredModel: (->
    console.log @get('filterName')

    result = @get('model').filter (item, index, enumerable)=>
      title = item.get('title').toLowerCase()

      return true if (title.indexOf(@get('filterName').toLowerCase()) >= 0)

    result = result.sort (a, b)->
      titleA = a.get('title').toLowerCase()
      titleB = b.get('title').toLowerCase()

      return -1 if titleA < titleB
      return  1 if titleA > titleB
      return 0
  ).property('model.isLoaded', 'filterName')

Library.BooksIndexController = Ember.Controller.extend
  filterName: ''

Library.BooksBookController = Ember.ObjectController.extend
  delete: ->
    @get('content').deleteRecord()
    @transitionToRoute('books')

  edit: ->
    @set 'isEditing', true

  saveEdit: ->
    @get('content').save().then(
      (val)=>
        @transitionToRoute('books.book', @get('content'))
        @set 'isEditing', false
      (err)=> @set 'errors', err
    )

  cancelEdit: ->
    @set 'isEditing', false
    @get('content').reload()

  resetErrors: (->
    @set 'errors', null
  ).observes('isEditing')

Library.BooksNewController = Ember.ObjectController.extend
  save: ->
    @get('model').save().then(
      (val)=> @transitionToRoute('books.book', @get('model'))
      (err)=> @set 'errors', err
    )
