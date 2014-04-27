export default Ember.Component.extend({
  inputValue: function() {
    return moment(this.get('start')).format('MM/DD/YYYY') + " - " + moment(this.get('finish')).format('MM/DD/YYYY')
  }.property('start', 'finish'),

  didInsertElement: function() {
    var _this = this;

    $('.date-range-picker').daterangepicker({
      startDate: this.get('start'),
      endDate: this.get('finish'),
      format: 'MM/DD/YYYY'
    }, function (start, finish) {
      _this.set('start', start);
      _this.set('finish', finish);
    });
  }
});