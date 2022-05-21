import 'package:camp_app/core/constants/app_dimens.dart';
import 'package:camp_app/core/constants/routes.dart';
import 'package:camp_app/core/models/operation.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:camp_app/core/services/user_service.dart';
import 'package:camp_app/core/utils/date.dart';
import 'package:camp_app/core/widgets/appbar.dart';
import 'package:camp_app/core/widgets/button.dart';
import 'package:camp_app/core/widgets/show_snackbar.dart';
import 'package:camp_app/main.dart';
import 'package:camp_app/money/bloc/day_entry.dart';
import 'package:camp_app/money/services/operation_service.dart';
import 'package:camp_app/shifts/cubit/data_loading_cubit.dart';
import 'package:camp_app/shifts/models/activity.dart';

import 'package:camp_app/shifts/models/shift.dart';
import 'package:camp_app/shifts/wigdets/child_activity.dart';
import 'package:camp_app/shifts/wigdets/operation_view_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShiftScreen extends StatefulWidget {
  final Shift shift;
  final List<Operation> operations;
  const ShiftScreen(this.shift, this.operations, {Key? key}) : super(key: key);

  @override
  State<ShiftScreen> createState() => _ShiftScreenState();
}

class _ShiftScreenState extends State<ShiftScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OperationLoadingCubit>().loadData(getIt<UserService>().user!.id, widget.operations);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CampAppBar(
            text: widget.shift.title,
            onBackPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: 0.95.sw,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff4D5DFA).withOpacity(0.3),
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 3.0,
                )
              ],
            ),
            child: Column(
              children: [
                const Text(
                  'Санаторно-курортная книжка',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: 0.65.sw,
                  height: 45.h,
                  child: Button(
                    text: 'Открыть',
                    onPressed: () {},
                    bgColor: const Color(0xffEDEFFF),
                    textColor: const Color(0xff4D5DFA),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            width: 0.95.sw,
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Активность детей:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          BlocConsumer<OperationLoadingCubit, OperationLoadingState>(
            listener: (context, state) {
              if (state is DataLoadingFailure) {
                showSnackBar(context: context, message: state.msg);
              }
            },
            builder: (context, state) {
              if (state is DataLoadingDone) {
                return Expanded(
                  child: ListView(children: [
                    ...state.entries.map(
                      (entry) {
                        return DayShiftItem(entry);
                      },
                    ).toList()
                  ]),
                );
              }

              return const CircularProgressIndicator(
                color: Colors.amber,
              );
            },
          ),
        ],
      ),
    );
  }
}

class DayShiftItem extends StatelessWidget {
  final DayEntry entry;

  const DayShiftItem(this.entry, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (entry.operations.length * 110).h,
      width: 0.95.sw,
      child: Card(
        margin: const EdgeInsets.only(top: 4, bottom: 4),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        shadowColor: Color(0x33000000),
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entry.date.formatDate(),
                style: TextStyle(
                  fontSize: 15.h,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: entry.operations.length + (entry.activities?.length ?? 0),
                  itemBuilder: (context, index) {
                    if (index > (entry.operations.length - 1)) {
                      return ChildActivity(
                        activityName: entry.activities![index - entry.operations.length].activityName,
                        userName: entry.activities![index - entry.operations.length].userName,
                      );
                    }

                    return OperationViewWrapper(
                      operation: entry.operations[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 16.h,
                    );
                  },
                ),
              ),
              // OperationViewWrapper(
              //     operation: Operation.sample(
              //   getIt<UserService>().user!,
              // )),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
