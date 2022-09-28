import 'package:dio/dio.dart';

import 'package:geeks_task/features/rooms/data/models/room_details_model.dart';

import '../../../../core/errors/exceptions.dart';

abstract class RoomRemoteDataSource {
  Future<RoomDetailsModel> getRoomDetails(int id);
}

class RoomRemoteDataSourceImpl implements RoomRemoteDataSource {
  final Dio dio;

  RoomRemoteDataSourceImpl({required this.dio});

  @override
  Future<RoomDetailsModel> getRoomDetails(int id) async {
    final response =
        await dio.get('http://privatestays.jyif.org/api/properties/$id');

    if (response.statusCode == 200) {
      print(response);
      return RoomDetailsModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
