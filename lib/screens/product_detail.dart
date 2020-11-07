import 'package:flutter/material.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/constants/san_pya_icons.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/utils/fullscreen_height.dart';
import 'package:san_pya/widgets/app_bar.dart';
import 'package:san_pya/widgets/block_button.dart';
import 'package:san_pya/widgets/custom_checkbox.dart';
import 'package:san_pya/widgets/label.dart';
import 'package:san_pya/widgets/quantity_input.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var containerHeight = fullScreenHeight(context);

    var theme = Theme.of(context);
    var primaryColor = theme.primaryColor;
    var accentColor = theme.accentColor;

    return Scaffold(
      appBar: appBar(context, "Product Detail"),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: double.infinity, minHeight: containerHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  buildConverPhoto(primaryColor),
                  Container(
                    width: double.infinity,
                    padding: Edge.e4,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Text(
                              "Instock",
                              style: TextStyle(
                                  color: accentColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            "SED UP PERSPICIA UNDE OMNIS",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            margin: Edge.eb4,
                            child: Text("MMK 10000 / viss",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                          ),
                          Label(label: "Size"),
                          Container(
                            width: double.infinity,
                            margin: Edge.eb4,
                            padding: Edge.eb4,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: BoxBorderColors.primary))),
                            child: Wrap(
                              spacing: 12.0,
                              runSpacing: 8.0,
                              children: [
                                CustomCheckbox(
                                  label: "Small",
                                ),
                                CustomCheckbox(
                                  label: "Medium",
                                ),
                                CustomCheckbox(
                                  label: "Large",
                                ),
                              ],
                            ),
                          ),
                          Label(label: "Quanitity"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              QuantityInput(width: 120),
                              Text(
                                "MMK 10000",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ]),
                  ),
                ],
              ),
              Padding(
                padding: Edge.e4,
                child: BlockButton(
                  icon: SanPyaIcons.cart,
                  text: ('Add to Cart'),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AspectRatio buildConverPhoto(Color primaryColor) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image(
            width: double.infinity,
            image: AssetImage('graphics/image1.png'),
            fit: BoxFit.cover,
          ),
          Container(
            color: primaryColor,
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Spacing.s3, horizontal: Spacing.s4),
                child: Text(
                  "Promotion Price",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
