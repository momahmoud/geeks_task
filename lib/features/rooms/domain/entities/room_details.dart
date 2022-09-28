import 'package:equatable/equatable.dart';
import 'package:geeks_task/features/rooms/domain/entities/room_features.dart';

class RoomDetails extends Equatable {
  final int id;
  final String title;
  final String description;
  final String featuredImage;
  final String address;
  final double rating;
  final List<RoomFeatures> features;
  final String date;

  const RoomDetails({
    required this.id,
    required this.title,
    required this.description,
    required this.featuredImage,
    required this.address,
    required this.rating,
    required this.features,
    required this.date,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        featuredImage,
        address,
        rating,
        featuredImage,
        date
      ];
}
