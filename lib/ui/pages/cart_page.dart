import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ngepet_id/shared/theme.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/top_section_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<String, int> totalQuantities = {};

  List<Toko> daftarToko = [
    Toko(nama: "Toko ABC"),
    Toko(nama: "Toko XYZ"),
    // Tambahkan toko lainnya sesuai kebutuhan
  ];

  List<bool> isTokoCheckedList =
      List.filled(2, false); // Sesuaikan dengan jumlah toko yang ada

  List<List<bool>> produkCheckedList = [
    [false, false, false], // Produk toko pertama
    [false, false, false], // Produk toko kedua
    // Tambahkan list produk untuk toko lainnya
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const TopSectionWidget(
              title: "Keranjang",
              back: true,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 50,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < daftarToko.length; i++)
                      buildTokoSection(daftarToko[i], i),
                    SizedBox(
                      height: 170,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 180,
                padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/icon_card.png"))),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Rincian Pembayaran",
                              style: semiBoldTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subtotal Produk",
                                  style: mediumTextStyle.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id_ID',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(20000), // Tolong sesuaikan disini
                                  textAlign: TextAlign.center,
                                  style: mediumTextStyle.copyWith(
                                    fontSize: 14,
                                    color: kSilverColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subtotal Pengiriman",
                                  style: mediumTextStyle.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id_ID',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(10000),
                                  textAlign: TextAlign.center,
                                  style: mediumTextStyle.copyWith(
                                    fontSize: 14,
                                    color: kSilverColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Pembayaran",
                                  style: boldTextStyle.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id_ID',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(00), // Tolong sesuaikan disini
                                  textAlign: TextAlign.center,
                                  style: mediumTextStyle.copyWith(
                                    fontSize: 14,
                                    color: kSilverColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: CustomButton(
                        title: "Buat Pesanan",
                        color: kPrimaryColor,
                        onTap: () {
                          Navigator.pushNamed(context, '/pesanan');
                        },
                        titleColor: kWhiteColor,
                        width: 319,
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

  Widget buildTokoSection(Toko toko, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 15,
            top: 5,
            bottom: 15,
          ),
          child: Row(
            children: [
              CustomCheckbox(
                value: isTokoCheckedList[index],
                onChanged: (value) {
                  setState(() {
                    isTokoCheckedList[index] = value!;
                    produkCheckedList[index] =
                        List.filled(produkCheckedList[index].length, value);
                  });
                },
                visualDensity: VisualDensity.compact,
                activeColor:
                    kPrimaryColor, // Sesuaikan dengan warna pilihan Anda
              ),
              SizedBox(width: 8), // Sesuaikan dengan jarak yang diinginkan
              Text(
                toko.nama,
                style: boldTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        for (int i = 0; i < 3; i++)
          buildProduk(
              toko.nama, "Whiskas Adult 1+ Years Tuna Flavor", 58000, index, i),
      ],
    );
  }

  Widget buildCustomCheckbox(bool isChecked) {
    return Container(
      width: 16.5,
      height: 16.5,
      decoration: BoxDecoration(
        color: isChecked ? kPrimaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1.0,
          color: isChecked ? kPrimaryColor : kBlackColor,
        ),
      ),
      child: isChecked
          ? Icon(
              Icons.check,
              size: 12,
              color: Colors.white,
            )
          : null,
    );
  }

  Widget buildProduk(String namaToko, String namaProduk, int hargaProduk,
      int indexToko, int indexProduk) {
    String key = '$namaToko-$namaProduk';

    int count = totalQuantities[key] ?? 1;

    void increment() {
      setState(() {
        count++;
        totalQuantities[key] = count;
      });
    }

    void decrement() {
      if (count > 1) {
        setState(() {
          count--;
          totalQuantities[key] = count;
        });
      }
    }

    return Container(
      width: 350,
      height: 120,
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        top: 10,
        bottom: 10,
      ),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: kSilver2Color,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  produkCheckedList[indexToko][indexProduk] =
                      !produkCheckedList[indexToko][indexProduk];
                  isTokoCheckedList[indexToko] =
                      produkCheckedList[indexToko].every((element) => element);
                });
              },
              child: buildCustomCheckbox(
                  produkCheckedList[indexToko][indexProduk]),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: kSilver2Color,
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: AssetImage("assets/produk/produk_1.png"),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 208,
                      height: 78,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            namaProduk,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: boldTextStyle.copyWith(
                              fontSize: 16,
                              color: kBlack2Color,
                            ),
                          ),
                          Text(
                            NumberFormat.currency(
                                    locale: 'id_ID',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(hargaProduk), // Format mata uang,
                            textAlign: TextAlign.center,
                            style: boldTextStyle.copyWith(
                              fontSize: 20,
                              color: kPrimaryColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 25,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove, size: 20),
                        onPressed: decrement,
                      ),
                      Text(
                        count.toString(),
                        textAlign: TextAlign.center,
                        style: boldTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add, size: 20),
                        onPressed: increment,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Tambahkan widget lainnya sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}

class Toko {
  String nama;

  Toko({required this.nama});
}
