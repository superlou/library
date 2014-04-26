export default Ember.ObjectController.extend({
	actions: {
		saveEdit: function() {
			var _this = this;
			this.get('content').save().then(function(val) {
				_this.transitionToRoute('patrons.patron', _this.get('model'));
			}, function(err) {});
		},

		cancelEdit: function() {
			this.get('content').reload();
			this.transitionToRoute('patrons.patron', this.get('content'));
		}
	},

	genders: function() {
		return ['', 'male', 'female', 'other']
	}.property()
});
