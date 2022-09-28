part of 'room_details_bloc.dart';

abstract class RoomDetailsEvent extends Equatable {
  const RoomDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetRoomDetailsEvent extends RoomDetailsEvent {
  final int id;

  const GetRoomDetailsEvent({required this.id});

  @override
  List<Object> get props => [id];
}
