import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngepet_id/cubit/dokter_cubit.dart';
import 'package:ngepet_id/shared/theme.dart';

import '../widgets/custom_search_bar.dart';
import '../widgets/dokter_card.dart';
import '../widgets/top_section_widget.dart';

class KonsultasiPage extends StatefulWidget {
  KonsultasiPage({Key? key});

  @override
  _KonsultasiPageState createState() => _KonsultasiPageState();
}

class _KonsultasiPageState extends State<KonsultasiPage> {
  bool isSearching = false; // Tambahkan variabel isSearching

  @override
  void initState() {
    context.read<DokterCubit>().getDokters();
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
              title: "Konsultasi",
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
                        hintText: "Konsultasikan peliharaan kamu",
                        controller: _searchController,
                        onSubmitted: (String searchTerm) {
                          // Panggil event pencarian
                          context.read<DokterCubit>().searchDokters(searchTerm);
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
                            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _getItemCount(context),
              itemBuilder: (context, index) {
                return BlocConsumer<DokterCubit, DokterState>(
                  listener: (context, state) {
                    if (state is DokterFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: kRedColor,
                          content: Text(state.error),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is DokterSuccess) {
                      print(index);
                      return FittedBox(
                        child: DokterCard(
                          state.dokters[index],
                        ),
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              },
            )

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
                            BlocBuilder<DokterCubit, DokterState>(
                              builder: (context, state) {
                                if (state is DokterSearchSuccess) {
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
                                      final dokter = state.searchResults[index];

                                      return FittedBox(
                                        child: DokterCard(
                                          dokter,
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
    final state = context.watch<DokterCubit>().state;
    return state is DokterSuccess ? state.dokters.length : 0;
  }
}
