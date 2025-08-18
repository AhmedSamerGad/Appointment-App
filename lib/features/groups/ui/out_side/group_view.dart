import 'package:appointments/core/thems/colors.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/widgets/app_textform.dart';
import 'package:appointments/features/groups/logic/cubit/group_api_cubit.dart';
import 'package:appointments/features/groups/logic/cubit/group_api_state.dart';
import 'package:appointments/features/groups/ui/out_side/widgets/list_groups.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupView extends StatefulWidget {
  const GroupView({super.key});

  @override
  State<GroupView> createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
  @override
  void initState() {
    super.initState();
    context.read<GroupApiCubit>().getUserGroups();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups', style: TextStyles.font18BlackDisplayBold),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 30, color: Colors.black),
            onPressed: () {
              // Action for adding a new group
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Column(
          children: [
            AppTextFormField(
              validator: (value) {},
              backgroundColor: ColorsManager.ofWhite,
              hintText: 'Search ',
              hintStyle: TextStyles.font16GrayRegular.copyWith(
                color: ColorsManager.ligtblack.withAlpha(150),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),

              prefixIcon: const Icon(
                Icons.search,
                color: ColorsManager.ligtblack,
                size: 20,
              ),
            ),
            SizedBox(height: 10.h),
            BlocBuilder<GroupApiCubit, GroupApiState>(
              builder: (context, state) {
               return state.when(
                  initial: () => const Center(child: Text('No groups found')),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  loaded: (data) {
                    if (data.isEmpty) {
                      return const Center(child: Text('No groups found'));
                    }
                    return Expanded(
                      child: ListGroups(groups: context.read<GroupApiCubit>().userGroups),
                    );
                  },
                  error: (error) => Center(child: Text(error)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
