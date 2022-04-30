import 'package:sriwijaya/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonNavigation extends StatelessWidget {
  const CustomButtonNavigation({
    Key? key,
    required this.imageUrl,
    required this.index,
  }) : super(key: key);

  final String imageUrl;

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: BlocBuilder<PageCubit, int>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Image.asset(
                imageUrl,
                height: 24,
                width: 24,
                color: state == index ? kPrimaryColor : kGreyColor,
              ), // i try to use context.read<PageCubit>().state but its not work. because you need to use watch
              Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                    color: state == index ? kPrimaryColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(18)),
              )
            ],
          );
        },
      ),
    );
  }
}
/*
actually, you can use watch or select instead of read to "listen" to state/object change.
read = read the state/object, not rebuild if Change,
watch = read the state/object, rebuild if change,
select = read a spesific member of object, rebuild if change
*/