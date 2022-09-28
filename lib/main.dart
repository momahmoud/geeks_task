import 'package:flutter/material.dart';
import 'package:geeks_task/features/rooms/presentation/pages/room_details_page.dart';
import 'core/app_theme.dart';
import 'dependency_injection_container.dart' as di;
import 'features/rooms/presentation/bloc/room_details/room_details_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) =>
          di.sl<RoomDetailsBloc>()..add(const GetRoomDetailsEvent(id: 41)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: appTheme,
        home: const RoomDetailPage(),
      ),
    );
  }
}
