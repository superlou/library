export default Ember.Route.extend({
	model: function() {
		if (!this.controllerFor('checkout').get('model')) {
			return this.get('store').createRecord('checkout', {});
		}
	},

	setupController: function(controller, model) {
		this._super(controller, model);
		controller.set_model_book();
		controller.set_model_patron();
	}
});