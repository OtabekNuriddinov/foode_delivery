import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../barrel.dart';
import '../../bloc/auth_bloc.dart';
import 'components/custom_date_picker.dart';
import 'components/gender_expansion_tile.dart';

class FillBioScreen extends StatefulWidget {
  final String userId;
  const FillBioScreen({super.key, required this.userId});

  @override
  State<FillBioScreen> createState() => _FillBioScreenState();
}

class _FillBioScreenState extends State<FillBioScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final _fullNameFocus = FocusNode();
  final _nickNameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _addressFocus = FocusNode();
  String? _selectedGender;
  DateTime? _selectedDate;

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _nickNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _fullNameFocus.dispose();
    _nickNameFocus.dispose();
    _phoneFocus.dispose();
    _addressFocus.dispose();
  }

  Future<void> handleFillBio() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedDate == null) {
        CommonMethods.showSnackBar(context, "Please select a date of birth.");
        return;
      }
      
      context.read<AuthBloc>().add(
        AuthSignUpStep2RequestedEvent(
          userId: widget.userId,
          fullName: _fullNameController.text,
          nickName: _nickNameController.text,
          phoneNumber: _phoneController.text,
          dateOfBirth: _selectedDate!,
          address: _addressController.text,
        )
      );
    } else {
      print("Form validation failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is AuthSignUpStep2Success) {
          Navigator.pop(context); // Close loading
          context.go('/sign-up/fill-in-bio/${widget.userId}/payment-method');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CommonMethods.customAppBar(
          context: context,
          onPressed: () {
            context.pop();
          },
          title: "Fill in your bio",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.securityText,
                    style: AppTextStyles.appBarBottomTextStyle
                  ),
                  SizedBox(height: 3.h),
                  LabelTextWithStar(text: "Full Name"),
                  SizedBox(height: 0.5.h),
                  MyTextField(
                      controller: _fullNameController,
                      hintText: "Full name",
                    focusNode: _fullNameFocus,
                    validator: Validation.fullName,
                  ),
                  SizedBox(height: 3.h),
                  LabelTextWithStar(text: "Nick Name"),
                  SizedBox(height: 0.5.h),
                  MyTextField(
                      controller: _nickNameController,
                      hintText: "Nick Name",
                    focusNode: _nickNameFocus,
                    validator: Validation.validateUserName,
                  ),
                  SizedBox(height: 3.h),
                  LabelTextWithStar(text: "Phone Number"),
                  SizedBox(height: 0.5.h),
                  MyTextField(
                      controller: _phoneController,
                      hintText: "Phone Number",
                    focusNode: _phoneFocus,
                    validator: Validation.validatePhoneNumber,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 3.h),
                  LabelTextWithStar(text: "Gender"),
                  SizedBox(height: 0.5.h),
                  GenderExpansionTile(
                      onChanged: (value){
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                  ),
                  SizedBox(height: 3.h),
                  LabelTextWithStar(text: "Date of Birth"),
                  SizedBox(height: 0.5.h),
                  CustomDatePicker(onChanged: (value){
                    setState(() {
                      _selectedDate = value;
                    });
                  }),
                  SizedBox(height: 3.h),
                  LabelTextWithStar(text: "Address"),
                  SizedBox(height: 0.5.h),
                  MyTextField(
                      controller: _addressController,
                      hintText: "Address",
                    focusNode: _addressFocus,
                    validator: Validation.validateAddress,
                  ),
                  SizedBox(height: 3.h),
                  MainButton(
                      color1: AppColors.pink,
                      color2: AppColors.darkPink,
                      text: "Next",
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                       final _formValid = _formKey.currentState?.validate()??false;

                        if (_selectedGender == null) {
                          CommonMethods.showSnackBar(context, "Please select a gender.");
                          return;
                        }

                        handleFillBio();
                      }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
