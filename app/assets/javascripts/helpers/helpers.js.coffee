Em.Handlebars.registerBoundHelper 'valueOrDefault', (value, default_value) ->
  if value then value else default_value