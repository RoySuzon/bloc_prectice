// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerState extends Equatable {
  final XFile? nid;
  final XFile? nidBack;
  const ImagePickerState({
    this.nid,
    this.nidBack,
  });
  @override
  List<Object?> get props => [nid, nidBack];

  ImagePickerState copyWith({
    XFile? nid,
    XFile? nidBack,
  }) {
    return ImagePickerState(
      nid: nid ?? this.nid,
      nidBack: nidBack ?? this.nidBack,
    );
  }
}

class ClassName {}
