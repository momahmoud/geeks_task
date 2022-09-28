import 'package:dartz/dartz.dart';
import 'package:geeks_task/core/errors/failures.dart';
import 'package:geeks_task/features/rooms/domain/entities/room_details.dart';

abstract class RoomRepo {
  Future<Either<Failure, RoomDetails>> getRoomDetails(int id);
}
