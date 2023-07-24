import 'package:lween/core/features/entities/entity.dart';

class HomeEntity extends ContentModel {
  HomeEntity({
    required this.advertisements,
    required this.topCompanies,
  });
  late final List<AdvertisementEntity> advertisements;
  late final List<LiteCompany> topCompanies;

  HomeEntity.fromJson(json){
    advertisements = List.from(json['advertisements']).map((e)=>AdvertisementEntity.fromJson(e)).toList();
    topCompanies = List.from(json['topTransportationEntities']).map((e)=>LiteCompany.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['advertisements'] = advertisements.map((e)=>e.toJson()).toList();
    data['topTransportationEntities'] = topCompanies.map((e)=>e.toJson()).toList();
    return data;
  }

  @override
  fromJson(json) => HomeEntity.fromJson(json);

  @override
  List<Object?> get props => [...advertisements,...topCompanies,];
}

class AdvertisementEntity extends ContentModel {
  AdvertisementEntity({
    required this.isDeleted,
    required this.creationTime,
    required this.deletionTime,
    required this.lastModificationTime,
    required this.creatorUserId,
    required this.deleterUserId,
    required this.lastModifierUserId,
    required this.deleter,
    required this.creator,
    required this.isActive,
    required this.id,
    required this.arTitle,
    required this.enTitle,
    required this.type,
    required this.imageUrl,
    required this.attachmentUrl,
    required this.linkText,
    required this.url,
    required this.waitTimeInSeconds,
    required this.locations,
    required this.showFromHour,
    required this.showToHour,
  });
  late final bool? isDeleted;
  late final String? creationTime;
  late final String? deletionTime;
  late final String? lastModificationTime;
  late final int? creatorUserId;
  late final int? deleterUserId;
  late final int? lastModifierUserId;
  late final String? deleter;
  late final String? creator;
  late final bool? isActive;
  late final String id;
  late final String? arTitle;
  late final String? enTitle;


  bool get isImage => AdvertisementType.image.apiValue == type;
  bool get isVideo => AdvertisementType.video.apiValue == type;

  late final int? type;

  late final String? imageUrl;
  late final String? attachmentUrl;
  late final String? linkText;
  late final String? url;
  late final int? waitTimeInSeconds;
  late final List<int>? locations;
  late final int? showFromHour;
  late final int? showToHour;

  AdvertisementEntity.fromJson(Map<String, dynamic> json){
    isDeleted = json['isDeleted'];
    creationTime = json['creationTime'];
    deletionTime = json['deletionTime'];
    lastModificationTime = json['lastModificationTime'];
    creatorUserId = json['creatorUserId'];
    deleterUserId = json['deleterUserId'];
    lastModifierUserId = json['lastModifierUserId'];
    deleter = json['deleter'];
    creator = json['creator'];
    isActive = json['isActive'];
    id = json['id'];
    arTitle = json['arTitle'];
    enTitle = json['enTitle'];
    type = json['type'];
    imageUrl = json['imageUrl'];
    attachmentUrl = json['attachmentUrl'];
    linkText = json['linkText'];
    url = json['url'];
    waitTimeInSeconds = json['waitTimeInSeconds'];
    locations = List.castFrom<dynamic, int>(json['locations']);
    showFromHour = json['showFromHour'];
    showToHour = json['showToHour'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isDeleted'] = isDeleted;
    data['creationTime'] = creationTime;
    data['deletionTime'] = deletionTime;
    data['lastModificationTime'] = lastModificationTime;
    data['creatorUserId'] = creatorUserId;
    data['deleterUserId'] = deleterUserId;
    data['lastModifierUserId'] = lastModifierUserId;
    data['deleter'] = deleter;
    data['creator'] = creator;
    data['isActive'] = isActive;
    data['id'] = id;
    data['arTitle'] = arTitle;
    data['enTitle'] = enTitle;
    data['type'] = type;
    data['imageUrl'] = imageUrl;
    data['attachmentUrl'] = attachmentUrl;
    data['linkText'] = linkText;
    data['url'] = url;
    data['waitTimeInSeconds'] = waitTimeInSeconds;
    data['locations'] = locations;
    data['showFromHour'] = showFromHour;
    data['showToHour'] = showToHour;
    return data;
  }

  @override
  fromJson(json) => AdvertisementEntity.fromJson(json);

  @override
  List<Object?> get props => [id,];
}

class LiteCompany extends ContentModel{
  LiteCompany({
    required this.id,
    required this.text,
    required this.imageUrl,
  });
  late final int id;
  late final String text;
  late final String imageUrl;

  LiteCompany.fromJson(Map<String, dynamic> json){
    id = json['id'];
    text = json['text'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['imageUrl'] = imageUrl;
    return data;
  }

  @override
  fromJson(json) => LiteCompany.fromJson(json);

  @override
  List<Object?> get props =>  [id,];
}

enum AdvertisementType{
  image(1),
  video(2);
  const AdvertisementType(this.apiValue);
  final int apiValue;
}