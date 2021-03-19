import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // needs to be called because run app isn't called first
  MobileAds.instance.initialize(); // initialize mobile ads
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InterstitialAd myInterstitial;

  @override
  void initState() {
    super.initState();
    myInterstitial = InterstitialAd(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712' // test ad id for android
          : 'ca-app-pub-3940256099942544/4411468910', // test ad id for iOS
      request: AdRequest(),
      listener: AdListener(
        onAdClosed: (ad) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SecondPage(), // Navigate to second page
            ),
          );
          ad.dispose(); // dispose of ad
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose(); // dispose of ad
          print('Ad exited with error: $error'); // print error
        },
      ),
    );
    myInterstitial.load(); // loads ad befor showing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interstatial Ads'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            myInterstitial.show();
          },
          child: Text('Go To Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  InterstitialAd myInterstitial;

  @override
  void initState() {
    super.initState();
    myInterstitial = InterstitialAd(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-3940256099942544/4411468910', // test ad ids for differemt platform
      request: AdRequest(),
      listener: AdListener(
        onAdClosed: (ad) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(), // Navigate to second page
            ),
          );
          ad.dispose(); // dispose of ad
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose(); // dispose of ad
          print('Ad exited with error: $error');
        },
      ),
    );
    myInterstitial.load(); // loads ad befor showing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            myInterstitial.show();
          },
          child: Text('Go To First Page'),
        ),
      ),
    );
  }
}
