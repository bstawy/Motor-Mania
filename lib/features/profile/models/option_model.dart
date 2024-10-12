import 'package:flutter/material.dart';

class OptionModel {
  final int? id;
  final String? title;
  final String? subtitle;
  final String? leadingIconPath;
  final String? leadingDarkIconPath;
  final Function(BuildContext)? onTap;

  OptionModel({
    this.id,
    this.title,
    this.subtitle,
    this.leadingIconPath,
    this.leadingDarkIconPath,
    this.onTap,
  });
}
