export default Ember.Route.extend({
	setupController: function(controller, context, queryParams) {
		controller.set('model', this.get('store').createRecord('checkout', {}))
		controller.set('book_code', queryParams.bookCode)
		controller.set('patron_code', '')
	}
});