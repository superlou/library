export default Ember.Route.extend({
	setupController: function (controller) {
		this.get('store').find('checkout', {status: 'out'});
		controller.set('model', this.get('store').filter('checkout', function(item) {
			return item.get('isOpen');
		}));
	}
});