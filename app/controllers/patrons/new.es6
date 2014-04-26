export default Ember.ObjectController.extend({
	actions: {
		save: function() {
			var _this = this;
			this.get('model').save().then(function(val) {
				_this.transitionToRoute('patrons.patron', _this.get('model'));
			}, function(err) {});
		}
	},

	genders: function() {
		return ['', 'male', 'female', 'other'];
	}.property()
});