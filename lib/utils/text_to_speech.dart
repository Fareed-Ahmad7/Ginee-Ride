import 'package:flutter_tts/flutter_tts.dart';

import '../model/rideDetails.dart';

class TextToSpeech {
  static Future<void> speak(RideDetails text) async {
    FlutterTts flutterTts = FlutterTts();
    await flutterTts.speak('reading ride details of ride ${text.id}');
    await flutterTts.speak('name of the client is ${text.name}');
    await flutterTts.speak('the client is ${text.distance}');
    await flutterTts.speak('pickup location is ${text.pickupLocation}');
    await flutterTts.speak('drop location is ${text.dropLocation}');
    await flutterTts.speak('client payment method is ${text.paymentMethod}');
    await flutterTts
        .speak('The fare amount for this ride is ${text.price} rupees');
    await flutterTts
        .speak('Click confirm button if you want to proceed with this ride');
  }

  static void speakNoRides() {
    FlutterTts flutterTts = FlutterTts();
    Future.delayed(const Duration(seconds: 1), () async {
      await flutterTts.speak('There are no upcoming rides!');
      await flutterTts.speak('Please wait until new ride comes up');
    });
  }
}