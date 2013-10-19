attr = DS.attr

Library.Event = DS.Model.extend
  name: attr()
  location: attr()
  start: attr('date')
  finish: attr('date')