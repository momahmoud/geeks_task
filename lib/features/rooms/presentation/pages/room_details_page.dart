import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geeks_task/core/app_theme.dart';
import 'package:geeks_task/core/app_widgets/loading_widget.dart';
import 'package:geeks_task/features/rooms/domain/entities/room_details.dart';
import 'package:geeks_task/features/rooms/presentation/widgets/custom_button.dart';
import 'package:geeks_task/features/rooms/presentation/widgets/room_details_body_widet.dart';

import '../../../../core/app_widgets/message_display_widget.dart';
import '../bloc/room_details/room_details_bloc.dart';

class RoomDetailPage extends StatefulWidget {
  const RoomDetailPage({Key? key}) : super(key: key);

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController? scrollController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<RoomDetailsBloc, RoomDetailsState>(
          builder: (context, state) {
            if (state is LoadingRoomDetailsState) {
              return const LoadingWidget();
            } else if (state is LoadedRoomDetailsState) {
              return _buildBody(context, _tabController, state.roomDetails);
            } else if (state is ErrorRoomDetailsState) {
              return MessageDisplayWidget(message: state.message);
            }
            return const LoadingWidget();
          },
        ),
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        height: 60,
        child: CustomButton(
          title: 'Reserve',
          onPressed: () {},
          btnColor: primaryColor,
          txtColor: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  _buildBody(BuildContext context, TabController? tabController,
      RoomDetails roomDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        _buildTopSection(roomDetails, tabController),
        Material(
          color: Colors.white,
          child: TabBar(
            indicatorColor: primaryColor.withOpacity(.5),
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 17,
                ),
            tabs: const [
              Tab(
                icon: Text('Info'),
              ),
              Tab(
                icon: Text('Reviews'),
              )
            ],
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              RoomDetailsBodyWidget(
                roomDetails: roomDetails,
                scrollController: scrollController!,
              ),
              const Text('Reviews'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTopSection(
      RoomDetails roomDetails, TabController? tabController) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .05,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/back.png'),
                ),
                Text(
                  roomDetails.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/menu.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
