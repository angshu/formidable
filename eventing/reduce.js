function(keys, records) {                                                       
  var timeline = records.sort(function(eventA, eventB) {
    return eventA.epoch - eventB.epoch;
  });

  var merge = function(under, over) {
    if(under == null) return over;
    if(over == null) return under;

    for (var field in over) {
      under[field] = over[field];
    }

    return under;
  }

  return timeline.reduce(function(earlier, later) {
    later.data = merge(earlier.data, later.data);
    return later;
  });
}
