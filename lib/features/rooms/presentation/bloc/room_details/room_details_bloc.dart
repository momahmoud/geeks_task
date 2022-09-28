import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:geeks_task/features/rooms/domain/entities/room_details.dart';
import 'package:geeks_task/features/rooms/domain/use_cases/get_room_details_usecase.dart';

import '../../../../../core/app_strings/failures_message.dart';
import '../../../../../core/errors/failures.dart';

part 'room_details_event.dart';
part 'room_details_state.dart';

class RoomDetailsBloc extends Bloc<RoomDetailsEvent, RoomDetailsState> {
  final GetRoomDetailsUseCase getRoomDetails;
  RoomDetailsBloc({required this.getRoomDetails})
      : super(RoomDetailsInitial()) {
    on<RoomDetailsEvent>((event, emit) async {
      if (event is GetRoomDetailsEvent) {
        emit(LoadingRoomDetailsState());
        final failureOrRoomDetails = await getRoomDetails(event.id);
        emit(_mapFailureOrRoomDetailsToState(failureOrRoomDetails));
      }
    });
  }

  RoomDetailsState _mapFailureOrRoomDetailsToState(
      Either<Failure, RoomDetails> failureOrRoomDetails) {
    return failureOrRoomDetails.fold(
      (failure) =>
          ErrorRoomDetailsState(message: _mapFailureToMessage(failure)),
      (roomDetails) => LoadedRoomDetailsState(roomDetails: roomDetails),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;

      default:
        return "Unexpected Error, Please try again later.";
    }
  }
}
