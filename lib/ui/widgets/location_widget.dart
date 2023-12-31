import 'package:flutter/material.dart';
import 'package:ngepet_id/models/location_pet_model.dart';
import '../../shared/theme.dart';

class LocationWidget extends StatelessWidget {
  final LocationPetModels locPet;

  const LocationWidget(
    this.locPet, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 160,
      height: 283,
      child: Column(
        children: [
          Container(
            width: 160,
            height: 225,
            padding: const EdgeInsets.only(
              top: 20,
              right: 15,
              left: 15,
            ),
            decoration: BoxDecoration(
                color: Color(0xffF3AAFF), borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kWhiteColor,
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/icons/icon_location.png",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${locPet.jarak} Km",
                      style: regularTextStyle.copyWith(
                        fontSize: 14,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 23),
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                        locPet.imageUrl,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              locPet.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: semiBoldTextStyle.copyWith(
                fontSize: 14,
                color: kBlack2Color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
