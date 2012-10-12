function(event) {
  record = {time: event.time};
  record[event.field] = event.value;
  emit(event.record, record);
}
