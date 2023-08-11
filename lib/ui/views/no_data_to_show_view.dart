import 'package:flutter/material.dart';

class NoDataToShowView extends StatelessWidget {
  const NoDataToShowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No Data Available'),
      ),
    );
  }
}
