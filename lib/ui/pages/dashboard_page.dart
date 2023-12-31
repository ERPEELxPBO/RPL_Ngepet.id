import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngepet_id/cubit/auth_cubit.dart';
import 'package:ngepet_id/cubit/location_pet_cubit.dart';
import 'package:ngepet_id/cubit/product_cubit.dart';
import 'package:ngepet_id/models/location_pet_model.dart';
import 'package:ngepet_id/shared/theme.dart';
import 'package:ngepet_id/ui/widgets/custom_fitur.dart';
import 'package:ngepet_id/ui/widgets/location_widget.dart';

import '../../models/product_model.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/day_widget.dart';
import '../widgets/rekomen_produk_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: headerDasboard(context),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: 354,
                height: 172,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/banner_home.png'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/pencarian");
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const CustomSearchBar(
                    enabled: false,
                  ),
                ),
              ),
              customFiturSection(context),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Perawatan Terdekat",
                      style: semiBoldTextStyle.copyWith(
                          fontSize: 20, color: kBlackColor),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Lihat Semua",
                        style: semiBoldTextStyle.copyWith(
                          fontSize: 14,
                          color: kSilverColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<LocationPetCubit, LocationPetState>(
                listener: (context, state) {
                  if (state is LocationPetFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: kRedColor,
                        content: Text(state.error),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LocationPetSuccess) {
                    return nearLocationSection(context, state.locationPets);
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rekomendasi",
                      style: semiBoldTextStyle.copyWith(
                          fontSize: 20, color: kBlackColor),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/katalog",
                        );
                      },
                      child: Text(
                        "Lihat Semua",
                        style: semiBoldTextStyle.copyWith(
                          fontSize: 14,
                          color: kSilverColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              BlocConsumer<ProductCubit, ProductState>(
                listener: (context, state) {
                  if (state is ProductFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: kRedColor,
                        content: Text(state.error),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ProductSuccess) {
                    return rekomenSection(context, state.products);
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget headerDasboard(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return SizedBox(
                width: 165,
                child: Column(
                  children: [
                    const DayWidget(),
                    Text(
                      state.user.name,
                      style: semiBoldTextStyle.copyWith(
                        fontSize: 24,
                        color: kBlackColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/cart",
                );
              },
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kSilver3Color,
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/icons/icon_cart.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/notifikasi');
              },
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kSilver3Color,
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/icons/icon_notif.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget customFiturSection(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        const SizedBox(width: 20),
        CustomFitur(
          title: "Katalog",
          iconPath: "assets/icons/icon_toko.png",
          onTap: () {
            Navigator.pushNamed(
              context,
              "/katalog",
            );
          },
        ),
        CustomFitur(
          title: "Konsultasi",
          iconPath: "assets/icons/icon_konsultasi.png",
          onTap: () {
            Navigator.pushNamed(
              context,
              "/konsultasi",
            );
          },
        ),
        CustomFitur(
          title: "Perawatan",
          iconPath: "assets/icons/icon_perawatan.png",
          onTap: () {
            Navigator.pushNamed(
              context,
              "/perawatan",
            );
          },
        ),
        CustomFitur(
          title: "Lainnya",
          iconPath: "assets/icons/icon_lainnya.png",
          onTap: () {
            Navigator.pushNamed(
              context,
              "/detail-produk",
            );
          },
        ),
      ],
    ),
  );
}

Widget nearLocationSection(context, List<LocationPetModels> locPet) {
  // Ambil 7 indeks acak dari panjang data produk
  List<int> randomIndexes = generateRandomIndexes(locPet.length, 1);

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        const SizedBox(width: 20),
        Row(
          children: randomIndexes.map((int index) {
            return LocationWidget(
              locPet[index],
            );
          }).toList(),
        ),
      ],
    ),
  );
}

Widget rekomenSection(context, List<ProductModels> products) {
  // Ambil 7 indeks acak dari panjang data produk
  List<int> randomIndexes = generateRandomIndexes(products.length, 7);

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        const SizedBox(width: 20),
        Row(
          children: randomIndexes.map((int index) {
            return RekomenProdukCard(
              products[index],
            );
          }).toList(),
        ),
      ],
    ),
  );
}

// Fungsi untuk menghasilkan indeks acak
List<int> generateRandomIndexes(int dataLength, int count) {
  List<int> indexes = List.generate(dataLength, (index) => index);
  indexes.shuffle();
  return indexes.take(count).toList();
}
