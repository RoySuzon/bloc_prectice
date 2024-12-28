import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/bloc/switch/switch_bloc.dart';
import 'package:testing_project/bloc/switch/switch_event.dart';
import 'package:testing_project/bloc/switch/switch_state.dart';

class SwitchPage extends StatelessWidget {
  const SwitchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous.isSwitched != current.isSwitched,
                  builder: (context, state) {
                    log("Switch Build");
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Switch.adaptive(
                        value: state.isSwitched,
                        onChanged: (value) => context.read<SwitchBloc>().add(EnableOrDisableEvent(isEnable: value)),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous.slider != current.slider,
                  builder: (context, state) {
                    log("Slider Build");
                    return Container(height: 200, color: Colors.red.withOpacity(state.slider));
                  },
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous.slider != current.slider,
                  builder: (context, state) {
                    log("Slider Build");
                    return Slider(
                      value: state.slider,
                      onChanged: (value) => context.read<SwitchBloc>().add(SliderEvent(slider: value)),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
