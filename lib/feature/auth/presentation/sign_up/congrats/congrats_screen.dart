import '../../../barrel.dart';

class CongratsScreen extends StatefulWidget {
  const CongratsScreen({super.key});

  @override
  State<CongratsScreen> createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/splash1_background.png"),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 26.h),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Image.asset(fit: BoxFit.contain, "assets/icons/congrats_icon.png"),
                  ),
                ),
                SizedBox(height: 3.h),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    "Congrats!",
                    style: GoogleFonts.sourceSans3(
                      color: AppColors.darkPink,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    "Your profile is ready to use",
                    style: AppTextStyles.appBarBottomTextStyle.copyWith(
                      fontSize: 18.sp
                    ),
                  ),
                ),
                SizedBox(height: 24.h), // Replaced Spacer() with fixed SizedBox
                SlideTransition(
                  position: _slideAnimation,
                  child: MainButton(
                      color1: AppColors.pink,
                      color2: AppColors.darkPink,
                      text: "Go to Sign In",
                      onPressed: (){
                        context.go('/sign-in');
                      },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
