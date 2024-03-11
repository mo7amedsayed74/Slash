import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/constants.dart';
import 'package:slash/cubit/details_item_cubit.dart';
import 'package:slash/cubit/details_item_state.dart';
import 'package:slash/data/dummy_data.dart';
import 'package:slash/presentation/screens/cart_screen.dart';

///bottom sheet is fixed in end of screen
class BuildBottomSheet extends StatelessWidget {
  final String textButton;

  const BuildBottomSheet({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    TextTheme font = Theme.of(context).textTheme;

    return BlocConsumer<DetailsItemCubit, DetailsItemState>(
      builder: (context, state) {
        var cubit = context.read<DetailsItemCubit>();
        return Container(
          width: double.infinity,
          height: 70.h,
          color: ColorConstance.unselectedColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total price',
                      style: font.bodySmall!.copyWith(
                        fontSize: 10.sp,
                        color: Colors.white54,
                      ),
                    ),
                    Text(
                      cubit.totalPrice != -1
                          ? cubit.totalPrice.toStringAsFixed(2)
                          : (product.variations[cubit.colorSelected].price +
                                  product.variations[cubit.sizeSelected].price +
                                  product
                                      .variations[cubit.materialSelected].price)
                              .toStringAsFixed(2),
                      style: font.bodySmall!.copyWith(fontSize: 16.sp),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shadowColor: Colors.white,
                    backgroundColor: ColorConstance.selectedColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    minimumSize: Size(180.w, 50.h),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const CartScreen();
                      },
                    ));
                  },
                  child: Text(
                    textButton,
                    style: font.bodySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
