Library.PatronsController = Ember.ArrayController.extend
  filterQuery: ''

  filteredModel: (->
    @get('model').filter (item, index, enumerable)=>
      return false unless item.get('isLoaded')
      item.match_filter(@get('filterQuery'))

  ).property('model.isLoaded', 'filterQuery')

Library.PatronsNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @get('model').save().then(
        (val)=> @transitionToRoute('patrons.patron', @get('model'))
        (err)=> @set 'errors', err
      )

  genders: (->
      ['', 'male', 'female', 'other']
  ).property()

Library.PatronsPatronController = Ember.ObjectController.extend
  actions:
    delete: ->
      @get('content').deleteRecord()
      @transitionToRoute('patrons')

  resetErrors: (->
      @set 'errors', null
    ).observes('isEditing')

Library.PatronsEditController = Ember.ObjectController.extend
  actions:
    edit: ->
      @set 'isEditing', true

    saveEdit: ->
      @get('content').save().then(
        (val)=>
          @transitionToRoute('patrons.patron', @get('content'))
        (err)=> @set 'errors', err
      )

    cancelEdit: ->
      @get('content').reload()
      @transitionToRoute('patrons.patron', @get('content'))

  genders: (->
    ['', 'male', 'female', 'other']
  ).property()