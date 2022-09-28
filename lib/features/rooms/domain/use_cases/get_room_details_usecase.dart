import 'package:dartz/dartz.dart';
import 'package:geeks_task/core/errors/failures.dart';
import 'package:geeks_task/features/rooms/domain/entities/room_details.dart';
import 'package:geeks_task/features/rooms/domain/repositories/room_repo.dart';

class GetRoomDetailsUseCase {
  final RoomRepo roomRepo;

  GetRoomDetailsUseCase(this.roomRepo);

  Future<Either<Failure, RoomDetails>> call(int id) async {
    return await roomRepo.getRoomDetails(id);
  }
}
