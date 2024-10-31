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
