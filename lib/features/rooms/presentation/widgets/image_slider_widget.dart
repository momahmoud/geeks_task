import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:geeks_task/core/app_theme.dart';
import 'package:geeks_task/features/rooms/domain/entities/room_details.dart';

class ImageSliderWidget extends StatefulWidget {
  final RoomDetails roomDetails;
  const ImageSliderWidget({Key? key, required this.roomDetails})
      : super(key: key);

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
        options: CarouselOptions(
            height: 400,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            autoPlay: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, _) {
              setState(() {
                _currentIndex = index;
              });
            }),
        itemCount: 3,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                    widget.roomDetails.featuredImage,
                  ),
                  fit: BoxFit.fill,
                )),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: DotsIndicator(
                          dotsCount: 3,
                          position: _currentIndex.toDouble(),
                          decorator: DotsDecorator(
                            activeColor: primaryColor,
                            color: Colors.white,
                            size: const Size.fromRadius(5.0),
                            activeSize: const Size.fromRadius(5.0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/full_screen.png',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
