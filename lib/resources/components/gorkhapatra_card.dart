import 'package:flutter/material.dart';
import 'package:getting_api/webview_Screen.dart';
import 'package:google_fonts/google_fonts.dart';

class GpCard extends StatelessWidget {
  final String? title;
  final String? desscription;
  final String? imageurl;
  final String? link;

  final bool issmall;
  final String? gpdate;

  const GpCard(
      {Key? key,
      this.gpdate,
      this.title,
      this.desscription,
      this.imageurl,
      this.link,
      this.issmall = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(imageurl);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(
              showbottomad: true,
              showad: true,
              fileurl: link,
            ),
          ),
        );
        // Get.to(() => WebViewScreen(title: source.title, url: news.link));
      },
      child: Card(
        elevation: issmall ? 3 : 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(issmall ? 6 : 10),
        ),
        child: Stack(
          children: [
            Container(
              height: 180.0,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(issmall ? 6 : 10),
                color: Colors.indigo,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.indigo, Colors.indigo.shade100],
                  stops: [
                    0.1,
                    0.6,
                  ],
                ),
                image: DecorationImage(
                  image: NetworkImage(imageurl!),
                  opacity: 0.5,
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gpdate != null
                      ? Text(
                          "$gpdate",
                          style: GoogleFonts.mukta(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.2,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        )
                      : Text(""),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    title!.trim(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.baloo2(
                      fontSize: 18,
                      height: 1.3,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(issmall ? 2 : 4),
                ),
                child: Text(
                  "गोरखापत्र",
                  style: GoogleFonts.mukta(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.2,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
