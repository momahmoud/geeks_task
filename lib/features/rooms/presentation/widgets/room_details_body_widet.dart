import 'package:flutter/material.dart';
import 'package:geeks_task/core/app_theme.dart';
import 'package:geeks_task/features/rooms/domain/entities/room_details.dart';
import 'package:geeks_task/features/rooms/presentation/widgets/facilities_widget.dart';
import 'package:geeks_task/features/rooms/presentation/widgets/image_slider_widget.dart';
import 'package:readmore/readmore.dart';

class RoomDetailsBodyWidget extends StatelessWidget {
  final RoomDetails roomDetails;
  const RoomDetailsBodyWidget(
      {Key? key, required this.roomDetails, required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                roomDetails.title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/hotel.png',
                        fit: BoxFit.cover,
                        width: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Hotel',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: primaryColor,
                                ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      _buildRating(),
                      const SizedBox(width: 2),
                      Text(
                        '${roomDetails.rating}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: primaryColor, fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              ImageSliderWidget(roomDetails: roomDetails),
              FacilitiesWidget(
                roomDetails: roomDetails,
              ),
              const SizedBox(height: 10),
              _buildDescription(context),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  _buildRating() {
    final List<String> starList = <String>[
      'assets/images/star.png',
      'assets/images/star.png',
      'assets/images/star.png',
      'assets/images/star.png',
      'assets/images/star.png',
    ];
    return SizedBox(
      height: 35,
      width: 150,
      child: Row(
          children: starList
              .map((e) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      e,
                      width: 24,
                      height: 23,
                      fit: BoxFit.cover,
                      color: Colors.grey,
                    ),
                  ))
              .toList()),
    );
  }

  _buildDescription(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hotel Description',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 18,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        ReadMoreText(
          roomDetails.description,
          trimLines: 2,
          textAlign: TextAlign.start,
          colorClickableText: Colors.pink,
          trimMode: TrimMode.Length,
          trimCollapsedText: 'See Details',
          trimExpandedText: 'Show less',
          trimLength: 95,
          lessStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 16,
                color: primaryColor,
              ),
          moreStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 16,
                color: primaryColor,
              ),
        ),
      ],
    );
  }
}
