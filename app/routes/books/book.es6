export default Ember.Route.extend({
	actions: {
		checkout: function(current_book) {
			var book_code = current_book.get('code');

			this.controllerFor('checkout').set('model', this.get('store').createRecord('checkout', {}))
			this.controllerFor('checkout').set('book_code', book_code);
			this.controllerFor('checkout').set('patron_code', '')
			
			this.transitionTo('checkout');
		}
	}
});