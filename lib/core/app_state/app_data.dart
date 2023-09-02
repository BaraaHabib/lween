part of 'appstate.dart';

mixin AppData implements AppStateComponent {
  InitAppEntity? _initAppEntity;
  set initAppEntity(InitAppEntity initAppEntity){
    _initAppEntity = initAppEntity;
  }
  InitAppEntity get initAppEntity => _initAppEntity!;

  ProfileEntity get profile => Lween.storage.profile!;


  List<Country> get countries => initAppEntity.countries ?? [];
  List<City> cities([int? countryId]) {
    countryId ??= _initAppEntity?.countries?.firstOrNull?.id;
    return initAppEntity.countries
      ?.firstWhereOrNull((c) => c.id == countryId)?.cities ?? [];
  }

}