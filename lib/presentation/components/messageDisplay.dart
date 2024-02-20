import 'package:blood_donation/presentation/resource_data/color_manager.dart';
import 'package:blood_donation/presentation/resource_data/style_manager.dart';
import 'package:blood_donation/presentation/resource_data/values_managers.dart';
import 'package:flutter/cupertino.dart';

class MessageDisplayWidget extends StatelessWidget {
  const MessageDisplayWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: getRegularStyle(
                color: ColorManager.black, fontSize: AppSize.s24),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
