import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_clean_architecture/screen/calculated_holidays/calculated_holidays_screen_view_model.dart';

class DateCountriesScreen extends StatefulWidget {
  const DateCountriesScreen({super.key});

  @override
  State<DateCountriesScreen> createState() => _DateCountriesScreenState();
}

class _DateCountriesScreenState extends State<DateCountriesScreen> {
  final screenViewModel = Get.find<CalculatedHolidaysScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
