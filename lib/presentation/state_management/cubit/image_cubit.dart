import 'package:dr_on_call/presentation/state_management/cubit/image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitialState());

  Future<void> pickImage(ImageSource source) async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      XFile? file = await imagePicker.pickImage(source: source);
      if (file != null) {
        emit(ImageLoadedState(imageFile: file));
      } else {
        emit(ImageErrorState(errorMessage: 'No Image Selected'));
      }
    } catch (e) {
      emit(ImageErrorState(errorMessage: e.toString()));
    }
  }
}
