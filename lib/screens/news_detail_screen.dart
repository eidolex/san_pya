import 'package:flutter/material.dart';
import 'package:san_pya/widgets/app_bar.dart';
import 'package:san_pya/utils/fullscreen_height.dart';
import 'package:san_pya/constants/spacings.dart';

class NewsDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var containerHeight = fullScreenHeight(context);

    return Scaffold(
      appBar: appBar(context, "News Details"),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: double.infinity, minHeight: containerHeight),
          child: Column(
            children: [
              Column(
                children: [
                  buildPhotoWithText(),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(
                        Spacing.s5, Spacing.s4, Spacing.s5, Spacing.s4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: Spacing.s4),
                        Text(
                          "This is a super long description that I have written with a non-sense data and do not bother to read at all. Even though all these sentence does not make sense, it is still better than writing nothing at all. At least, these sentences will help us to test whether the data is being wrapped or not. Thanks a lot for reading this.",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(height: Spacing.s4),
                        GestureDetector(
                          child: Container(
                              padding: Edge.e3,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: new Border.all(
                                    color: Color(0xFF90CAF9),
                                  )),
                              alignment: Alignment.center,
                              child: Text(
                                "Like",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  AspectRatio buildPhotoWithText() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          Image(
            width: double.infinity,
            image: AssetImage('graphics/image1.png'),
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(
                  Spacing.s5, Spacing.s4, Spacing.s5, Spacing.s4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                            "SED UT PERSPICIA UNDE OMNIS OFFICI DESERUNT MOLLITIA ANIMI",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                  SizedBox(height: Spacing.s3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("23 March 2019",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                      Text("172 Likes",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
