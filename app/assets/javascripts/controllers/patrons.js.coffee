Library.PatronsController = Ember.ArrayController.extend()

Library.PatronsNewController = Ember.ObjectController.extend
  save: ->
    @get('model').save().then(
      (val)=> @transitionToRoute('patrons.patron', @get('model'))
      (err)=> @set 'errors', err
    )

Library.PatronsPatronController = Ember.ObjectController.extend
  delete: ->
    @get('content').deleteRecord()
    @transitionToRoute('patrons')

  edit: ->
    @set 'isEditing', true

  saveEdit: ->
    @get('content').save().then(
      (val)=>
        @transitionToRoute('patrons.patron', @get('content'))
        @set 'isEditing', false
      (err)=> @set 'errors', err
    )

  resetErrors: (->
    @set 'errors', null
  ).observes('isEditing')

  cancelEdit: ->
    @set 'isEditing', false
    @get('content').reload()