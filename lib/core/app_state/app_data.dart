part of 'appstate.dart';

mixin AppData implements AppStateComponent {
  InitAppEntity? _initAppEntity;
  set initAppEntity(InitAppEntity initAppEntity){
    _initAppEntity = initAppEntity;
  }
  InitAppEntity get initAppEntity => _initAppEntity!;


  List<Country> get countries => initAppEntity.countries ?? [];
  List<City> cities(int? countryId) => initAppEntity.countries
      ?.firstWhereOrNull((c) => c.id == countryId)?.cities ?? [];

}