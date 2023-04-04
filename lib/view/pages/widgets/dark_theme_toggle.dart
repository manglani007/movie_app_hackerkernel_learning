import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/dark_mode/dark_mode_bloc.dart';

class DarkThemeToggle extends StatelessWidget {
  const DarkThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeBloc, DarkModeState>(
      builder: (context, state) {
        if (state is DarkModeEnabled) {
          return Switch(
            onChanged: (bool value) {
              if (value) {
                BlocProvider.of<DarkModeBloc>(context)
                    .add(DarkModeEnableEvent());
              } else {
                BlocProvider.of<DarkModeBloc>(context)
                    .add(DarkModeDisableEvent());
              }
            },
            value: true,
          );
        } else {
          return Switch(
            onChanged: (bool value) {
              if (value) {
                BlocProvider.of<DarkModeBloc>(context)
                    .add(DarkModeEnableEvent());
              } else {
                BlocProvider.of<DarkModeBloc>(context)
                    .add(DarkModeDisableEvent());
              }
            },
            value: false,
          );
        }
      },
    );
  }
}
