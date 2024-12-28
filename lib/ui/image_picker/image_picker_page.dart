import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/bloc/image_picker/image_picker_bloc.dart';
import 'package:testing_project/bloc/image_picker/image_picker_event.dart';
import 'package:testing_project/bloc/image_picker/image_picker_state.dart';

class ImagePickerPage extends StatelessWidget {
  const ImagePickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            return IconButton(onPressed: () => context.read<ImagePickerBloc>().add(ImagePickWithGallary()), icon: state.nid == null ? const Icon(Icons.image) : Image(image: FileImage(File(state.nid!.path))));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log(context.read<ImagePickerBloc>().state.nid?.path ?? "Error");
        },
      ),
    );
  }
}
