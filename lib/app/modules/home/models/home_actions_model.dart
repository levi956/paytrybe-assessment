import 'package:flutter/material.dart';

class HomeActionsModel {
  String svgPath;
  String label;
  String description;
  VoidCallback onPressed;
  bool isValid;

  HomeActionsModel(
    this.svgPath,
    this.label,
    this.description,
    this.onPressed,
    this.isValid,
  );
}
