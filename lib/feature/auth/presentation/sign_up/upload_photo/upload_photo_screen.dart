import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foode_delivery/feature/auth/presentation/bloc/auth_bloc.dart';

import '../../../barrel.dart';
import 'barrel.dart';

class UploadPhotoScreen extends StatefulWidget {
  final String userId;
  const UploadPhotoScreen({super.key, required this.userId});

  @override
  State<UploadPhotoScreen> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();


  Future<void> _pickImage(ImageSource source)async{
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Future<void> handleUploadPhoto()async {
    if (_imageFile != null) {
      try {
        context.read<AuthBloc>().add(
          UpdateProfileImageEvent(
              userId: widget.userId
          )
        );
        context.go('/sign-up/fill-in-bio/${widget.userId}/payment-method/upload-photo/set-location');
      } catch (e) {
        CommonMethods.showSnackBar(
            context, "Profil rasmi saqlashda xatolik: ${e.toString()}");
      }
    }else {
      CommonMethods.showSnackBar(context, "Foydalanuvchi topilmadi. Qaytadan ro'yxatdan o'ting.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonMethods.customAppBar(
        context: context,
        onPressed: () {
          context.pop();
        },
        title: "Upload your photo",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
        child: Column(
          children: [
            Text(
                AppStrings.securityText,
                style: AppTextStyles.appBarBottomTextStyle
            ),
            SizedBox(height: 3.h),
            _imageFile == null
                ? Column(
                    children: [
                      SetImageLocationCard(
                        icon: Icons.camera_alt,
                        text: "Take photo",
                        onPressed: () => _pickImage(ImageSource.camera),
                      ),
                      SizedBox(height: 3.h),
                      SetImageLocationCard(
                          icon: Icons.folder,
                          text: "From gallery",
                          onPressed: () => _pickImage(ImageSource.gallery)
                      ),
                    ],
                  )
                : Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 30.w,
                          backgroundImage: FileImage(File(_imageFile!.path)),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => _pickImage(ImageSource.gallery),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.pink,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 4.w,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            Spacer(),
            MainButton(
              color1: _imageFile == null ? AppColors.pink.withAlpha(120) : AppColors.pink,
              color2: _imageFile == null ? AppColors.pink.withAlpha(120) : AppColors.darkPink,
              text: "Next",
              onPressed: () async {
                handleUploadPhoto();
                }
            )
          ],
        ),
      ),
    );
  }
}


