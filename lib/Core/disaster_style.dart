import 'package:flutter/material.dart';

class DisasterStyle {
  final IconData icon;
  final Color color;

  DisasterStyle({required this.icon, required this.color});
}

class DisasterStyleHelper {
  static DisasterStyle getStyle(String type) {
    switch (type.toLowerCase()) {

      case 'earthquake':
        return DisasterStyle(
          icon: Icons.vibration,
          color: Colors.red,
        );

      case 'infrastructure':
        return DisasterStyle(
          icon: Icons.apartment,
          color: Colors.blueGrey,
        );

      case 'urban_fire':
      case 'wild_fire':
        return DisasterStyle(
          icon: Icons.local_fire_department,
          color: Colors.deepOrange,
        );

      case 'human_damage':
      case 'human':
        return DisasterStyle(
          icon: Icons.person,
          color: Colors.purple,
        );

      case 'drought':
        return DisasterStyle(
          icon: Icons.wb_sunny,
          color: Colors.orange,
        );

      case 'land_slide':
        return DisasterStyle(
          icon: Icons.terrain,
          color: Colors.brown,
        );

      case 'non_damage_buildings_street':
        return DisasterStyle(
          icon: Icons.location_city,
          color: Colors.grey,
        );

      case 'non_damage_wildlife_forest':
        return DisasterStyle(
          icon: Icons.forest,
          color: Colors.green,
        );

      case 'sea':
      case 'water_disaster':
        return DisasterStyle(
          icon: Icons.water,
          color: Colors.blue,
        );

      default:
        return DisasterStyle(
          icon: Icons.warning_amber_rounded,
          color: Colors.teal,
        );
    }
  }
}