import 'package:equatable/equatable.dart';

class RoomFeatures extends Equatable {
  final int id;
  final String description;
  final String image;
  final bool isActive;

  const RoomFeatures({
    required this.id,
    required this.description,
    required this.image,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        image,
        isActive,
        description,
      ];
}
