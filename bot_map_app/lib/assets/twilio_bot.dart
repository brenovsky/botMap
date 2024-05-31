import 'package:bot_map/assets/geoposition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

void sendSMS() async {
  await dotenv.load(fileName: ".env");

  final twilioFlutter = TwilioFlutter(
    accountSid: dotenv.env['TWILIO_ACCOUNT_SID']!,
    authToken: dotenv.env['TWILIO_AUTH_TOKEN']!,
    twilioNumber: dotenv.env['TWILIO_NUMBER']!,
  );

  debugPrint(twilioFlutter.toString());

  try {
    Placemark? loc = await getLocal();
    String formattedLoc = formatPlaceMark(loc!);

    final sent = await twilioFlutter.sendWhatsApp(
        toNumber: dotenv.env['DESTINATORY_NUMBER']!,
        messageBody: 'Estou em *$formattedLoc*');

    debugPrint(sent.toString());

    if (sent == 201) {
      debugPrint('Message sent successfully');

    } else {
      debugPrint('ERROR: $sent');
    }
  } catch (e) {
    debugPrint('ERROR: $e');
  }
}
