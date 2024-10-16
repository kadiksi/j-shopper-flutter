// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(name) => "Здравствуйте, ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Продолжить"),
        "commit_all_orders":
            MessageLookupByLibrary.simpleMessage("Принять все заказы"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "enter_code_password": MessageLookupByLibrary.simpleMessage(
            "Введите код-пароль для входа"),
        "enter_phone_number_and_password": MessageLookupByLibrary.simpleMessage(
            "Введите ваш номер телефона и пароль"),
        "history": MessageLookupByLibrary.simpleMessage("История"),
        "kazakh": MessageLookupByLibrary.simpleMessage("Қазақша"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "notifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
        "orders": MessageLookupByLibrary.simpleMessage("Заказы"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
        "russian": MessageLookupByLibrary.simpleMessage("Русский"),
        "scan_qr": MessageLookupByLibrary.simpleMessage("Скан QR"),
        "test": MessageLookupByLibrary.simpleMessage("Тест"),
        "username": MessageLookupByLibrary.simpleMessage("username"),
        "welcome_name": m0
      };
}
