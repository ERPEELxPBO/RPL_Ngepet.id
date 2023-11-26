import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/pilih_voucher_cubit.dart';
import '../../shared/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/top_section_widget.dart';

class PilihVoucherPage extends StatefulWidget {
  const PilihVoucherPage({Key? key}) : super(key: key);

  @override
  State<PilihVoucherPage> createState() => _PilihVoucherPageState();
}

class _PilihVoucherPageState extends State<PilihVoucherPage> {
  late Vouchers selectedPilihVoucher;
  late PilihVoucherCubit metodeVoucherCubit;

  @override
  void initState() {
    super.initState();
    metodeVoucherCubit = context.read<PilihVoucherCubit>();
    selectedPilihVoucher = metodeVoucherCubit.state;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    metodeVoucherCubit.getSavedPilihVoucher();
  }

  Widget metodeVoucherSection(
    String nama,
    String deskripsi,
    Vouchers metode,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPilihVoucher = metode;
        });
      },
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          height: 100,
          margin: const EdgeInsets.only(
            bottom: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: selectedPilihVoucher == metode ? kPrimaryColor : kWhiteColor,
            border: Border.all(
              width: 1.0,
              color: kSilver2Color,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      nama,
                      style: semiBoldTextStyle.copyWith(
                        fontSize: 14,
                        color: selectedPilihVoucher == metode
                            ? kWhiteColor
                            : kBlackColor,
                      ),
                    ),
                  ),
                  Text(
                    deskripsi,
                    style: regularTextStyle.copyWith(
                      fontSize: 14,
                      color: selectedPilihVoucher == metode
                          ? kWhiteColor
                          : kBlackColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Voucher",
                  textAlign: TextAlign.center,
                  style: mediumTextStyle.copyWith(
                    fontSize: 14,
                    color: selectedPilihVoucher == metode
                        ? kWhiteColor
                        : kBlackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<PilihVoucherCubit, Vouchers>(
          builder: (context, state) {
            return Stack(
              children: [
                const TopSectionWidget(
                  title: "Metode Voucher",
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
                        metodeVoucherSection(
                          "Diskon 100%",
                          "Pemakaian dengan minimal pembelian Rp 150.000, maksimal diskon 21.000",
                          Vouchers.Diskon_100,
                        ),
                        metodeVoucherSection(
                          "Diskon 80%",
                          "Pemakaian dengan minimal pembelian Rp 150.000, maksimal diskon 20.000",
                          Vouchers.Diskon_80,
                        ),
                        metodeVoucherSection(
                          "Diskon 70%",
                          "Pemakaian dengan minimal pembelian Rp 150.000, maksimal diskon 20.000",
                          Vouchers.Diskon_70,
                        ),
                        metodeVoucherSection(
                          "Diskon 50%",
                          "Pemakaian dengan minimal pembelian Rp 150.000, maksimal diskon 15.000",
                          Vouchers.Diskon_50,
                        ),
                        metodeVoucherSection(
                          "Diskon 25%",
                          "Pemakaian dengan minimal pembelian Rp 150.000, maksimal diskon 5.000",
                          Vouchers.Diskon_25,
                        ),
                        metodeVoucherSection(
                          "Diskon Pacar",
                          "Diskon Khsusus Pacar Idlofi, dengan tanpa minimal pembelian ",
                          Vouchers.Diskon_Pacar,
                        ),
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
                        title: "Pilih Voucher",
                        color: kPrimaryColor,
                        onTap: () {
                          metodeVoucherCubit
                              .selectPilihVoucher(selectedPilihVoucher);
                          Navigator.pop(context, selectedPilihVoucher);
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
