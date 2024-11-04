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

  static String m0(createdDate) => "Плановая дата  ${createdDate}";

  static String m1(id) => "Заявка № ${id}";

  static String m2(orderSource) => "${orderSource} позиции";

  static String m3(id) => "Товар №\$${id}";

  static String m4(name) => "Здравствуйте, ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Replacement_of_good_will_result": MessageLookupByLibrary.simpleMessage(
            "Замена товара приведет к доплате со стороны покупателя"),
        "accept_orders": MessageLookupByLibrary.simpleMessage("Принять заказ"),
        "accept_selected":
            MessageLookupByLibrary.simpleMessage("Принять отмеченные"),
        "add": MessageLookupByLibrary.simpleMessage("Продолжить"),
        "add_product": MessageLookupByLibrary.simpleMessage("Добавить товар"),
        "add_product_question": MessageLookupByLibrary.simpleMessage(
            "Вы действительно хотите добавить товар?"),
        "call": MessageLookupByLibrary.simpleMessage("Позвонить"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "cancel_order": MessageLookupByLibrary.simpleMessage("Отменить заказ"),
        "cant_cancel_action": MessageLookupByLibrary.simpleMessage(
            "Отменить действие будет невозможно"),
        "change_product": MessageLookupByLibrary.simpleMessage("Замена товара"),
        "choose": MessageLookupByLibrary.simpleMessage("Выбрать"),
        "collected": MessageLookupByLibrary.simpleMessage("Собрано"),
        "commit_all_orders":
            MessageLookupByLibrary.simpleMessage("Принять все заказы"),
        "createddate": m0,
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "enter_code_password": MessageLookupByLibrary.simpleMessage(
            "Введите код-пароль для входа"),
        "enter_phone_number_and_password": MessageLookupByLibrary.simpleMessage(
            "Введите ваш номер телефона и пароль"),
        "enter_product_name":
            MessageLookupByLibrary.simpleMessage("Введите название товара"),
        "history": MessageLookupByLibrary.simpleMessage("История"),
        "kazakh": MessageLookupByLibrary.simpleMessage("Қазақша"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "not_exist": MessageLookupByLibrary.simpleMessage("Отсутсвует"),
        "notifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
        "order_number": m1,
        "orders": MessageLookupByLibrary.simpleMessage("Заказы"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "positions": m2,
        "product_id": m3,
        "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
        "quantity": MessageLookupByLibrary.simpleMessage("Количество"),
        "replace_product":
            MessageLookupByLibrary.simpleMessage("Заменить товар"),
        "replace_product_confirmation_question":
            MessageLookupByLibrary.simpleMessage(
                "Вы действительно хотите заменить товар?"),
        "return_order":
            MessageLookupByLibrary.simpleMessage("Вернуть заказ в новые"),
        "return_order_question":
            MessageLookupByLibrary.simpleMessage("Вернуть заказ в новые?"),
        "return_order_tip": MessageLookupByLibrary.simpleMessage(
            "Заказ сможет обработать другой магазин из вашей сети"),
        "russian": MessageLookupByLibrary.simpleMessage("Русский"),
        "scan_qr": MessageLookupByLibrary.simpleMessage("Скан QR"),
        "select_cancelation_reason":
            MessageLookupByLibrary.simpleMessage("Выберите причину отмены"),
        "send_to_delivery":
            MessageLookupByLibrary.simpleMessage("Передать на доставку"),
        "test": MessageLookupByLibrary.simpleMessage("Тест"),
        "total": MessageLookupByLibrary.simpleMessage("Итого:"),
        "username": MessageLookupByLibrary.simpleMessage("username"),
        "welcome_name": m4
      };
}
