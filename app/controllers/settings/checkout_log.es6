export default Ember.ArrayController.extend({
	// This is waiting on promise support
	columns: function() {
		var patronNameColumn = Ember.Table.ColumnDefinition.create({
			columnWidth: 150,
			textAlign: 'text-align-left',
			headerCellName: 'Patron Name',
			getCellContent: function(row) {
				return row.get('patron.code');
			}
		});

		return [patronNameColumn];
	}.property(),

	filteredModel: function() {
		return this.get('model').filter(function (item, index, enumerable) {
			if (item.get('isNew')) {
				return false;
			}

			return true;
		});
	}.property('model'),

	actions: {
		delete: function(checkout) {
			checkout.deleteRecord();
			checkout.save();
		},

		// todo If the book was lost, should ask if want to increment stock
		open: function(checkout) {
			checkout.set('closed_at', null);
			checkout.set('status', 'out');
			checkout.save();
		}
	}
});
