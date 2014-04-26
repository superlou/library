export default Ember.ObjectController.extend({
	actions: {
		save: function () {
			var _this = this;
			this.get('model').save().then(
				function(val) {
					_this.transitionToRoute('books.book', _this.get('model'));
				},
				function(err) {}
			);
		},

		cancel: function() {
			this.transitionToRoute('books');
		}
	}
});