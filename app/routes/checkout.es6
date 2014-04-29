export default Ember.Route.extend({
	model: function() {
		return this.get('store').createRecord('checkout', {});
	},

	setupController: function(controller, model) {
		this._super(controller, model);
		controller.set_model_book();
		controller.set_model_patron();
	}
});