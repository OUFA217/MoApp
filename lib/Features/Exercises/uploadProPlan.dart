import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future uploadProData() async {
  //  Getting the email from the shared pref
  String? email;
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  email = sharedPreferences.getString("email");

//  Getting the firebase firestore data to be retrieved
  final DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('users').doc(email).get();
  Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;

//  Getting the date of today in d-mm-yyyy format
  final DateTime today = DateTime.now();
  final DateFormat dateFormat = DateFormat('d-MM-yyyy', "en");

  Logger().e(data['phoneNumber']);

// for loop to set the data in firebase realtime for the 30 upcoming days

  Map<String, dynamic> numbers = {
    'progress': 0,
    'weeks': 0,
    'days': 0,
    'workouts': 0,
  };

  //  Pushing the data in the realtime
  databaseReference.child('users').child(data['phoneNumber']).set(numbers);

// Loading the json file in the assets
  final String jsonStringDay1 =
      await rootBundle.loadString('assets/workouts/pro/proDay1.json');
  final Map<String, dynamic> DayOnejsonData = jsonDecode(jsonStringDay1);

//  Upload the first Day
  final DateTime firstDateAddition = today.add(const Duration(days: 0));
  final String firstDay = dateFormat.format(firstDateAddition);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(firstDay)
        .set({
      'day': 1,
      'week': 1,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(firstDay)
        .child('workouts')
        .set(DayOnejsonData);
  } catch (error) {
    Logger().i(error);
  }

  //  Upload the Second Day

  // Loading the json file in the assets
  final String jsonStringDay2 =
      await rootBundle.loadString('assets/workouts/pro/proDay2.json');
  final Map<String, dynamic> DaytwojsonData = jsonDecode(jsonStringDay2);

  final DateTime secondDateAddition = today.add(const Duration(days: 1));
  final String secondDay = dateFormat.format(secondDateAddition);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(secondDay)
        .set({
      'day': 2,
      'week': 1,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(secondDay)
        .child('workouts')
        .set(DaytwojsonData);
  } catch (error) {
    Logger().i(error);
  }

  // //

  // Loading the json file in the assets

  final String jsonStringDay3 =
      await rootBundle.loadString('assets/workouts/pro/proDay3.json');
  final Map<String, dynamic> DaythreejsonData = jsonDecode(jsonStringDay3);

  final DateTime thirdDateAddition = today.add(const Duration(days: 2));
  final String thridDay = dateFormat.format(thirdDateAddition);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(thridDay)
        .set({
      'day': 3,
      'week': 1,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(thridDay)
        .child('workouts')
        .set(DaythreejsonData);
  } catch (error) {
    Logger().i(error);
  }

  // //
  // Loading the json file in the assets
  final String jsonStringDay4 =
      await rootBundle.loadString('assets/workouts/pro/proDay4.json');
  final Map<String, dynamic> DayfourjsonData = jsonDecode(jsonStringDay4);

  final DateTime fourthDateAddition = today.add(const Duration(days: 3));
  final String fourthDay = dateFormat.format(fourthDateAddition);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(fourthDay)
        .set({
      'day': 4,
      'week': 1,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(fourthDay)
        .child('workouts')
        .set(DayfourjsonData);
  } catch (error) {
    Logger().i(error);
  }

  // //
  // Loading the json file in the assets
  final String jsonStringDay5 =
      await rootBundle.loadString('assets/workouts/pro/proDay5.json');
  final Map<String, dynamic> DayfivejsonData = jsonDecode(jsonStringDay5);

  final DateTime fifthDateAddition = today.add(const Duration(days: 4));
  final String fifthDay = dateFormat.format(fifthDateAddition);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(fifthDay)
        .set({
      'day': 5,
      'week': 1,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(fifthDay)
        .child('workouts')
        .set(DayfivejsonData);
  } catch (error) {
    Logger().i(error);
  }

  // //
  // Loading the json file in the assets
  final String jsonStringDay6 =
      await rootBundle.loadString('assets/workouts/pro/proDay6.json');
  final Map<String, dynamic> DaysSixjsonData = jsonDecode(jsonStringDay6);

  final DateTime sixthDateAddition = today.add(const Duration(days: 5));
  final String sixthDay = dateFormat.format(sixthDateAddition);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(sixthDay)
        .set({
      'day': 6,
      'week': 1,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(sixthDay)
        .child('workouts')
        .set(DaysSixjsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime seventhDateAddition = today.add(const Duration(days: 6));
  final String seventhDay = dateFormat.format(seventhDateAddition);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(seventhDay)
        .set({
      'day': 7,
      'week': 1,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(seventhDay)
        .child('workouts')
        .set("off");
  } catch (error) {
    Logger().i(error);
  }
  //  Week Two
  final DateTime eighthDateAddition = today.add(const Duration(days: 7));
  final String eighthDay = dateFormat.format(eighthDateAddition);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(eighthDay)
        .set({
      'day': 1,
      'week': 2,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(eighthDay)
        .child('workouts')
        .set(DayOnejsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime ninthDateAddition = today.add(const Duration(days: 8));
  final String ninthDay = dateFormat.format(ninthDateAddition);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(ninthDay)
        .set({
      'day': 2,
      'week': 2,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(ninthDay)
        .child('workouts')
        .set(DaytwojsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime ten = today.add(const Duration(days: 9));
  final String tenth = dateFormat.format(ten);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(tenth)
        .set({
      'day': 3,
      'week': 2,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(tenth)
        .child('workouts')
        .set(DaythreejsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime eleven = today.add(const Duration(days: 10));
  final String eleventhDay = dateFormat.format(eleven);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(eleventhDay)
        .set({
      'day': 4,
      'week': 2,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(eleventhDay)
        .child('workouts')
        .set(DayfourjsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime twelve = today.add(const Duration(days: 11));
  final String twelvethDay = dateFormat.format(twelve);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twelvethDay)
        .set({
      'day': 5,
      'week': 2,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twelvethDay)
        .child('workouts')
        .set(DayfivejsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime thirtenthAddition = today.add(const Duration(days: 12));
  final String thirtheenth = dateFormat.format(thirtenthAddition);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(thirtheenth)
        .set({
      'day': 6,
      'week': 2,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(thirtheenth)
        .child('workouts')
        .set(DaysSixjsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime fourteen = today.add(const Duration(days: 13));
  final String fourteenth = dateFormat.format(fourteen);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(fourteenth)
        .set({
      'day': 7,
      'week': 2,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(fourteenth)
        .child('workouts')
        .set('off');
  } catch (error) {
    Logger().i(error);
  }

  final DateTime fifteen = today.add(const Duration(days: 14));
  final String fifteenthDay = dateFormat.format(fifteen);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(fifteenthDay)
        .set({
      'day': 1,
      'week': 3,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(fifteenthDay)
        .child('workouts')
        .set(DayOnejsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime sixteen = today.add(const Duration(days: 15));
  final String sixteenthDay = dateFormat.format(sixteen);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(sixteenthDay)
        .set({
      'day': 2,
      'week': 3,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(sixteenthDay)
        .child('workouts')
        .set(DaytwojsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime seventeen = today.add(const Duration(days: 16));
  final String seventeenthDay = dateFormat.format(seventeen);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(seventeenthDay)
        .set({
      'day': 3,
      'week': 3,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(seventeenthDay)
        .child('workouts')
        .set(DaythreejsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime eighteen = today.add(const Duration(days: 17));
  final String eighteenthDay = dateFormat.format(eighteen);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(eighteenthDay)
        .set({
      'day': 4,
      'week': 3,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(eighteenthDay)
        .child('workouts')
        .set(DayfourjsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime ninteen = today.add(const Duration(days: 18));
  final String ninteenthDay = dateFormat.format(ninteen);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(ninteenthDay)
        .set({
      'day': 5,
      'week': 3,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(ninteenthDay)
        .child('workouts')
        .set(DayfivejsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime twenty = today.add(const Duration(days: 19));
  final String twentyth = dateFormat.format(twenty);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentyth)
        .set({
      'day': 6,
      'week': 3,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentyth)
        .child('workouts')
        .set(DaysSixjsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime twentyOne = today.add(const Duration(days: 20));
  final String twentyOnethDay = dateFormat.format(twentyOne);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentyOnethDay)
        .set({
      'day': 7,
      'week': 3,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentyOnethDay)
        .child('workouts')
        .set('off');
  } catch (error) {
    Logger().i(error);
  }

  final DateTime twentytwo = today.add(const Duration(days: 21));
  final String twentytwoDay = dateFormat.format(twentytwo);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentytwoDay)
        .set({
      'day': 1,
      'week': 4,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentytwoDay)
        .child('workouts')
        .set(DayOnejsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime twentyThree = today.add(const Duration(days: 22));
  final String twentyThreethDay = dateFormat.format(twentyThree);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentyThreethDay)
        .set({
      'day': 2,
      'week': 4,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentyThreethDay)
        .child('workouts')
        .set(DaytwojsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime twentyFour = today.add(const Duration(days: 23));
  final String twentyFourthDay = dateFormat.format(twentyFour);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentyFourthDay)
        .set({
      'day': 3,
      'week': 4,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentyFourthDay)
        .child('workouts')
        .set(DaythreejsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime twentyFive = today.add(const Duration(days: 24));
  final String twentyFivethDay = dateFormat.format(twentyFive);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentyFivethDay)
        .set({
      'day': 4,
      'week': 4,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentyFivethDay)
        .child('workouts')
        .set(DayfourjsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime twentySix = today.add(const Duration(days: 25));
  final String twentySixthDay = dateFormat.format(twentySix);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentySixthDay)
        .set({
      'day': 5,
      'week': 4,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentySixthDay)
        .child('workouts')
        .set(DayfivejsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime twentySeven = today.add(const Duration(days: 26));
  final String twentySeventhDay = dateFormat.format(twentySeven);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentySeventhDay)
        .set({
      'day': 6,
      'week': 4,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentySeventhDay)
        .child('workouts')
        .set(DaysSixjsonData);
  } catch (error) {
    Logger().i(error);
  }

  final DateTime twentyEight = today.add(const Duration(days: 27));
  final String twentyEighthDay = dateFormat.format(twentyEight);

  try {
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentyEighthDay)
        .set({
      'day': 7,
      'week': 4,
    });
    databaseReference
        .child('users')
        .child(data['phoneNumber'])
        .child(twentyEighthDay)
        .child('workouts')
        .set('off');
  } catch (error) {
    Logger().i(error);
  }
}

//
