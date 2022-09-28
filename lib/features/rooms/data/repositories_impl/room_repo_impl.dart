import 'package:geeks_task/core/errors/exceptions.dart';
import 'package:geeks_task/features/rooms/data/data_sources/room_remote_data_source.dart';
import 'package:geeks_task/features/rooms/domain/entities/room_details.dart';
import 'package:geeks_task/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:geeks_task/features/rooms/domain/repositories/room_repo.dart';

import '../../../../core/network/network_info.dart';

class RoomRepoImpl implements RoomRepo {
  final RoomRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RoomRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, RoomDetails>> getRoomDetails(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final roomDetails = await remoteDataSource.getRoomDetails(id);
        return Right(roomDetails);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw OfflineFailure();
    }
  }
}
