Library.SettingssController = Ember.Controller.extend()

Library.SettingsEventsController = Ember.ArrayController.extend
  sortProperties: ['start']
  sortAscending: false

  actions:
    new: ->
      @get('model').pushObject Library.Event.create
        name: 'New Event'
        location: 'Location'
        isNew: true
        start: moment()
        finish: moment().add('days', 1)