import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/pages/widgets/carousel.dart';
import '/feature/meals/model/meal_model.dart';

class Header extends StatefulWidget {
  final List<MealModel> dataMeal;
  const Header({super.key, required this.dataMeal});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Carousel(
      reelsData: widget.dataMeal,
      controller: _controller,
      current: _current,
      onPageChanged: (index) {
        setState(() {
          _current = index;
        });
      },
    );
  }
}
