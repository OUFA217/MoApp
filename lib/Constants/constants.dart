// import 'package:flutter/material.dart';

import 'dart:ui';

abstract class FitzConstants {
  static const String applicationName = "MoApp";
  static const String applicationImage = "assets/Images/logo.png";
  static const List onBoardingImages = [
    'assets/Images/OnBoarding1.png',
    'assets/Images/OnBoarding2.png',
    'assets/Images/OnBoarding3.png'
  ];
  static const List onBoardingTitle = [
    "Welcome to FitzApp",
    "Workout Categories",
    "Custom Workouts"
  ];
  static const List onBoardingDescription = [
    'Quis autem vel eum iure reprehenderit qui in '
        'ea voluptate velit esse quam nihil molestiae '
        'consequatu',
    'Quis autem vel eum iure reprehenderit qui in '
        'ea voluptate velit esse quam nihil molestiae '
        'consequatu',
    'Quis autem vel eum iure reprehenderit qui in '
        'ea voluptate velit esse quam nihil molestiae '
        'consequatu'
  ];
  static const List buttonOnBoardingTitles = [
    "Get Started",
    "Start Training",
    "Start Training"
  ];
  static const String haveAnAccount = "Already Have an account?";
  static const String dontHaveAnAccount = "Don't have an account?";
  static const String signUp = "Sign Up";
  static const String signIn = "Sign In";
  static const String signOut = "Sign Out";
  static const String hintEmailSignIn = "Email";
  static const String hintEmailSignUp = "Email";
  static const String myProgram = "My program";
  static const String hintPassword = "Password";
  static const String hintPhone = "Phone";
  static const String hintFirstName = "First Name";
  static const String hintLastName = "Last Name";
  static const String acceptPrivacyPolicy =
      "By continuing you accept our Privacy Policy";
  static const String forgotPassword = "Forgot Password?";
  static const String signInWith = "Sign in with";
  static const String validatorEmail = "Please Put your Phone / Email";
  static const String sentCode = "We sent a code to your number";

  static const String phoneVerification = "Phone verification";
  static const String validatorFirstName = "Please Put your First Name";
  static const String validatorLastName = "Please Put your Last Name";

  static const String validatorPhone = "Please Put your Phone";
  static const String validatorPassword = "Please Put your Password";
  static const String dontReceiveCode = "Don't receive your code? ";
  static const String resend = "Resend";
  static const String askForAge = "How old are you?";
  static const String askForWeight = "What’s your weight?";
  static const String askForHeight = "What’s your height?";
  static const String askForGoal = "What’s your goal?";

  static String dayTime = " ";
//   static const String goodMorning = "Good Moring! 👋";
//   static const String kg = "kg";
//   static const String name = "Name";
//   static const String profileName = "Sami Ahmed";
  static const String helpForPersonalPlan =
      "This helps us create your personalized plan";
//   static const String canChangeLater = "You can always change this later";
  static const List<int> ages = [
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90
  ];
  static const List<int> height = [
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    209,
    210,
    211,
    212,
    213,
    214,
    215,
    216,
    217,
    218,
    219,
    220,
    221,
    222,
    223,
    224,
    225,
    226,
    227,
    228,
    229,
    230,
    231,
    232,
    233,
    234,
    235,
    236,
    237,
    238,
    239,
    240
  ];
  static const List<Map> goals = [
    {
      0: "Gain Weight",
      1: "Lost Weight",
      2: "Get Fitter",
      3: "Gain More Flexible",
      4: "Learn The basic"
    }
  ];
  static const String next = "Next";
  static const String homeIcon = "assets/Icons/home.svg";
//   static const String home = "Home";

  static const String activityIcon = "assets/Icons/Activity.svg";
//   static const String activity = "Activity";

  static const String startNewActivity = "Start New Activity";
//   static const String dailyTask = "Daily Task";
  static const String playDailyTaskIcon = "assets/Icons/PlayDailyTask.svg";

  static const String programIcon = "assets/Icons/Discover.svg";
//   static const String program = "Program";

  static const String profileIcon = "assets/Icons/Settings.svg";
//   static const String setting = "Setting";

