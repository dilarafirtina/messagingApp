import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import '../../../widgets/networkimage_widget.dart';

Widget mediaSlider(List items) {
  return Column(
    children: [
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          onChanged: (value) {},
          decoration: const InputDecoration(
            labelText: 'Search',
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
      const SizedBox(height: 10),
      CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 0.5,
          enlargeCenterPage: true,
        ),
        items: createSliderItems(items),
      )
    ],
  );
}

List<Widget> createSliderItems(List sliderItems) {
  final List<Widget> imageSliders = sliderItems
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: double.infinity,
                      width: 400,
                      child: cachedNetworkImage(
                          item.url ?? "", BoxFit.fill, item.id.toString()),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '${item.name}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ))
      .toList();

  return imageSliders;
}
