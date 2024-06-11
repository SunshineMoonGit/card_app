// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class BottomNavigationBarIconModel {
  final IconData icon;
  final IconData selectedIcon;
  final void Function() onTap;

  BottomNavigationBarIconModel({
    required this.icon,
    required this.selectedIcon,
    required this.onTap,
  });

  @override
  String toString() => 'BottomNavigationBarIconModel(icon: $icon, selectedIcon: $selectedIcon, onTap: $onTap)';
}
