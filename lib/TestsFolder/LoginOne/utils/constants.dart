/*
 * Copyright 2018 Harsh Sharma
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

///////////////////////////////////////////////////////////////////////////////
class APIConstants {
  static const String OCTET_STREAM_ENCODING = "application/octet-stream";
  static const String API_BASE_URL = "https://hafinse.000webhostapp.com";
}

///////////////////////////////////////////////////////////////////////////////
class APIOperations {
  static const String LOGIN = "login";
  static const String REGISTER = "register";
  static const String CHANGE_PASSWORD = "chgPass";
  static const String SUCCESS = "success";
  static const String FAILURE = "failure";
}

///////////////////////////////////////////////////////////////////////////////
class EventConstants {
  static const int NO_INTERNET_CONNECTION = 0;

///////////////////////////////////////////////////////////////////////////////
  static const int LOGIN_USER_SUCCESSFUL = 500;
  static const int LOGIN_USER_UN_SUCCESSFUL = 501;

///////////////////////////////////////////////////////////////////////////////
  static const int USER_REGISTRATION_SUCCESSFUL = 502;
  static const int USER_REGISTRATION_UN_SUCCESSFUL = 503;
  static const int USER_ALREADY_REGISTERED = 504;

///////////////////////////////////////////////////////////////////////////////
  static const int CHANGE_PASSWORD_SUCCESSFUL = 505;
  static const int CHANGE_PASSWORD_UN_SUCCESSFUL = 506;
  static const int INVALID_OLD_PASSWORD = 507;
///////////////////////////////////////////////////////////////////////////////
}

///////////////////////////////////////////////////////////////////////////////
class APIResponseCode {
  static const int SC_OK = 200;
}
///////////////////////////////////////////////////////////////////////////////

class SharedPreferenceKeys {
  static const String IS_USER_LOGGED_IN = "IS_USER_LOGGED_IN";
  static const String USER = "USER";
}

///////////////////////////////////////////////////////////////////////////////
class ProgressDialogTitles {
  static const String IN_PROGRESS = "جاري التحميل...";
  static const String USER_LOG_IN = "تسجيل الدخول...";
  static const String USER_CHANGE_PASSWORD = "جاري التغير...";
  static const String USER_REGISTER = "جاري التسجيل...";
}

///////////////////////////////////////////////////////////////////////////////
class SnackBarText {
  static const String NO_INTERNET_CONNECTION = "لا يوجد إتصال إنترنت";
  static const String LOGIN_SUCCESSFUL = "تم تسجيل الدخول";
  static const String LOGIN_UN_SUCCESSFUL = "لم يتم تسجيل الدخول";
  static const String CHANGE_PASSWORD_SUCCESSFUL = "تم تغير كلمة المرور";
  static const String CHANGE_PASSWORD_UN_SUCCESSFUL = "لم يتم تغير كلمة المرور";
  static const String REGISTER_SUCCESSFUL = "تمت عملية التسجيل";
  static const String REGISTER_UN_SUCCESSFUL = "لم تتم عملية التسجيل";
  static const String USER_ALREADY_REGISTERED = "المستخدم مسجل بالفعل";
  static const String ENTER_PASS = "يرجى إدخال كلمة المرور";
  static const String ENTER_NEW_PASS = "يرجى إدخال كلمة مرور جديدة";
  static const String ENTER_OLD_PASS = "يرجى إدخال كلمة المرور القديمة";
  static const String ENTER_EMAIL = "يرجى إدخال البريد الإلكتروني";
  static const String ENTER_VALID_MAIL = "يرجى إدخال بريد إلكتروني صالح";
  static const String ENTER_NAME = "يرجى إدخال الإسم";
  static const String INVALID_OLD_PASSWORD = "كلمة مرور قديمة";
}

///////////////////////////////////////////////////////////////////////////////
class Texts {
  static const String REGISTER_NOW = "لا تملك حساب ؟ سجل الأن !";
  static const String LOGIN_NOW = "هل أنت مسجل بالفعل ؟ دخول";
  static const String LOGIN = "دخول";
  static const String REGISTER = "تسجيل";
  static const String PASSWORD = "كلمة المرور";
  static const String OLD_PASSWORD = "كلمة المرور السابقة";
  static const String NEW_PASSWORD = "كلمةالمرور الجديدة";
  static const String CHANGE_PASSWORD = "تغير كلمة المرور";
  static const String LOGOUT = "تسجيل خروج";
  static const String EMAIL = "البريد الإلكتروني";
  static const String NAME = "الإسم";
}
///////////////////////////////////////////////////////////////////////////////
