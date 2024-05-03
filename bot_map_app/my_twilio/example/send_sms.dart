import 'dart:io' show Platform;
import 'package:my_twilio/my_twilio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// DotEnv dotenv = DotEnv() is automatically called during import.
// If you want to load multiple dotenv files or name your dotenv object differently, you can do the following and import the singleton into the relavant files:
// DotEnv another_dotenv = DotEnv()

Future main() async {
  // To load the .env file contents into dotenv.
  // NOTE: fileName defaults to .env and can be omitted in this case.
  // Ensure that the filename corresponds to the path in step 1 and 2.
  await dotenv.load(fileName: ".env");
  //...runapp
}

Future<void> main() async {
  // See http://twil.io/secure for important security information
  var _accountSid = Platform.environment['ACCOUNT_SID'];
  var _authToken = Platform.environment['AUTH_TOKEN'];

  // Your Account SID and Auth Token from www.twilio.com/console
  // You can skip this block if you store your credentials in environment variables
  _accountSid ??= 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  _authToken ??= 'your_auth_token';

  // Create an authenticated client instance for Twilio API
  var client = new MyTwilio(_accountSid, _authToken);

  // Send a text message
  // Returns a Map object (key/value pairs)
  Map message = await client.messages.create({
    'body': 'Hello from Dart!',
    'from': '+12345678901', // a valid Twilio number
    'to': '+12345678902' // your phone number
  });

  // access individual properties using the square bracket notation
  // for example print(message['sid']);
  print(message);
}
