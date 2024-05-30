import 'package:bot_map/geoposition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
    var a = getLocal();
    
    final sent = await twilioFlutter.sendWhatsApp(
      toNumber : dotenv.env['DESTINATORY_NUMBER']!,
      messageBody : '$a');

    getLocal();
    debugPrint(sent.toString());

    if (sent == 201) {
      debugPrint('Message sent successfully');
    } else {
      debugPrint('ERRO $sent');
    }
  } catch (e) {
    debugPrint('ERRO: $e');
  }
}
