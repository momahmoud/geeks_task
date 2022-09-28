import 'package:geeks_task/features/rooms/data/models/room_features_model.dart';
import 'package:geeks_task/features/rooms/domain/entities/room_details.dart';

class RoomDetailsModel extends RoomDetails {
  const RoomDetailsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.featuredImage,
    required super.address,
    required super.rating,
    required super.features,
    required super.date,
  });

  factory RoomDetailsModel.fromJson(Map<String, dynamic> json) {
    return RoomDetailsModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        featuredImage: json['featured_image'],
        address: json['address'],
        rating: json['rating'].toDouble(),
        features: List<RoomFeaturesModel>.from(json['features'][0]
            .map((feature) => RoomFeaturesModel.fromJson(feature))),
        date: json['date']);
  }
}
