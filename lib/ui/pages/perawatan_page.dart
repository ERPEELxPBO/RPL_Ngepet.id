import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngepet_id/cubit/location_pet_cubit.dart';
import 'package:ngepet_id/shared/theme.dart';
import 'package:ngepet_id/ui/widgets/location_widget.dart';

import '../../cubit/location_pet_cubit.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/top_section_widget.dart';

class PerawatanPage extends StatefulWidget {
  PerawatanPage({Key? key});

  @override
  _PerawatanPageState createState() => _PerawatanPageState();
}

class _PerawatanPageState extends State<PerawatanPage> {
  bool isSearching = false; // Tambahkan variabel isSearching

  @override
  void initState() {
    context.read<LocationPetCubit>().getLocationPets();
    super.initState();
  }

  TextEditingController _searchController = TextEditingController();
  List<String> searchHistory = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Stack(
          children: [
            const TopSectionWidget(
              title: "Perawatan",
              back: true,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 50,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomSearchBar(
                        hintText: "Temukan Pet Shop Favoritmu",
                        controller: _searchController,
                        onSubmitted: (String searchTerm) {
                          // Panggil event pencarian
                          context
                              .read<LocationPetCubit>()
                              .searchLocationPets(searchTerm);
                          // Tambahkan kata kunci ke riwayat pencarian
                          setState(() {
                            isSearching = true;
                          });
                        },
                      ),
                    ),
                    if (!isSearching)
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            // Grid untuk menampilkan hasil pencarian populer
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: _getItemCount(context),
                              itemBuilder: (context, index) {
                                return BlocConsumer<LocationPetCubit,
                                    LocationPetState>(
                                  listener: (context, state) {
                                    if (state is LocationPetFailed) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: kRedColor,
                                          content: Text(state.error),
                                        ),
                                      );
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is LocationPetSuccess) {
                                      print(index);
                                      return FittedBox(
                                        child: LocationWidget(
                                          state.locationPets[index],
                                        ),
                                      );
                                    }

                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    if (isSearching) // Tampilkan hasil pencarian hanya jika sedang mencari
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            // Grid untuk menampilkan hasil pencarian
                            BlocBuilder<LocationPetCubit, LocationPetState>(
                              builder: (context, state) {
                                if (state is LocationPetSearchSuccess) {
                                  return GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                    itemCount: state.searchResults.length,
                                    itemBuilder: (context, index) {
                                      final locationPet =
                                          state.searchResults[index];

                                      return FittedBox(
                                        child: LocationWidget(
                                          locationPet,
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menghapus kata kunci pencarian dari riwayat pencarian

  int _getItemCount(BuildContext context) {
    final state = context.watch<LocationPetCubit>().state;
    return state is LocationPetSuccess ? state.locationPets.length : 0;
  }
}
