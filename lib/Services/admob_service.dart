import 'dart:io';

class AdmobService {
  String getAdmobAppId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544~3347511713';
      //return 'ca-app-pub-3940256099942544~3419835294'; //ca-app-pub-8601164477138947~8900261560';
    }
    return '';
  }

  String getbannerAdUnitId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  String getinterstitialAdUnitId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/4411468910';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}
