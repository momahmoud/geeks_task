import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geeks_task/core/app_theme.dart';
import 'package:geeks_task/features/rooms/domain/entities/room_details.dart';

class FacilitiesWidget extends StatefulWidget {
  final RoomDetails roomDetails;
  const FacilitiesWidget({
    Key? key,
    required this.roomDetails,
  }) : super(key: key);

  @override
  State<FacilitiesWidget> createState() => _FacilitiesWidgetState();
}

class _FacilitiesWidgetState extends State<FacilitiesWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 15),
        Text(
          'Facilities',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 19,
                color: Colors.grey[700],
              ),
        ),
        const SizedBox(height: 15),
        Center(
          child: SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
                options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.6,
                    initialPage: 0,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, _) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
                itemCount: 3,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: widget.roomDetails.features.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.network(
                              widget.roomDetails.features[index].image,
                              height: 33,
                              fit: BoxFit.cover,
                              color: widget.roomDetails.features[index].isActive
                                  ? primaryColor
                                  : Colors.grey,
                              placeholderBuilder: (BuildContext context) =>
                                  Container(
                                height: 33,
                                padding: const EdgeInsets.all(30.0),
                                child: const CircularProgressIndicator(),
                              ),
                              theme: SvgTheme(
                                  currentColor: primaryColor, xHeight: 33),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              widget.roomDetails.features[index].description,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 0,
                    ),
                  );
                }),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: SizedBox(
            height: 23,
            width: 200,
            child: DotsIndicator(
              dotsCount: 3,
              position: _currentIndex.toDouble(),
              decorator: const DotsDecorator(
                size: Size.fromRadius(7.0),
                activeSize: Size.fromRadius(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
