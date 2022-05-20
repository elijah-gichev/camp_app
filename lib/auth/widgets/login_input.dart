import 'package:camp_app/auth/widgets/input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginInput extends StatelessWidget {
  final TextEditingController _phoneNumberController;

  const LoginInput({
    Key? key,
    required TextEditingController phoneNumberController,
  })  : _phoneNumberController = phoneNumberController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345.w,
      child: InputForm(
        title: 'Phone Number',
        textField: Align(
          alignment: Alignment.centerLeft,
          child: TextField(
            controller: _phoneNumberController,
            maxLength: 14,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              suffixIconConstraints: BoxConstraints.tight(const Size(40, 20)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0.r),
                borderSide: BorderSide.none,
              ),
              counterText: '',
              prefixText: '',
            ),
            onChanged: (phone) {
              //context.read<LoginCubit>().phoneChanged(fullPhoneNumber);
            },
            keyboardType: TextInputType.number,
          ),
        ),
      ),
    );
  }
}
