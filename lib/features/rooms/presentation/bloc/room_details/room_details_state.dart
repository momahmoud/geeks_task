part of 'room_details_bloc.dart';

abstract class RoomDetailsState extends Equatable {
  const RoomDetailsState();

  @override
  List<Object> get props => [];
}

class RoomDetailsInitial extends RoomDetailsState {}

class ErrorRoomDetailsState extends RoomDetailsState {
  final String message;

  const ErrorRoomDetailsState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingRoomDetailsState extends RoomDetailsState {}

class LoadedRoomDetailsState extends RoomDetailsState {
  final RoomDetails roomDetails;

  const LoadedRoomDetailsState({required this.roomDetails});
  @override
  List<Object> get props => [roomDetails];
}
