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
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Switch.adaptive(
                        value: state.isSwitched!,
                        onChanged: (value) {
                          context
                              .read<SwitchBloc>()
                              .add(EnableOrDisableEvent(isEnable: value));
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                        height: 200,
                        color: Colors.red.withOpacity(state.slider!)),
                    Slider(
                      value: state.slider!,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(SliderEvent(slider: value));
                      },
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
