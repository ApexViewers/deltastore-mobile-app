
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../constant/fonts_strings.dart';
import '../../constant/paddings.dart';
import '../../reuseable_widgets/bold_text_widget.dart';

class OurGauarantee extends StatefulWidget {
  const OurGauarantee({Key? key}) : super(key: key);

  @override
  State<OurGauarantee> createState() => _OurGauaranteeState();
}

class _OurGauaranteeState extends State<OurGauarantee> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padA5,
      child: Column(
        children: [
          showText("90 Days warranty ",
              "In case of failure, the product is repaired free of charge. If the repair is not possible, Parts Can be replaced and you have to pay the price for Replaced Parts only. Labor & Servicing absolutely free for 90 days."),
          SizedBox(
            height: 1.h,
          ),
          showText("30 days Contractual Warranty",
              "In case of failure, the product is repaired free of charge. If the repair is not possible the product is exchanged, no Question asked."),
          SizedBox(
            height: 1.h,
          ),
          showText("15 days to change your mind",
              "You have 15 days after receiving the product to use it. If it does not meet your expectations, we will refund you as soon as possible."),
          SizedBox(
            height: 1.h,
          ),
          showText("Express delivery", "We deliver in 2 to 4 business days."),
          SizedBox(
            height: 1.h,
          ),
          showText("Responsive customer service",
              "We have a responsive customer service available 7/7 and we are committed to responding within one business day if you have any question of problem."),
        ],
      ),
    );
  }

  Widget showText(text1, text2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldText(
          textBold: text1,
          size: 15,
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                text2,
                style: const TextStyle(fontFamily: nexaregular, fontSize: 13),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        )
      ],
    );
  }
}
