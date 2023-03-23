import 'package:flutter/material.dart';

class QuickActionsModel {
  String svgPath;
  String label;
  VoidCallback onPressed;

  QuickActionsModel(this.svgPath, this.label, this.onPressed);
}
