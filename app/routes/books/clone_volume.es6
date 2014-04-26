export default Ember.Route.extend({
	setupController: function(controller, model) {
		var basis_model = model;
		var basis_id = model.get('id');

		var _this = this;
		this.get('store').find('book', basis_id).then(function(item) {
			var cloned_book_params = App.Book.cloneVolumeFrom(item);
			var cloned_book = _this.get('store').createRecord('book', cloned_book_params);
			controller.set('model', cloned_book);
			controller.set('basis_model', basis_model);
		});
	}
});