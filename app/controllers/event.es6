export default Ember.ObjectController.extend({
  needs: 'settings/events',
  events: Ember.computed.alias('controllers.settingsEvents'),

  isEditing: function() {
    return this.get('isNew');
  }.property('isNew'),

  isExisting: function() {
    return  !this.get('isNew');
  }.property('isNew'),

  actions: {
    edit: function() {
      this.set('isEditing', true);
    },

    cancel: function() {
      if (this.get('isNew')) {
        this.get('events').removeObject(this.get('model'));
      } else {
        this.get('model').reload();
      }

      this.set('isEditing', false);
    },

    save: function() {
      var _this = this;
      this.get('model').save().then(function() {
        _this.set('isEditing', false);
        _this.get('events.model').reload();
      }, function(err) {})
    },

    delete: function() {
      this.get('model').deleteRecord();
    }
  }
});