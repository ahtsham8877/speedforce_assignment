import 'package:flutter/material.dart';
import 'package:speed_force/app/app_constant/app_assets.dart';
import 'package:speed_force/app/app_constant/app_colors.dart';
import 'package:speed_force/presentation/global_widget/custom_button.dart';

class ReferralPage extends StatelessWidget {
  const ReferralPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.redAccent,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello!",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: AppColors.kWhite,
                                    fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "David Mathew",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: AppColors.kWhite,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(AppAssets.ic_2),
                        radius: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 160,
                        decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "My Earnings",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: AppColors.kBlack,
                                        fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "\$9,545",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: AppColors.kPrimary,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  AppAssets.hpvector,
                                  height: 70,
                                ),
                                Positioned(
                                  bottom: 12,
                                  left: 12,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.kWhite),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 12),
                                      child: Text(
                                        "Details",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.kSecondPrimary),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(AppAssets.undraw),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      left: 16,
                      right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(AppAssets.ic_1),
                            radius: 15,
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(AppAssets.ic_2),
                            radius: 15,
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(AppAssets.ic_3),
                            radius: 15,
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(AppAssets.ic_4),
                            radius: 15,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 40,
                      right: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(AppAssets.ic_2),
                            radius: 30,
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(AppAssets.ic_3),
                            radius: 30,
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(AppAssets.ic_4),
                            radius: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Invite your friends and get big discounts",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.kBlack, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Invite your other friends to our platform to get plenty of discounts waiting for you!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.kGrey, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  CustomButton(
                    width: screenWidth * 0.7,
                    color: AppColors.kPrimary,
                    text: Text(
                      "Send Referral Link",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kWhite, fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "send to",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.kGrey, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    width: screenWidth * 0.7,
                    borderColor: AppColors.kPrimary,
                    color: AppColors.kWhite,
                    text: Text(
                      "Copy Referral Link",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kPrimary,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
