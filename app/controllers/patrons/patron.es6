export default Ember.ObjectController.extend({
	actions: {
		delete: function() {
			this.get('model').deleteRecord();
			this.transitionToRoute('patrons');
		}
	}
});