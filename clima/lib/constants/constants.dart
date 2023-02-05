import 'package:flutter/material.dart';

final InputDecoration kSearchFieldDecoration = InputDecoration(
  hintText: 'Enter city name',
  icon: Icon(
    Icons.location_city_outlined,
    color: Colors.white,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      color: Colors.red,
      width: 20,
      style: BorderStyle.solid,
    ),
  ),
);
