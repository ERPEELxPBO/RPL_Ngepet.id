import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngepet_id/shared/theme.dart';

import '../../cubit/product_cubit.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/rekomen_produk_card.dart';
import '../widgets/top_section_widget.dart';

class KatalogPage extends StatefulWidget {
  KatalogPage({Key? key});

  @override
  _KatalogPageState createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  bool isSearching = false; // Tambahkan variabel isSearching

  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
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
              title: "Katalog",
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
                        hintText: "Temukan produk yang kamu inginkan",
                        controller: _searchController,
                        onSubmitted: (String searchTerm) {
                          // Panggil event pencarian
                          context
                              .read<ProductCubit>()
                              .searchProducts(searchTerm);
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

  // Fungsi untuk menghapus kata kunci pencarian dari riwayat pencarian

  int _getItemCount(BuildContext context) {
    final state = context.watch<ProductCubit>().state;
    return state is ProductSuccess ? state.products.length : 0;
  }
}
