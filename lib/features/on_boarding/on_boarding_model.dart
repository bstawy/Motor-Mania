import 'package:flutter/material.dart';

class OnBoardingModel {
  final String title;
  final String subtitle;
  final String description;
  final String image;
  final Alignment imageAlignment;
  final double rightPadding;
  final double leftPadding;

  OnBoardingModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
    required this.imageAlignment,
    required this.rightPadding,
    required this.leftPadding,
  });
}