  static const String freeWorkPlanImage = "assets/Images/Free WorkPlan.png";
//   static const String freeWorkPlanTitle = "Workout plan Beginner";
//   static const String freeWorkPlanSubTitle = "04 Workouts for Beginner";

  static const String pro1WorkPlanImage = "assets/Images/Pro WorkPlan1.png";
//   static const String pro1WorkPlanTitle = "Full Body Goal Crusher";
//   static const String pro1WorkPlanSubTitle = "07 Workouts for Intermediate";

  static const String pro2WorkPlanImage = "assets/Images/Pro WorkPlan2.png";
//   static const String pro2WorkPlanTitle = "Lower Body Strength";
//   static const String pro2WorkPlanSubTitle = "05 Workouts for True Beast";

  static const String pro3WorkPlanImage = "assets/Images/Pro WorkPlan3.png";
//   static const String pro3WorkPlanTitle = "Drill Essentials";
//   static const String pro3WorkPlanSubTitle = "06 Workouts for Beginner";

//   static const String endOn = "end on";
//   static const String timeOfJoined = "3 mon ago";
  static const String profilePicture = "assets/Icons/noProfileIcon.svg";
//   static const String editProfile = "Edit Profile";
//   static const String privacyPolicy = "Privacy Policy";
//   static const String settings = "Settings";
//   static const String pro = "PRO";
//   static const String upgradeToPremium = "Upgrade to Premium";
//   static const String descriptionForPremium =
//       "This subscription is auto-renewable";
  static const String titlePrivacyDescription = '''Lorem ipsum dolor sit amet

// ''';
  static const String subTitlePrivacyDescription =
      '''Consectetur adipiscing elit. Natoque phasellus lobortis mattis cursus faucibus hac proin risus. Turpis phasellus massa ullamcorper volutpat. Ornare commodo non integer fermentum nisi, morbi id. Vel tortor mauris feugiat amet, maecenas facilisis risus, in faucibus. Vestibulum ullamcorper fames eget enim diam fames faucibus duis ac. Aliquam non tellus semper in dignissim nascetur venenatis lacus.

// Lectus vel non varius interdum vel tellus sed mattis. Sit laoreet auctor arcu mauris tincidunt sociis tristique pharetra neque. Aliquam pharetra elementum nisl sapien. Erat nisl morbi eu dolor in. Sapien ut lacus dui libero morbi tristique.

// Sit praesent mi, dolor, magna in pellentesque sollicitudin odio sed. Sit nibh aliquam enim ipsum lectus sem fermentum congue velit. Purus habitant odio in morbi aliquet velit pulvinar. Facilisis ut amet interdum pretium. Fames pretium eget orci facilisis mattis est libero facilisis ullamcorper. Est auctor amet egestas risus libero et. Auctor faucibus sit id fringilla vitae. Ac volutpat sodales tristique ut netus turpis.
// ''';
//   static const String email = "Email";
//   static const String profileEmail = "Sami964@gmail.com";
//   static const String save = "Save";

//   static const String language = "Language";
//   static const String english = "English";
//   static const String arabic = "Arabic";

//   static const String contactUs = "Contact Us";

//   static const String search = "Search";
  static const String searchIcon = "assets/Icons/Search.svg";

//   static const String helpDescription = "Tell us how we can help you";
//   static const String titleDescription =
//       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus id tellus.";
//   static const String send = "Send";
  // static const String or = "Or";
  static const String callIcon = "assets/Icons/call.svg";
//   static const String serviceNumber = "+201015881141";
  static const String googleIcon = "assets/Icons/google.svg";
//   static const String serviceEmail = "awsabry2000@gmail.com";

  static const String startYourTraining = "assets/Images/StartYourTraining.png";
  static const String startYourTraining2 =
      "assets/Images/StartYourTraining2.png";
  static const String startYourTraining3 = "assets/Images/startTraining.png";

