import 'package:flutter/material.dart';

import '../../reuseable_widgets/rounded_button.dart';
import '../styles/colors.dart';

showerror() {
  Container(
    decoration: BoxDecoration(
        color: colorWhite, borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Error'),
        const Text('Something Went Wrong, Please try again'),
        RoundedButton(
          textButton: 'Reload',
          onTap: () {

          },
        )
      ],
    ),
  );
}
