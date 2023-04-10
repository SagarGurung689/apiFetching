// import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';


import 'package:webview_flutter/webview_flutter.dart';
// import 'package:mopub_flutter/mopub.dart';
// import 'package:mopub_flutter/mopub_interstitial.dart';

class WebViewScreen extends StatefulWidget {
  final String? fileurl;
  final bool? showad;
  final bool showbottomad;

  WebViewScreen(
      {Key? key, this.fileurl, this.showad, this.showbottomad = false})
      : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  // MoPubInterstitialAd interstitialAd;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
//    myBanner.dispose();
//    myInterstitial.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = true;
    // AdsViewModel _adsViewModel = AdsViewModel();
    // widget.showad ?? _adsViewModel.createInterstitialAd();

    // final AdWidget adWidget = AdWidget(ad: AdHelper.myBanner);
    return WillPopScope(
      onWillPop: () async {
        if (widget.showad == true) {
        //  _adsViewModel.showInterstitialAd();
          Navigator.pop(context);
        } else
          Navigator.pop(context);

        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
   
          body: Stack(
            children: [
              WebView(
                onPageStarted: (url) {
                  setState(() {
                    isLoading = false;
                  });
                },
                onProgress: (progress) {
                  print(progress);
                },
                initialUrl: widget.fileurl!,
                javascriptMode: JavascriptMode.unrestricted,
              ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(),
            ],
          ),
        ),
      ),
    );
  }
}
