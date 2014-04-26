export default Ember.Route.extend({
	model: function(params) {
		return this.get('store').createRecord('patron', {
			name: 'New Patron',
			keepCheckoutHistory: true
		});
	}
});