import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_force/app/app_constant/app_assets.dart';
import 'package:speed_force/app/app_constant/app_colors.dart';
import 'package:speed_force/presentation/view/common/auth/auth_controller/auth_controller.dart';

class UserProfile extends GetView<AuthController> {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        iconTheme: IconThemeData(color: AppColors.kBlack),
        title: Text(
          "My Profile",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.kBlack, fontWeight: FontWeight.w500),
        ),
      ),
      endDrawer: const Drawer(),
      body: Obx(() {
        if (controller.userModel.isEmpty ||
            controller.userModel.first.data == null) {
          return const Center(
            child: Text("No user data available"),
          );
        }

        final user = controller.userModel.first.data!;
        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AppAssets.userbg,
                    width: double.infinity,
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.avatar ?? ''),
                    backgroundColor: AppColors.kGrey,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "${user.firstName} ${user.lastName}",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                user.email ?? 'No email provided',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStatCard("Earnings", "\$${user.earnings ?? 0}",
                      AppColors.kPrimary),
                  _buildStatCard(
                      "Ratings", user.ratings ?? '0', AppColors.kPrimary),
                ],
              ),
              const SizedBox(height: 20),
              // About Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Me",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.kBlack,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user.bio ?? 'No bio available',
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.kBlack,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Action Buttons
              _buildProfileOption(
                  "Business Location", Icons.location_on, context),
              _buildProfileOption("Bookings", Icons.book, context),
              _buildProfileOption(
                  "My Services", Icons.design_services, context),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              spreadRadius: 1),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(
      String title, IconData icon, BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: AppColors.kBlack),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing:
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: () {},
        ),
        Divider().paddingSymmetric(horizontal: 20)
      ],
    );
  }
}
