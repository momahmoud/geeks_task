import 'package:geeks_task/features/rooms/domain/entities/room_features.dart';

class RoomFeaturesModel extends RoomFeatures {
  const RoomFeaturesModel({
    required super.id,
    required super.description,
    required super.image,
    required super.isActive,
  });

  factory RoomFeaturesModel.fromJson(Map<String, dynamic> json) {
    return RoomFeaturesModel(
      id: json['id'],
      description: json['description'],
      image: json['image'],
      isActive: json['is_active'],
    );
  }
}
