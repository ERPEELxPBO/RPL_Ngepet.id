import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/metode_pembayaran_cubit.dart';
import '../../shared/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/top_section_widget.dart';

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({Key? key}) : super(key: key);

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  late MetodePembayaran selectedMetodePembayaran;
  late MetodePembayaranCubit metodePembayaranCubit;

  @override
  void initState() {
    super.initState();
    metodePembayaranCubit = context.read<MetodePembayaranCubit>();
    selectedMetodePembayaran = metodePembayaranCubit.state;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    metodePembayaranCubit.getSavedMetodePembayaran();
  }

  Widget metodePembayaranSection(
    String icon,
    String nama,
    MetodePembayaran metode,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMetodePembayaran = metode;
        });
      },
      child: Container(
        height: 45,
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color:
              selectedMetodePembayaran == metode ? kPrimaryColor : kWhiteColor,
          border: Border.all(
            width: 1.0,
            color: kSilver2Color,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/$icon.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Text(
              nama,
              style: mediumTextStyle.copyWith(
                fontSize: 16,
                color: selectedMetodePembayaran == metode
                    ? kWhiteColor
                    : kBlackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<MetodePembayaranCubit, MetodePembayaran>(
          builder: (context, state) {
            return Stack(
              children: [
                const TopSectionWidget(
                  title: "Metode Pembayaran",
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
                        metodePembayaranSection(
                            "icon_gopay", "GOPAY", MetodePembayaran.GOPAY),
                        metodePembayaranSection(
                            "icon_ovo", "OVO", MetodePembayaran.OVO),
                        metodePembayaranSection(
                            "icon_dana", "DANA", MetodePembayaran.DANA),
                        metodePembayaranSection(
                            "icon_transefer_bank",
                            "Transfer Virtual Account",
                            MetodePembayaran.Transfer_Bank),
                        metodePembayaranSection("icon_linkaja", "LinkAja",
                            MetodePembayaran.LinkAja),
                        metodePembayaranSection("icon_shopeepay", "ShopeePay",
                            MetodePembayaran.ShopeePay),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: CustomButton(
                        title: "Pilih Pembayaran",
                        color: kPrimaryColor,
                        onTap: () {
                          metodePembayaranCubit
                              .selectMetodePembayaran(selectedMetodePembayaran);
                          Navigator.pop(context, selectedMetodePembayaran);
                        },
                        titleColor: kWhiteColor,
                        width: 319,
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
