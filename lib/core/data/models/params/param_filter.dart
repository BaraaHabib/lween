


class ParamFilter{
  List<ParamFilterElement>? filters;

  ParamFilter({this.filters});

  Map<String,String> get toQuery {
    Map<String,String> map = Map<String,String>();
    filters?.forEach((element) {
      map.putIfAbsent("filters[${element.key}]", () => element.value.toString());
    });
    return map;
  }
}

class ParamFilterElement{
  String key;
  dynamic value;

  ParamFilterElement(this.key, this.value);
}