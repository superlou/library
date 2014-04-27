export default Ember.ArrayController.extend({
  sortProperties: ['start'],
  sortAscending: false,

  actions: {
    new: function() {
      var newEvent = this.get('store').createRecord('event', {
        name: 'New Event',
        location: 'Location',
        start: moment(),
        finish: moment().add('days', 1),
        isEditing: true
      });
    }
  }
});