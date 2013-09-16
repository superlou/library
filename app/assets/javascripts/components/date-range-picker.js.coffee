Library.DateRangePickerComponent = Ember.Component.extend
  inputValue: (->
    moment(@get('start')).format('MM/DD/YYYY') + " - " + moment(@get('finish')).format('MM/DD/YYYY')
  ).property('start', 'finish')

  didInsertElement: ->
    $('.date-range-picker').daterangepicker(
      startDate: @get('start')
      endDate: @get('finish')
      format: 'MM/DD/YYYY'
    ,
      (start, finish) =>
        @set 'start', start
        @set 'finish', finish
    )
