import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Presentation/Exercise/exercise.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodayExercise {
  String? dayNumber;

  Future<String?> getSameDayExercises() async {
    String? email;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString("email");

    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(email).get();
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;

    final DateTime today = DateTime.now();
    final DateFormat dateFormat = DateFormat('d-MM-yyyy', "en");
    final String firstDay = dateFormat.format(today);

    final DatabaseReference database =
        FirebaseDatabase.instance.ref().child('users');

    DatabaseEvent dataSnapshot = await database
        .child(data['phoneNumber'])
        .child(firstDay)
        .once(); // Use 'once' to fetch the data once.
    if (dataSnapshot.snapshot.value != null) {
      // Get the data as a Map
      Map exerciseData = dataSnapshot.snapshot.value as Map;
      dayNumber = exerciseData['day'].toString();
    } else {
      // Handle the case where there is no data.
      dayNumber = null;
    }

    return dayNumber;
  }

  String? id;
  int? duration;
  String? link;
  String? muscle;
  String? title;
  String? reps;
  String? sets;

  Future<String?> getFirstExercise(context) async {
    String? email;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString("email");

    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(email).get();
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;

    final DateTime today = DateTime.now();
    final DateFormat dateFormat = DateFormat('d-MM-yyyy', "en");
    final String firstDay = dateFormat.format(today);

    final DatabaseReference database =
        FirebaseDatabase.instance.ref().child('users');

    DatabaseEvent dataSnapshot = await database
        .child(data['phoneNumber'])
        .child(firstDay)
        .child('workouts')
        .child('1')
        .once(); // Use 'once' to fetch the data once.
    if (dataSnapshot.snapshot.value != null) {
      Map exerciseValues = dataSnapshot.snapshot.value as Map;
      duration = exerciseValues['duration'];
      link = exerciseValues['link'].toString();
      muscle = exerciseValues['muscle'].toString();
      title = exerciseValues['title'].toString();
      reps = exerciseValues['reps'].toString();
      sets = exerciseValues['sets'].toString();
      push(
          context,
          Exercise(
            id: "1",
            duration: exerciseValues['duration'],
            link: exerciseValues['link'],
            muscle: exerciseValues['muscle'],
            title: exerciseValues['title'],
            reps: exerciseValues['reps'],
            sets: exerciseValues['sets'],
          ));
    } else {
      // Handle the case where there is no data.
      dayNumber = null;
      id = null;
      duration = null;
      link = null;
      muscle = null;
      title = null;
      reps = null;
      sets = null;
    }
    return null;
  }

  Future<String?> getNextExercise(context, {required String id}) async {
    String? email;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString("email");

    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(email).get();
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;

    final DateTime today = DateTime.now();
    final DateFormat dateFormat = DateFormat('d-MM-yyyy', "en");
    final String firstDay = dateFormat.format(today);

    final DatabaseReference database =
        FirebaseDatabase.instance.ref().child('users');

    int? nextOne = int.parse(id) + 1;

    DatabaseEvent dataSnapshot = await database
        .child(data['phoneNumber'])
        .child(firstDay)
        .child('workouts')
        .child(nextOne.toString())
        .once(); // Use 'once' to fetch the data once.
    if (dataSnapshot.snapshot.value != null) {
      Map exerciseValues = dataSnapshot.snapshot.value as Map;
      duration = exerciseValues['duration'];
      link = exerciseValues['link'].toString();
      muscle = exerciseValues['muscle'].toString();
      title = exerciseValues['title'].toString();
      reps = exerciseValues['reps'].toString();
      sets = exerciseValues['sets'].toString();
      pushAndRemoved(
          context,
          Exercise(
            id: nextOne.toString(),
            duration: exerciseValues['duration'],
            link: exerciseValues['link'],
            muscle: exerciseValues['muscle'],
            title: exerciseValues['title'],
            reps: exerciseValues['reps'],
            sets: exerciseValues['sets'],
          ));
    } else {
      return null;
    }
    return null;
  }

  Future<String?> getPreviousExercise(context, {required String id}) async {
    String? email;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString("email");

    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(email).get();
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;

    final DateTime today = DateTime.now();
    final DateFormat dateFormat = DateFormat('d-MM-yyyy', "en");
    final String firstDay = dateFormat.format(today);

    final DatabaseReference database =
        FirebaseDatabase.instance.ref().child('users');

    int? nextOne = int.parse(id) - 1;

    DatabaseEvent dataSnapshot = await database
        .child(data['phoneNumber'])
        .child(firstDay)
        .child('workouts')
        .child(nextOne.toString())
        .once(); // Use 'once' to fetch the data once.
    if (dataSnapshot.snapshot.value != null) {
      Map exerciseValues = dataSnapshot.snapshot.value as Map;
      duration = exerciseValues['duration'];
      link = exerciseValues['link'].toString();
      muscle = exerciseValues['muscle'].toString();
      title = exerciseValues['title'].toString();
      reps = exerciseValues['reps'].toString();
      sets = exerciseValues['sets'].toString();
      pushAndRemoved(
          context,
          Exercise(
            id: nextOne.toString(),
            duration: exerciseValues['duration'],
            link: exerciseValues['link'],
            muscle: exerciseValues['muscle'],
            title: exerciseValues['title'],
            reps: exerciseValues['reps'],
            sets: exerciseValues['sets'],
          ));
    } else {
      return null;
    }
    return null;
  }
}
