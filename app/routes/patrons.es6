export default Ember.Route.extend({
	setupController: function(controller) {
		controller.set('model', this.get('store').findAll('patron'));
	}
});