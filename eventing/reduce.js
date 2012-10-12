function(keys, records) {
  var timeline = records.sort(function(eventA, eventB) {
    return eventA.time - eventB.time;
  });

  return timeline.reduce(function(earlier, later) {
    for (var field in later) { earlier[field] = later[field]; }
    return earlier;
  });
}
