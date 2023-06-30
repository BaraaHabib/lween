

enum LocalDataType{
  Value,
  List
}

enum LocalDataRequestType{
  Set,
  Get,
  Delete
}

class LocalDataParams<T> {
  LocalDataType dataType;
  LocalDataRequestType localDataRequestType ;
  String key;


  Type get type => T;

  LocalDataParams({this.dataType =LocalDataType.Value ,required this.key,this.localDataRequestType =  LocalDataRequestType.Get });

}