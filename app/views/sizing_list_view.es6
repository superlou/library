export default Ember.ListView.extend({
  didInsertElement: function() {
    this._super();

    this.$().slimScroll({
      height: 'auto',
      size: "14px",
    });

    var _this = this;
    $(window).resize(function() {
      _this.adjustSize();
    });

    Ember.run.scheduleOnce('afterRender', this, 'adjustSize');
  },

  adjustSize: function() {
    var window_height = $(window).height();
    var header_height = 150;
    var content_height = window_height - header_height;

    this.set('height', content_height);
    this.$().parent('.slimScrollDiv').height(content_height);

    Ember.run.next(this, function() {
      this.$().css('overflow','hidden');
    });
  }
});