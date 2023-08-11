
import 'package:intl/intl.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/extended/extensions.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/generated/l10n.dart';

class NotificationsEntity extends ContentModel{

  late final List<NotificationEntity>? notification;

  NotificationsEntity([this.notification = const []]);

  @override
  fromJson(json) => NotificationsEntity.fromJson(json);

  NotificationsEntity.fromJson(json) {
    notification = List.from(json).map((e) => NotificationEntity.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => notification ?? [];
}

class NotificationEntity extends ContentModel {
  String? id;
  String? title;
  String? description;
  bool? isViewed;
  String? imageUrl;
  int? eventType;
  Map? data;
  String? date;

  String get formattedTime => date ?? '';

  DateTime get dateTimeDate => DateTime.tryParse(date ?? '')?.toLocal() ?? DateTime.now();




  NotificationEntity(
      {
        this.id,
        this.title,
        this.description,
        this.isViewed,
        this.imageUrl,
        this.eventType,
        this.data,
        this.date,
      });

  factory NotificationEntity.fromJson(json) {
    return NotificationEntity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isViewed: json['isViewed'],
      imageUrl: json['imageUrl'],
      eventType: json['eventType'],
      data: json['data'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['isViewed'] = isViewed;
    data['imageUrl'] = imageUrl;
    data['eventType'] = eventType;
    data['data'] = this.data;
    data['date'] = date;
    return data;
  }

  @override
  fromJson(json) {
    return NotificationEntity.fromJson(json,);
  }

  @override
  List<Object?> get props => [title,description,isViewed,imageUrl,eventType,data,date,];
}


