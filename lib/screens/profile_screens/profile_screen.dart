import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/blocks/profile/profile_bloc.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/repositories/profile/profile_abstarct_repository.dart';
import 'package:j_courier/screens/profile_screens/wingets/action_label.dart';
import 'package:j_courier/screens/profile_screens/wingets/common_widget.dart';
import 'package:j_courier/screens/profile_screens/wingets/support_button.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';
import 'package:j_courier/screens/widgets/errors/failed_request.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profileBloc = ProfileBloc(
    GetIt.I<ProfileAbstractRepository>(),
  );
  List<int> selectedItems = [];
  bool isSwitched = true;

  @override
  void initState() {
    _profileBloc.add(LoadProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _profileBloc.add(LoadProfile());
          return completer.future;
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          bloc: _profileBloc,
          builder: (context, state) {
            if (state is ProfileSuccess) {
              return Scaffold(
                body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.red,
                                child: Text('SMALL',
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${state.profile.companyInfoDto?.companyName}',
                                    style:
                                        theme.textTheme.labelMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  divider4,
                                  Text(
                                    '${state.profile.companyInfoDto?.companyAddress}',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.logout, color: Colors.grey),
                            ],
                          ),
                          divider24,
                          Text(
                            S.of(context).support,
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: Colors.grey),
                          ),
                          divider16,
                          Row(
                            children: [
                              Expanded(
                                child: SupportButton(
                                  icon: "assets/svg/settings/whatsup.svg",
                                  label: 'WhatsApp',
                                  onTap: () async {
                                    final url = Uri.parse(
                                        '${state.profile.supportInfo?.whatsApp}');
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url,
                                          mode: LaunchMode.externalApplication);
                                    } else {
                                      print('Could not launch WhatsApp');
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: SupportButton(
                                  icon: 'assets/svg/settings/call_phone.svg',
                                  label: S.of(context).call,
                                  onTap: () {
                                    // Add your Call action here
                                  },
                                ),
                              ),
                            ],
                          ),
                          divider24,
                          Text(
                            S.of(context).general,
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: Colors.grey),
                          ),
                          divider16,
                          Column(
                            children: [
                              SettingsWidget(
                                icon: 'assets/svg/settings/language.svg',
                                label: S.of(context).app_language,
                                trailingWdget: ActionLabelWidget(
                                    label: S.of(context).russian),
                                onTap: callback,
                              ),
                              divider8,
                              SettingsWidget(
                                icon: 'assets/svg/settings/push_icon.svg',
                                label: S.of(context).push_notificaton,
                                trailingWdget: Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  },
                                ),
                                onTap: callback,
                              ),
                              divider8,
                              SettingsWidget(
                                icon: 'assets/svg/settings/fone_work.svg',
                                label: S.of(context).fone_work,
                                trailingWdget: Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  },
                                ),
                                onTap: callback,
                              ),
                              divider8,
                              SettingsWidget(
                                icon:
                                    'assets/svg/settings/energy_efficiency.svg',
                                label: S.of(context).enegy_efficiency_work,
                                trailingWdget: Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  },
                                ),
                                onTap: callback,
                              ),
                            ],
                          ),
                          divider16,
                          Text(
                            S.of(context).support,
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: Colors.grey),
                          ),
                          divider16,
                          Column(children: [
                            SettingsWidget(
                              icon: 'assets/svg/settings/code_password.svg',
                              label: S.of(context).code_pass,
                              trailingWdget: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                  });
                                },
                              ),
                              onTap: callback,
                            ),
                            divider8,
                            SettingsWidget(
                              icon: 'assets/svg/settings/face_id.svg',
                              label: S.of(context).face_id_enter,
                              trailingWdget: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                  });
                                },
                              ),
                              onTap: callback,
                            ),
                            divider16,
                          ]),
                        ],
                      ),
                    )),
              );
            }
            if (state is ProfileFailure) {
              return FailedRequest(callback: callback);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void callback() {
    _profileBloc.add(LoadProfile());
  }
}