  static const String workOutPlanAppBar = "assets/Images/WorkOutPlanAppBar.png";
  static const String startTrainingContainer =
      "assets/Images/StartTrainingContainer.png";
  static const String startYour = "Start Your";
  static const String training = "Training";
  static const String today = "Today";
//   static const String workOutPlanBeginner = "Workout plan ( Beginner )";
//   static const String fullBodyWorkOut = "Full body workout";
//   static const String days30 = "Days 30";
//   static const String workOutPlanBeginnerDescription =
//       "Lose belly fat, get ripped abs in just 4 weeks with this effcient plan. Its also helps pump ups arm, strengthen your back & shoulders. No equipment needed";
//   static const String level = "Level";
//   static const String beginner = "Beginner";
//   static const String days = "Days";
//   static const String number30 = "30";
//   static const String number10WithBracket = "(10)";
//   static const String focusArea = "Focus Area";
//   static const String chest = "Chest";

  static const List<String> weeks = [
    "First Week",
    "Second Week",
    "Third Week",
    "Fourth Week"
  ];
  static const List<String> arabicWeeks = [
    "الاسبوع الاول",
    "الاسبوع الثانى",
    "الاسبوع الثالث",
    "الاسبوع الرابع",
  ];
  static const String day1 = "Day 1";
  static const String day2 = "Day 2";
  static const String day3 = "Day 3";
  static const String day4 = "Day 4";
  static const String day5 = "Day 5";
  static const String day6 = "Day 6";

//   static const String day567 = "Day 6,7";
  static const String dumble = "assets/Images/dumbell 1.png";
//   static const String minutes5 = "5 Min";
//   static const String minutes10 = "10 Min";
//   static const String startYourGoal = "Start Your Goal";
//   static const String off = "Off";
  static const String startNow = "Start Now";
  static const String exerceisesImageBackground = "assets/Images/Exercises.png";
//   static const String bodyBuilding = "Body Building";
//   static const String exercises = "Exercises";
  static const String jumbJacksExercise = "assets/Images/JumpJacks.png";
//   static const String jumbJacks = "Jumping Jacks";
//   static const String seconds20 = "00 : 20";
//   static const String myPlanForToday = "My Plan For Today";
//   static const String oneSevenComplete = "1/7 Complete";
//   static const String precentatgeSign = "%";
  static List<String> nameOfActivities = [
    "Progress",
    "Weeks",
    "Days",
    "Workouts"
  ];
  static List<String> arabicNameOfActivities = [
    "التقدم",
    "الاسابيع",
    "الايام",
    "التمارين"
  ];
  static const List<Color> colorsOfSliderActivities = [
    Color(0xFFF6A821),
    Color(0xFF28F215),
    Color(0xFF454AC8),
    Color(0xFF45ACFF)
  ];
  static const List<Color> colorsOfContainerActivities = [
    Color.fromRGBO(246, 168, 33, 0.1),
    Color.fromRGBO(40, 242, 21, 0.1),
    Color.fromRGBO(69, 172, 255, 0.1),
    Color.fromRGBO(118, 123, 244, 0.1),
  ];
//   static const String sixHrHours = "6 hr Hours";
  static const double fifty = 40;
//   static const String plans = "Plans";
//   static bool isSubscribed = false;
//   static String accontIsntSubscribed = "This account isn't subscribed yet";
//   static String validCredential = "Please put your right credentails";
//   static String validPassword = "Please put your right password";

  static String workOutPlanBeginnerSubscribtionImage =
      "assets/Images/WorkOutPlanBeginnerSubscribtion.png";
//   static String workOutPlan = "Workout plan";
  static List<String> workOutPlanBeginnerSubscribtionDescription = [
    "Cardio",
    "Exercises",
    "sets",
    "reps",
    "rest time",
    "video link"
  ];
//   static const String monthly = "Monthly";
//   static const String monthlyPriceSubscription = '\$9.99/m';
//   static const String subscribeNow = "Subscribe  Now";
//   static const String seeAll = "See all";
//   static const String exercise1 = "Exercise 1";
  static String fireCallories = "assets/Images/CalloriesFire.svg";
//   static const String callories120 = "120 cal";
  static const String playArrowIcon = "assets/Icons/PlayArrowIcon.svg";
//   static const String warmUp = "warm up";
//   static const String exerciseOneOverTen = "Exercises 1/10";
//   static const String weight = "Weight";
  static int weightNumberExercise = 15;
}
