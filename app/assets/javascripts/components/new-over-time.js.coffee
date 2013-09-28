Library.NewOverTimeComponent = Ember.Component.extend
  tagName: 'svg'

  didInsertElement: ->
    @drawPlot()

  dataChanged: (->
    @drawPlot()
  ).observes('countHistory')

  drawPlot: ->
    countHistory = @get('countHistory')
    sortedNewHistory = countHistory.sort(@sortDates)

    sortedTotalHistory = []
    total = 0

    for item in sortedNewHistory
      total += item[1]
      sortedTotalHistory.push([item[0], total])

    data = [
      {
        key: 'New Books'
        bar: true
        values: sortedNewHistory
        color: '#FF7A00'
      }
      {
        key: 'Total Books'
        values: sortedTotalHistory
        color:'#03899C'
      }
    ]

    svg = d3.select('#' + @get('elementId'))

    chart = nv.models.linePlusBarChart()
      .x (d, i)->
        return i
      .y (d)->
        return d[1]

    chart.xAxis
      .showMaxMin(false)
      .tickFormat (d)->
        return d3.time.format('%x')(new Date(d))

    chart.y1Axis
      .tickFormat(d3.format('d'))

    chart.y2Axis
      .tickFormat(d3.format('d'))

    chart.bars.forceY([0])

    svg.datum(data)
      .transition()
      .duration(500)
      .call(chart)

    nv.utils.windowResize(chart.update)

  sortDates: (a, b)->
    if (moment(a[0]) > moment(b[0]))
      return 1
    else if (moment(a[0]) < moment(b[0]))
      return -1
    else
      return 0