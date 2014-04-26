export default Ember.ObjectController.extend({
  actions: {
    delete: function() {
      this.get('content').deleteRecord();
      this.get('content').save();
      this.transitionToRoute('books');
  	}
  }
});