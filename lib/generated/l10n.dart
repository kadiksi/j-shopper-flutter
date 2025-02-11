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

  /// `test`
  String get test {
    return Intl.message(
      'test',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `Қазақша`
  String get kazakh {
    return Intl.message(
      'Қазақша',
      name: 'kazakh',
      desc: '',
      args: [],
    );
  }

  /// `Русский`
  String get russian {
    return Intl.message(
      'Русский',
      name: 'russian',
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

  /// `username`
  String get username {
    return Intl.message(
      'username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Введите ваш номер телефона и пароль`
  String get enter_phone_number_and_password {
    return Intl.message(
      'Введите ваш номер телефона и пароль',
      name: 'enter_phone_number_and_password',
      desc: '',
      args: [],
    );
  }

  /// `Продолжить`
  String get add {
    return Intl.message(
      'Продолжить',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Здравствуйте, {name}`
  String welcome_name(Object name) {
    return Intl.message(
      'Здравствуйте, $name',
      name: 'welcome_name',
      desc: '',
      args: [name],
    );
  }

  /// `Введите код-пароль для входа`
  String get enter_code_password {
    return Intl.message(
      'Введите код-пароль для входа',
      name: 'enter_code_password',
      desc: '',
      args: [],
    );
  }

  /// `Заказы`
  String get orders {
    return Intl.message(
      'Заказы',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `История`
  String get history {
    return Intl.message(
      'История',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Скан QR`
  String get scan_qr {
    return Intl.message(
      'Скан QR',
      name: 'scan_qr',
      desc: '',
      args: [],
    );
  }

  /// `Уведомления`
  String get notifications {
    return Intl.message(
      'Уведомления',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message(
      'Профиль',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Принять все заказы`
  String get commit_all_orders {
    return Intl.message(
      'Принять все заказы',
      name: 'commit_all_orders',
      desc: '',
      args: [],
    );
  }

  /// `{orderSource} позиции`
  String positions(Object orderSource) {
    return Intl.message(
      '$orderSource позиции',
      name: 'positions',
      desc: '',
      args: [orderSource],
    );
  }

  /// `Плановая дата  {createdDate}`
  String createddate(Object createdDate) {
    return Intl.message(
      'Плановая дата  $createdDate',
      name: 'createddate',
      desc: '',
      args: [createdDate],
    );
  }

  /// `Заявка № {id}`
  String order_number(Object id) {
    return Intl.message(
      'Заявка № $id',
      name: 'order_number',
      desc: '',
      args: [id],
    );
  }

  /// `Принять заказ`
  String get accept_orders {
    return Intl.message(
      'Принять заказ',
      name: 'accept_orders',
      desc: '',
      args: [],
    );
  }

  /// `Позвонить`
  String get call {
    return Intl.message(
      'Позвонить',
      name: 'call',
      desc: '',
      args: [],
    );
  }

  /// `Отсутсвует`
  String get not_exist {
    return Intl.message(
      'Отсутсвует',
      name: 'not_exist',
      desc: '',
      args: [],
    );
  }

  /// `Принять отмеченные`
  String get accept_selected {
    return Intl.message(
      'Принять отмеченные',
      name: 'accept_selected',
      desc: '',
      args: [],
    );
  }

  /// `Отмена`
  String get cancel {
    return Intl.message(
      'Отмена',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Заменить товар`
  String get replace_product {
    return Intl.message(
      'Заменить товар',
      name: 'replace_product',
      desc: '',
      args: [],
    );
  }

  /// `Собрано`
  String get collected {
    return Intl.message(
      'Собрано',
      name: 'collected',
      desc: '',
      args: [],
    );
  }

  /// `Итого:`
  String get total {
    return Intl.message(
      'Итого:',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Количество`
  String get quantity {
    return Intl.message(
      'Количество',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Товар №${id}`
  String product_id(Object id) {
    return Intl.message(
      'Товар №\$$id',
      name: 'product_id',
      desc: '',
      args: [id],
    );
  }

  /// `Замена товара`
  String get change_product {
    return Intl.message(
      'Замена товара',
      name: 'change_product',
      desc: '',
      args: [],
    );
  }

  /// `Введите название товара`
  String get enter_product_name {
    return Intl.message(
      'Введите название товара',
      name: 'enter_product_name',
      desc: '',
      args: [],
    );
  }

  /// `Вы действительно хотите заменить товар?`
  String get replace_product_confirmation_question {
    return Intl.message(
      'Вы действительно хотите заменить товар?',
      name: 'replace_product_confirmation_question',
      desc: '',
      args: [],
    );
  }

  /// `Замена товара приведет к доплате со стороны покупателя`
  String get Replacement_of_good_will_result {
    return Intl.message(
      'Замена товара приведет к доплате со стороны покупателя',
      name: 'Replacement_of_good_will_result',
      desc: '',
      args: [],
    );
  }

  /// `Добавить товар`
  String get add_product {
    return Intl.message(
      'Добавить товар',
      name: 'add_product',
      desc: '',
      args: [],
    );
  }

  /// `Отменить заказ`
  String get cancel_order {
    return Intl.message(
      'Отменить заказ',
      name: 'cancel_order',
      desc: '',
      args: [],
    );
  }

  /// `Вернуть заказ в новые`
  String get return_order {
    return Intl.message(
      'Вернуть заказ в новые',
      name: 'return_order',
      desc: '',
      args: [],
    );
  }

  /// `Передать на доставку`
  String get send_to_delivery {
    return Intl.message(
      'Передать на доставку',
      name: 'send_to_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Выбрать`
  String get choose {
    return Intl.message(
      'Выбрать',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `Выберите причину отмены`
  String get select_cancelation_reason {
    return Intl.message(
      'Выберите причину отмены',
      name: 'select_cancelation_reason',
      desc: '',
      args: [],
    );
  }

  /// `Вернуть заказ в новые?`
  String get return_order_question {
    return Intl.message(
      'Вернуть заказ в новые?',
      name: 'return_order_question',
      desc: '',
      args: [],
    );
  }

  /// `Заказ сможет обработать другой магазин из вашей сети`
  String get return_order_tip {
    return Intl.message(
      'Заказ сможет обработать другой магазин из вашей сети',
      name: 'return_order_tip',
      desc: '',
      args: [],
    );
  }

  /// `Отменить действие будет невозможно`
  String get cant_cancel_action {
    return Intl.message(
      'Отменить действие будет невозможно',
      name: 'cant_cancel_action',
      desc: '',
      args: [],
    );
  }

  /// `Вы действительно хотите добавить товар?`
  String get add_product_question {
    return Intl.message(
      'Вы действительно хотите добавить товар?',
      name: 'add_product_question',
      desc: '',
      args: [],
    );
  }

  /// `Принятые`
  String get accepted {
    return Intl.message(
      'Принятые',
      name: 'accepted',
      desc: '',
      args: [],
    );
  }

  /// `Новые`
  String get new_orders {
    return Intl.message(
      'Новые',
      name: 'new_orders',
      desc: '',
      args: [],
    );
  }

  /// `Активные`
  String get active {
    return Intl.message(
      'Активные',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Завершенные`
  String get completed {
    return Intl.message(
      'Завершенные',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Поддержка`
  String get support {
    return Intl.message(
      'Поддержка',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Позвонить`
  String get calll {
    return Intl.message(
      'Позвонить',
      name: 'calll',
      desc: '',
      args: [],
    );
  }

  /// `Общие`
  String get general {
    return Intl.message(
      'Общие',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Язык приложения`
  String get application_name {
    return Intl.message(
      'Язык приложения',
      name: 'application_name',
      desc: '',
      args: [],
    );
  }

  /// `Push-уведомления`
  String get push_notificaton {
    return Intl.message(
      'Push-уведомления',
      name: 'push_notificaton',
      desc: '',
      args: [],
    );
  }

  /// `Работа в фоне`
  String get fone_work {
    return Intl.message(
      'Работа в фоне',
      name: 'fone_work',
      desc: '',
      args: [],
    );
  }

  /// `Работа при энергосбережении`
  String get enegy_efficiency_work {
    return Intl.message(
      'Работа при энергосбережении',
      name: 'enegy_efficiency_work',
      desc: '',
      args: [],
    );
  }

  /// `Код пароль`
  String get code_pass {
    return Intl.message(
      'Код пароль',
      name: 'code_pass',
      desc: '',
      args: [],
    );
  }

  /// `Вход по Face ID`
  String get face_id_enter {
    return Intl.message(
      'Вход по Face ID',
      name: 'face_id_enter',
      desc: '',
      args: [],
    );
  }

  /// `Вход по Face ID`
  String get return_initial_product {
    return Intl.message(
      'Вернуть исходный товар',
      name: 'return_initial_product',
      desc: '',
      args: [],
    );
  }

  /// `Язык приложения`
  String get app_language {
    return Intl.message(
      'Язык приложения',
      name: 'app_language',
      desc: '',
      args: [],
    );
  }

  /// `Собрать`
  String get collect {
    return Intl.message(
      'Собрать',
      name: 'collect',
      desc: '',
      args: [],
    );
  }

  /// `Отсутствует`
  String get absent {
    return Intl.message(
      'Отсутствует',
      name: 'absent',
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
      Locale.fromSubtags(languageCode: 'kk'),
      Locale.fromSubtags(languageCode: 'ru'),
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
