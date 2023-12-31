import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngepet_id/shared/theme.dart';

import '../../cubit/product_cubit.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/rekomen_produk_card.dart';
import '../widgets/top_section_widget.dart';

class PencarianPage extends StatefulWidget {
  PencarianPage({Key? key});

  @override
  _PencarianPageState createState() => _PencarianPageState();
}

class _PencarianPageState extends State<PencarianPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> searchHistory = [];
  bool isSearching = false; // Tambahkan variabel isSearching

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Stack(
          children: [
            const TopSectionWidget(
              title: "Pencarian",
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
                        controller: _searchController,
                        onSubmitted: (String searchTerm) {
                          // Panggil event pencarian
                          context
                              .read<ProductCubit>()
                              .searchProducts(searchTerm);
                          // Tambahkan kata kunci ke riwayat pencarian
                          addSearchHistory(searchTerm);
                          // Set isSearching menjadi true saat mulai pencarian
                          setState(() {
                            isSearching = true;
                          });
                        },
                      ),
                    ),
                    if (!isSearching) // Tampilkan riwayat pencarian dan pencarian terpopuler hanya jika tidak sedang mencari
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pencarian Sebelumnya",
                              style: semiBoldTextStyle.copyWith(
                                fontSize: 16,
                                color: kBlackColor,
                              ),
                            ),
                            SizedBox(height: 10),
                            // List untuk menampilkan riwayat pencarian sebelumnya
                            IntrinsicWidth(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: buildSearchHistoryItems(),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
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
                            Text(
                              "Pencarian Terpopuler",
                              style: semiBoldTextStyle.copyWith(
                                fontSize: 16,
                                color: kBlackColor,
                              ),
                            ),
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
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return BlocConsumer<ProductCubit, ProductState>(
                                  listener: (context, state) {
                                    if (state is ProductFailed) {
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
                                    if (state is ProductSuccess) {
                                      print(index);
                                      return FittedBox(
                                        child: RekomenProdukCard(
                                          state.products[index],
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
                            BlocBuilder<ProductCubit, ProductState>(
                              builder: (context, state) {
                                if (state is ProductSearchSuccess) {
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
                                      final product =
                                          state.searchResults[index];

                                      return FittedBox(
                                        child: RekomenProdukCard(
                                          product,
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

  // Fungsi untuk membangun item riwayat pencarian sebelumnya
  List<Widget> buildSearchHistoryItems() {
    return searchHistory.map((keyword) {
      return IntrinsicWidth(
        child: Container(
          height: 40,
          padding: const EdgeInsets.only(
            left: 15,
            right: 10,
          ),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Color.fromRGBO(224, 191, 229, 30),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  keyword,
                  style: boldTextStyle.copyWith(
                    fontSize: 14,
                    color: kPurpleColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 7),
              GestureDetector(
                onTap: () {
                  removeSearchHistory(keyword);
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/icons/icon_close.png",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  // Fungsi untuk menghapus kata kunci pencarian dari riwayat pencarian
  void removeSearchHistory(String keyword) {
    setState(() {
      searchHistory.remove(keyword);
    });
  }

  // Fungsi untuk menambahkan kata kunci pencarian ke riwayat pencarian
  void addSearchHistory(String keyword) {
    setState(() {
      // Hanya tambahkan jika keyword belum ada di riwayat pencarian
      if (!searchHistory.contains(keyword)) {
        searchHistory.insert(0, keyword);

        // Batasi riwayat pencarian menjadi maksimal 5 item
        if (searchHistory.length > 5) {
          searchHistory.removeLast();
        }
      }
    });
  }
}
