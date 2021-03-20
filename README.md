# Interstitial Ads

A new Flutter project showing an example use case of interstitial ads.

## What this app does
This app loads the first page and when the button is clicked the interstitial is loaded. When it is closed the page is replaced by the second page and the ad disposed. The second page is just like the first and returns you back to the first page repeating the same process.

## Important!
The app has not been set up for IOS even though it implements platform specific ad unit ids. For this to work successfully on IOS the `Info.plist` file must be changed to include the `GADApplicationIdentifier` key and the `SKAdNetworkItems` key See the [documentation](https://pub.dev/packages/google_mobile_ads#platform-specific-setup) for more info.

## Useful Links
- [AdMob](https://apps.admob.com/signup/create-account)
- [Set Up Your AdMob](https://youtu.be/sXYbIEjGiJM?t=34)
- [Package documentation](https://pub.dev/packages/google_mobile_ads)
- [Android Test Ad Units](https://developers.google.com/admob/android/test-ads#sample%5C_ad%5C_units)
- [IOS Test Ad Units](https://developers.google.com/admob/ios/test-ads#demo%5C_ad%5C_units)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
