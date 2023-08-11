import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showAppDialog({required BuildContext context, required String title}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        'Error !',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: context.pop,
            child: Text('Ok'),
          ),
        ],
      ),
    ),
  );
}
