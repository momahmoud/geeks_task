import 'package:dio/dio.dart';
import 'package:geeks_task/features/rooms/data/data_sources/room_remote_data_source.dart';
import 'package:geeks_task/features/rooms/data/repositories_impl/room_repo_impl.dart';
import 'package:geeks_task/features/rooms/domain/repositories/room_repo.dart';
import 'package:geeks_task/features/rooms/domain/use_cases/get_room_details_usecase.dart';
import 'package:geeks_task/features/rooms/presentation/bloc/room_details/room_details_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features => posts

  //=> Blocs
  sl.registerFactory<RoomDetailsBloc>(
      () => RoomDetailsBloc(getRoomDetails: sl()));

  //=> Usecases
  sl.registerLazySingleton<GetRoomDetailsUseCase>(
      () => GetRoomDetailsUseCase(sl()));

  //=> Repositories
  sl.registerLazySingleton<RoomRepo>(() => RoomRepoImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  //=> Data Sources
  sl.registerLazySingleton<RoomRemoteDataSource>(
      () => RoomRemoteDataSourceImpl(dio: sl()));

  //=> core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //=> External Packages

  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  sl.registerLazySingleton(() => Dio());
}
