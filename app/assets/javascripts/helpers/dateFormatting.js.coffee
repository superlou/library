Em.Handlebars.registerBoundHelper 'timeAgo', (value) ->
  if value
    moment(value).fromNow()
  else
    'unknown'

Em.Handlebars.registerBoundHelper 'shortDateTime', (value) ->
  if value
    moment(value).format('lll')
  else
    'unknown'

Em.Handlebars.registerBoundHelper 'humanizeDuration', (value) ->
  if value
    value.humanize()
  else
    'unknown'
