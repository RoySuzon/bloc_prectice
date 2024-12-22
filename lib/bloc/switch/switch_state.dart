// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool? isSwitched;
  final double? slider;

  const SwitchState({this.isSwitched = false, this.slider = 0.0});

  @override
  List<Object?> get props => [isSwitched, slider];

  SwitchState copyWith({
    bool? isSwitched,
    double? slider,
  }) {
    return SwitchState(
      isSwitched: isSwitched ?? this.isSwitched,
      slider: slider ?? this.slider,
    );
  }
}
