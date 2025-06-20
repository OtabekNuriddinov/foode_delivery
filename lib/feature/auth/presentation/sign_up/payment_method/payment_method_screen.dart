import '../../../barrel.dart';
import 'components/payment_card.dart';

class PaymentMethodScreen extends StatefulWidget {
  final String userId;
  const PaymentMethodScreen({super.key, required this.userId});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonMethods.customAppBar(
          context: context,
          onPressed: (){
            context.pop();
          },
          title: "Payment method"
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  AppStrings.securityText,
                  style: AppTextStyles.appBarBottomTextStyle
              ),
              SizedBox(height: 3.h),
              PaymentCard(
                currentIndex: 0,
                selectedIndex: _selectedIndex,
                imageUrl: "assets/icons/paypal.png",
                onPressed: (){
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
              SizedBox(height: 2.h),
              PaymentCard(
                currentIndex: 1,
                selectedIndex: _selectedIndex,
                imageUrl: "assets/icons/visa.png",
                onPressed: (){
                  setState(() {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  });
                },
              ),
              SizedBox(height: 2.h),
              PaymentCard(
                currentIndex: 2,
                selectedIndex: _selectedIndex,
                imageUrl: "assets/icons/pioneer.png",
                onPressed: (){
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
              ),
              Spacer(),
              MainButton(
                  color1: AppColors.pink,
                  color2: AppColors.darkPink,
                  text: "Next",
                  onPressed: (){
                    context.go('/sign-up/fill-in-bio/${widget.userId}/payment-method/upload-photo');
                  },
              )
            ],
          ),

      ),
    );
  }
}


