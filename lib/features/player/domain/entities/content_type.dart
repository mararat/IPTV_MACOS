enum ContentType {
  live,
  vod,
  series;

  String toApiValue() => name;
}
