// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `signOut`
  String get signOut {
    return Intl.message(
      'signOut',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Good Moring! 👋`
  String get goodMorning {
    return Intl.message(
      'Good Moring! 👋',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `kg`
  String get kg {
    return Intl.message(
      'kg',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Sami Ahmed`
  String get profileName {
    return Intl.message(
      'Sami Ahmed',
      name: 'profileName',
      desc: '',
      args: [],
    );
  }

  /// `This helps us create your personalized plan`
  String get helpForPersonalPlan {
    return Intl.message(
      'This helps us create your personalized plan',
      name: 'helpForPersonalPlan',
      desc: '',
      args: [],
    );
  }

  /// `You can always change this later`
  String get canChangeLater {
    return Intl.message(
      'You can always change this later',
      name: 'canChangeLater',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get activity {
    return Intl.message(
      'Activity',
      name: 'activity',
      desc: '',
      args: [],
    );
  }

  /// `Start New Activity`
  String get startNewActivity {
    return Intl.message(
      'Start New Activity',
      name: 'startNewActivity',
      desc: '',
      args: [],
    );
  }

  /// `Daily Task`
  String get dailyTask {
    return Intl.message(
      'Daily Tasks',
      name: 'dailyTask',
      desc: '',
      args: [],
    );
  }

  /// `Program`
  String get program {
    return Intl.message(
      'Program',
      name: 'program',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `40`
  String get fifty {
    return Intl.message(
      '40',
      name: 'fifty',
      desc: '',
      args: [],
    );
  }

  /// `Workout plan Beginner`
  String get freeWorkPlanTitle {
    return Intl.message(
      'Workout plan Beginner',
      name: 'freeWorkPlanTitle',
      desc: '',
      args: [],
    );
  }

  /// `04 Workouts for Beginner`
  String get freeWorkPlanSubTitle {
    return Intl.message(
      '04 Workouts for Beginner',
      name: 'freeWorkPlanSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `assets/Images/Pro WorkPlan1.png`
  String get pro1WorkPlanImage {
    return Intl.message(
      'assets/Images/Pro WorkPlan1.png',
      name: 'pro1WorkPlanImage',
      desc: '',
      args: [],
    );
  }

  /// `Full Body Goal Crusher`
  String get pro1WorkPlanTitle {
    return Intl.message(
      'Full Body Goal Crusher',
      name: 'pro1WorkPlanTitle',
      desc: '',
      args: [],
    );
  }

  /// `07 Workouts for Intermediate`
  String get pro1WorkPlanSubTitle {
    return Intl.message(
      '07 Workouts for Intermediate',
      name: 'pro1WorkPlanSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `assets/Images/Pro WorkPlan2.png`
  String get pro2WorkPlanImage {
    return Intl.message(
      'assets/Images/Pro WorkPlan2.png',
      name: 'pro2WorkPlanImage',
      desc: '',
      args: [],
    );
  }

  /// `Lower Body Strength`
  String get pro2WorkPlanTitle {
    return Intl.message(
      'Lower Body Strength',
      name: 'pro2WorkPlanTitle',
      desc: '',
      args: [],
    );
  }

  /// `05 Workouts for True Beast`
  String get pro2WorkPlanSubTitle {
    return Intl.message(
      '05 Workouts for True Beast',
      name: 'pro2WorkPlanSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `assets/Images/Pro WorkPlan3.png`
  String get pro3WorkPlanImage {
    return Intl.message(
      'assets/Images/Pro WorkPlan3.png',
      name: 'pro3WorkPlanImage',
      desc: '',
      args: [],
    );
  }

  /// `Drill Essentials`
  String get pro3WorkPlanTitle {
    return Intl.message(
      'Drill Essentials',
      name: 'pro3WorkPlanTitle',
      desc: '',
      args: [],
    );
  }

  /// `06 Workouts for Beginner`
  String get pro3WorkPlanSubTitle {
    return Intl.message(
      '06 Workouts for Beginner',
      name: 'pro3WorkPlanSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `end on`
  String get endOn {
    return Intl.message(
      'end on',
      name: 'endOn',
      desc: '',
      args: [],
    );
  }

  /// `3 mon ago`
  String get timeOfJoined {
    return Intl.message(
      '3 mon ago',
      name: 'timeOfJoined',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `PRO`
  String get pro {
    return Intl.message(
      'PRO',
      name: 'pro',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade to Premium`
  String get upgradeToPremium {
    return Intl.message(
      'Upgrade to Premium',
      name: 'upgradeToPremium',
      desc: '',
      args: [],
    );
  }

  /// `This subscription is auto-renewable`
  String get descriptionForPremium {
    return Intl.message(
      'This subscription is auto-renewable',
      name: 'descriptionForPremium',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `My Program`
  String get myProgram {
    return Intl.message(
      'My Program',
      name: 'myProgram',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `ak`
  String get ak {
    return Intl.message(
      'ak',
      name: 'ak',
      desc: '',
      args: [],
    );
  }

  /// `assets/Icons/Search.svg`
  String get searchIcon {
    return Intl.message(
      'assets/Icons/Search.svg',
      name: 'searchIcon',
      desc: '',
      args: [],
    );
  }

  /// `Tell us how we can help you`
  String get helpDescription {
    return Intl.message(
      'Tell us how we can help you',
      name: 'helpDescription',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus id tellus.`
  String get titleDescription {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus id tellus.',
      name: 'titleDescription',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Subscribtion`
  String get Subscribtion {
    return Intl.message(
      'Subscribtion',
      name: 'Subscribtion',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `assets/Icons/call.svg`
  String get callIcon {
    return Intl.message(
      'assets/Icons/call.svg',
      name: 'callIcon',
      desc: '',
      args: [],
    );
  }

  /// `+201015881141`
  String get serviceNumber {
    return Intl.message(
      '+201015881141',
      name: 'serviceNumber',
      desc: '',
      args: [],
    );
  }

  /// `assets/Icons/google.svg`
  String get googleIcon {
    return Intl.message(
      'assets/Icons/google.svg',
      name: 'googleIcon',
      desc: '',
      args: [],
    );
  }

  /// `awsabry2000@gmail.com`
  String get serviceEmail {
    return Intl.message(
      'awsabry2000@gmail.com',
      name: 'serviceEmail',
      desc: '',
      args: [],
    );
  }

  /// `Workout plan ( Beginner )`
  String get workOutPlanBeginner {
    return Intl.message(
      'Workout plan ( Beginner )',
      name: 'workOutPlanBeginner',
      desc: '',
      args: [],
    );
  }

  /// `Full body workout`
  String get fullBodyWorkOut {
    return Intl.message(
      'Full body workout',
      name: 'fullBodyWorkOut',
      desc: '',
      args: [],
    );
  }

  /// `Days 30`
  String get days30 {
    return Intl.message(
      'Days 30',
      name: 'days30',
      desc: '',
      args: [],
    );
  }

  /// `Lose belly fat, get ripped abs in just 4 weeks with this effcient plan. Its also helps pump ups arm, strengthen your back & shoulders. No equipment needed`
  String get workOutPlanBeginnerDescription {
    return Intl.message(
      'Lose belly fat, get ripped abs in just 4 weeks with this effcient plan. Its also helps pump ups arm, strengthen your back & shoulders. No equipment needed',
      name: 'workOutPlanBeginnerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get level {
    return Intl.message(
      'Level',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get beginner {
    return Intl.message(
      'Beginner',
      name: 'beginner',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message(
      'Days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `30`
  String get number30 {
    return Intl.message(
      '30',
      name: 'number30',
      desc: '',
      args: [],
    );
  }

  /// `(10)`
  String get number10WithBracket {
    return Intl.message(
      '(10)',
      name: 'number10WithBracket',
      desc: '',
      args: [],
    );
  }

  /// `Focus Area`
  String get focusArea {
    return Intl.message(
      'Focus Area',
      name: 'focusArea',
      desc: '',
      args: [],
    );
  }

  /// `Chest`
  String get chest {
    return Intl.message(
      'Chest',
      name: 'chest',
      desc: '',
      args: [],
    );
  }

  /// `Day 1`
  String get day1 {
    return Intl.message(
      'Day 1',
      name: 'day1',
      desc: '',
      args: [],
    );
  }

  /// `Day 2`
  String get day2 {
    return Intl.message(
      'Day 2',
      name: 'day2',
      desc: '',
      args: [],
    );
  }

  /// `Day 3`
  String get day3 {
    return Intl.message(
      'Day 3',
      name: 'day3',
      desc: '',
      args: [],
    );
  }

  /// `Day 4`
  String get day4 {
    return Intl.message(
      'Day 4',
      name: 'day4',
      desc: '',
      args: [],
    );
  }

  /// `Day 5`
  String get day5 {
    return Intl.message(
      'Day 5',
      name: 'day5',
      desc: '',
      args: [],
    );
  }

  /// `Day 6`
  String get day6 {
    return Intl.message(
      'Day 6',
      name: 'day6',
      desc: '',
      args: [],
    );
  }

  /// `Day 7`
  String get day7 {
    return Intl.message(
      'Day 7',
      name: 'day7',
      desc: '',
      args: [],
    );
  }

  /// `Day 6,7`
  String get day567 {
    return Intl.message(
      'Day 6,7',
      name: 'day567',
      desc: '',
      args: [],
    );
  }

  /// `5 Min`
  String get minutes5 {
    return Intl.message(
      '5 Min',
      name: 'minutes5',
      desc: '',
      args: [],
    );
  }

  /// `10 Min`
  String get minutes10 {
    return Intl.message(
      '10 Min',
      name: 'minutes10',
      desc: '',
      args: [],
    );
  }

  /// `Start Your Goal`
  String get startYourGoal {
    return Intl.message(
      'Start Your Goal',
      name: 'startYourGoal',
      desc: '',
      args: [],
    );
  }

  /// `Off`
  String get off {
    return Intl.message(
      'Off',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get startNow {
    return Intl.message(
      'Start Now',
      name: 'startNow',
      desc: '',
      args: [],
    );
  }

  /// `Body Building`
  String get bodyBuilding {
    return Intl.message(
      'Body Building',
      name: 'bodyBuilding',
      desc: '',
      args: [],
    );
  }

  /// `Exercises`
  String get exercises {
    return Intl.message(
      'Exercises',
      name: 'exercises',
      desc: '',
      args: [],
    );
  }

  /// `Jumping Jacks`
  String get jumbJacks {
    return Intl.message(
      'Jumping Jacks',
      name: 'jumbJacks',
      desc: '',
      args: [],
    );
  }

  /// `00 : 20`
  String get seconds20 {
    return Intl.message(
      '00 : 20',
      name: 'seconds20',
      desc: '',
      args: [],
    );
  }

  /// `My Plan For Today`
  String get myPlanForToday {
    return Intl.message(
      'My Plan For Today',
      name: 'myPlanForToday',
      desc: '',
      args: [],
    );
  }

  /// `1/7 Complete`
  String get oneSevenComplete {
    return Intl.message(
      '1/7 Complete',
      name: 'oneSevenComplete',
      desc: '',
      args: [],
    );
  }

  /// `%`
  String get precentatgeSign {
    return Intl.message(
      '%',
      name: 'precentatgeSign',
      desc: '',
      args: [],
    );
  }

  /// `6 hr Hours`
  String get sixHrHours {
    return Intl.message(
      '6 hr Hours',
      name: 'sixHrHours',
      desc: '',
      args: [],
    );
  }

  /// `Plans`
  String get plans {
    return Intl.message(
      'Plans',
      name: 'plans',
      desc: '',
      args: [],
    );
  }

  /// `This account isn't subscribed yet`
  String get accontIsntSubscribed {
    return Intl.message(
      'This account isn\'t subscribed yet',
      name: 'accontIsntSubscribed',
      desc: '',
      args: [],
    );
  }

  /// `Please put your right credentails`
  String get validCredential {
    return Intl.message(
      'Please put your right credentails',
      name: 'validCredential',
      desc: '',
      args: [],
    );
  }

  /// `Please put your right password`
  String get validPassword {
    return Intl.message(
      'Please put your right password',
      name: 'validPassword',
      desc: '',
      args: [],
    );
  }

  /// `Workout plan`
  String get workOutPlan {
    return Intl.message(
      'Workout plan',
      name: 'workOutPlan',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get monthly {
    return Intl.message(
      'Monthly',
      name: 'monthly',
      desc: '',
      args: [],
    );
  }

  /// `$9.99/m`
  String get monthlyPriceSubscription {
    return Intl.message(
      '\$9.99/m',
      name: 'monthlyPriceSubscription',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe Now`
  String get subscribeNow {
    return Intl.message(
      'Subscribe Now',
      name: 'subscribeNow',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Exercise 1`
  String get exercise1 {
    return Intl.message(
      'Exercise 1',
      name: 'exercise1',
      desc: '',
      args: [],
    );
  }

  /// `120 cal`
  String get callories120 {
    return Intl.message(
      '120 cal',
      name: 'callories120',
      desc: '',
      args: [],
    );
  }

  /// `warm up`
  String get warmUp {
    return Intl.message(
      'warm up',
      name: 'warmUp',
      desc: '',
      args: [],
    );
  }

  /// `Exercises 1/10`
  String get exerciseOneOverTen {
    return Intl.message(
      'Exercises 1/10',
      name: 'exerciseOneOverTen',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to Subscribe in this plan?`
  String get wantSubscribtion {
    return Intl.message(
      'Do you want to Subscribe in this plan?',
      name: 'wantSubscribtion',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
