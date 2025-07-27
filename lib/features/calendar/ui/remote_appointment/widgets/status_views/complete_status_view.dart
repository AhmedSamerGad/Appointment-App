import 'package:appointments/core/thems/fonts_weight.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/features/calendar/domin/accepted_by_entity.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteStatusView extends StatelessWidget {
  const CompleteStatusView({super.key, required this.appointment});
  final AppointmentEntitiy appointment;

  Widget _buildUserAvatar({
    required String imageUrl,
    required double size,
    required String label,
    required Color placeColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: size / 2, backgroundImage: NetworkImage(imageUrl)),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: placeColor),
        ),
      ],
    );
  }

  List<RatedUserEntity> sortList(List<RatedUserEntity> rate) {
    rate.sort(
      (a, b) => b.cumulativeRatingPoints!.compareTo(a.cumulativeRatingPoints!),
    );
    return rate;
  }

  List<AcceptedByEntity> sortImage(List<AcceptedByEntity> app) {
    app.sort(
      (a, b) => a.id.compareTo(
        sortList(appointment.rating![0].ratedUsers)[0].ratedUser!,
      ),
    );
    return app;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Title SliverAppBar
          SliverAppBar(
            title: Text(
              'Appointment Status',
              style: TextStyles.font18BlackDisplayBold,
            ),
            centerTitle: true,
            floating: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

          // Top Winner Banner
          SliverAppBar(
            expandedHeight: 150.h,
            pinned: true,
            backgroundColor: const Color(0xFFF5F5F5),
            elevation: 0,
            leading: const SizedBox.shrink(),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color.fromARGB(255, 138, 153, 160),
                          Colors.grey.shade100,
                          Colors.grey.shade200,
                          Colors.grey.shade300,
                        ],
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Second Place (Left)
                        _buildUserAvatar(
                          imageUrl:
                              sortImage(appointment.acceptedBy!)[1].imageUrl,
                          size: 60,
                          label: '2nd',
                          placeColor: Colors.grey,
                        ),
                        const SizedBox(width: 16),
                        // First Place (Center)
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            _buildUserAvatar(
                              imageUrl:
                                  sortImage(
                                    appointment.acceptedBy!,
                                  )[0].imageUrl,
                              size: 90,
                              label: '1st',
                              placeColor: Colors.amber,
                            ),
                            const Positioned(
                              top: 0,
                              child: Icon(
                                Icons.emoji_events,
                                color: Colors.amber,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        // Third Place (Right)
                        _buildUserAvatar(
                          imageUrl:
                              sortImage(appointment.acceptedBy!)[2].imageUrl,
                          size: 60,
                          label: '3rd',
                          placeColor: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Users Rating List
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: List.generate(appointment.acceptedBy?.length ?? 0, (
                  index,
                ) {
                  final user = appointment.acceptedBy![index];
                  final rating = appointment.rating![0].ratedUsers[index];
                  final sortedRate =
                      sortList(
                        appointment.rating![0].ratedUsers,
                      )[index].cumulativeRatingPoints!;

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      onTap: () {
                        final ratedUser =
                            appointment
                                .rating![0]
                                .ratedUsers[index]; // <-- make sure `someIndex` is correct

                        showDialog(
                          context: context,
                          builder: (context) {
                            final reviews = ratedUser.reviews;

                            return AlertDialog(
                              icon: const Icon(Icons.info_outline),
                              title: Text(
                                'Info',
                                style: TextStyles.font14DarkBlueMedium.copyWith(
                                  color: Colors.amber,
                                ),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(reviews.length, (
                                  index,
                                ) {
                                  final review = reviews[index];
                                  return Row(
                                    children: [
                                      Text(
                                        '${review.title} : ',
                                        style: TextStyles.font16BlackMedium,
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        '${review.points}',
                                        style: TextStyles.font15DarkBlueMedium,
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            );
                          },
                        );
                      },

                      title: Text(
                        user.name,
                        style: TextStyles.font14DarkBlueBold.copyWith(
                          fontWeight: FontWeightHelper.semiBold,
                        ),
                      ),
                      subtitle: Text(
                        rating.comment ?? 'No comment',
                        style: TextStyles.font13GrayRegular,
                      ),
                      trailing: Text(
                        sortedRate.toString(),
                        style: TextStyles.font14BlueSemiBold.copyWith(
                          color: Colors.deepOrange,
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(user.imageUrl),
                        backgroundColor: Colors.green,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
