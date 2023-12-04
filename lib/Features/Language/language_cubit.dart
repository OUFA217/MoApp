import 'package:fitzapp/Features/Language/language_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<InitialLanguageStates> {
  LanguageCubit() : super(SuperLangaugeStates());
  static LanguageCubit get(context) => BlocProvider.of(context);
  bool english = true;
  bool arabic = true;

  void isEnglish() async {
    english = !english;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("Language", english);
    getLanguageFromSharedPreference();
    emit(IsEnglishState());
  }

  void getLanguageFromSharedPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    english = sharedPreferences.getBool("Language") != null
        ? sharedPreferences.getBool("Language")!
        : true;
    emit(GetLanguageSharedPreferenceState());
  }

  void setEnglishFalse() async {
    english = false;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("Language", english);
    emit(SetEnglishState());
    getLanguageFromSharedPreference();
  }

  void setEnglishTrue() async {
    english = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("Language", english);
    emit(SetEnglishState());
    getLanguageFromSharedPreference();
  }
}
