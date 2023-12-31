import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ngepet_id/cubit/store_cubit.dart';
import 'package:ngepet_id/shared/theme.dart';
import 'package:ngepet_id/ui/widgets/custom_button.dart';

import '../../models/dokter_model.dart';
import '../widgets/custom_icon.dart';

class DokterDetailPage extends StatefulWidget {
  final DokterModels dokter;

  const DokterDetailPage({
    Key? key,
    required this.dokter,
  }) : super(key: key);

  @override
  State<DokterDetailPage> createState() => _DokterDetailPageState();
}

class _DokterDetailPageState extends State<DokterDetailPage> {
  int count = 1; // Default angka

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    if (count > 1) {
      setState(() {
        count--;
      });
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   context.read<StoreCubit>().getStoreById(widget.storeId);
  // }

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        padding: const EdgeInsets.all(14),
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 360,
                width: 360,
                decoration: const BoxDecoration(
                  color: Color(0xFF957D95),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 360,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: NetworkImage(
                      widget.dokter.imageUrl,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            backgroundImage(),
            ListView(
              children: [
                const SizedBox(
                  height: 350,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 23,
                    right: 23,
                  ),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.dokter.name,
                        style: boldTextStyle.copyWith(
                          fontSize: 16,
                          color: kBlackColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 68,
                              width: 160,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Jasa Pengiriman",
                                    style: regularTextStyle.copyWith(
                                      fontSize: 14,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "Reguler",
                                    style: regularTextStyle.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                              height: 68,
                              width: 160,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Review",
                                    style: regularTextStyle.copyWith(
                                      fontSize: 14,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "4.9/5",
                                    style: regularTextStyle.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/user_4.png"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          BlocBuilder<StoreCubit, StoreState>(
                            builder: (context, state) {
                              if (state is StoreByIdSuccess) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.store.name,
                                      style: boldTextStyle.copyWith(
                                        fontSize: 16,
                                        color: kBlackColor,
                                      ),
                                    ),
                                    Text(
                                      state.store.address,
                                      style: boldTextStyle.copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                        color: kBlackColor,
                                      ),
                                    ),
                                  ],
                                );
                              } else if (state is StoreFailed) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: kRedColor,
                                    content: Text(state.error),
                                  ),
                                );
                              }
                              return Container();
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.dokter.deskripsi,
                        textAlign: TextAlign.justify,
                        style: regularTextStyle.copyWith(
                          fontSize: 14,
                          color: kBlackColor,
                        ),
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 35,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIcon(
                    iconUrl: "assets/icons/icon_arrow_back.png",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomIcon(
                    iconUrl: "assets/icons/icon_cart.png",
                    onTap: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 105,
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 105,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(size: 15, Icons.remove),
                                onPressed: decrement,
                              ),
                              Text(
                                count.toString(),
                                textAlign: TextAlign.center,
                                style: semiBoldTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(size: 15, Icons.add),
                                onPressed: increment,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            right: 20,
                          ),
                          child: Text(
                            NumberFormat.currency(
                              locale: 'id_ID',
                              symbol: 'Rp ',
                              decimalDigits: 0,
                            ).format(58000),
                            textAlign: TextAlign.center,
                            style: boldTextStyle.copyWith(
                              fontSize: 12,
                              color: kBlackColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: CustomButton(
                              title: "Tambah Keranjang",
                              color: kPrimaryColor,
                              onTap: () {},
                              titleColor: kWhiteColor,
                              width: 165,
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: CustomButton(
                              title: "Beli Sekarang",
                              color: kPrimaryColor,
                              onTap: () {
                                Navigator.pop(context);
                              },
                              titleColor: kWhiteColor,
                              width: 165,
                            ),
                          ),
                        ],
                      ),
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
}
