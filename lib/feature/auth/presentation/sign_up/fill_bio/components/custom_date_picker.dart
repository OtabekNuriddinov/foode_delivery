import 'package:intl/intl.dart';
import '../../../../barrel.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime) onChanged;

  const CustomDatePicker({super.key, required this.onChanged});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.4,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(5.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5.h),
          border: Border.all(color: AppColors.textFieldBackground),
        ),
        child: ListTile(
          title: Text(
            selectedDate != null
                ? DateFormat.yMMMd().format(selectedDate!)
                : "Select Date", style: TextStyle(
             color: selectedDate != null ? AppColors.black:AppColors.greyText, fontSize: 16.sp
          ),
          ),
          trailing: IconButton(
            onPressed: () async {
              DateTime now = DateTime.now();
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDate ?? now,
                firstDate: DateTime(2000),
                lastDate: DateTime(now.year + 10),

                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: AppColors.darkPink,
                        onPrimary: Colors.white,
                        onSurface: AppColors.black,
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.darkPink,
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (picked != null) {
                setState(() {
                  selectedDate = picked;
                });
                widget.onChanged(picked);
              }
            },
            icon: Icon(Icons.calendar_month_outlined),
          ),

        ),
      ),
    );
  }
}
