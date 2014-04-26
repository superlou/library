export default Ember.Route.extend({
	model: function(params) {
		return this.get('store').createRecord('book', {title: 'New Book'});
	}
});