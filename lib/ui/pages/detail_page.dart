import 'package:intl/intl.dart';
import 'package:sriwijaya/models/destination_model.dart';
import 'package:sriwijaya/shared/theme.dart';
import 'package:sriwijaya/ui/pages/choose_seat.dart';
import 'package:sriwijaya/ui/widgets/custom_button.dart';
import 'package:sriwijaya/ui/widgets/custom_photo.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
    this.destination, {
    Key? key,
  }) : super(key: key);

  final DestinationModel destination;

  @override
  Widget build(BuildContext context) {
    Widget customShadow() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 214,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kWhiteColor.withOpacity(0),
                Colors.black.withOpacity(0.95),
              ],
            ),
          ),
        ),
      );
    }

    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(destination.imageUrl),
          ),
        ),
        child: customShadow(),
      );
    }

    Widget photos(String imageUrl) {
      return CustomPhoto(
        height: 70,
        width: 70,
        imageUrl: imageUrl,
        margin: const EdgeInsets.only(right: 7),
      );
    }

    Widget interestItem(String name) {
      return Expanded(
        child: Row(
          children: [
            const CustomPhoto(
              height: 16,
              width: 16,
              imageUrl: 'assets/icon_check.png',
              margin: EdgeInsets.only(right: 6),
            ),
            Text(
              name,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        //remember, column crossaxis always center, so provide full width
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 10,
        ),
        child: SafeArea(
          child: Column(
            children: [
              //* this is emblem
              Container(
                width: 108,
                height: 24,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/icon_emblem.png'),
                  ),
                ),
              ),
              //*title
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.6 - 200),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination.name,
                            style: whiteTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            destination.city,
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: light,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/icon_star.png'))),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          destination.rating.toString(),
                          style: whiteTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: borderDefault,
                  color: kWhiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //*about
                    Text(
                      "About",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sapiente qui porro recusandae dicta animi laboriosam neque ullam debitis eius asperiores illum, excepturi repudiandae magni possimus harum doloremque libero ducimus ex. Rerum itaque odit inventore dolor libero beatae fugiat exercitationem provident?",
                      style: blackTextStyle.copyWith(
                        height: 2,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Photos",
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          photos("assets/image_photo1.png"),
                          photos("assets/image_photo2.png"),
                          photos("assets/image_photo3.png"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Interests",
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    //todo: this one will be a loop with +2 iterate
                    Row(
                      children: [
                        interestItem("Kids Park"),
                        interestItem("City Museum"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        interestItem("Honor Bridge"),
                        interestItem("Central Mall"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(
                              locale: "id",
                              symbol: "IDR ",
                              decimalDigits: 0,
                            ).format(destination.price),
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: medium,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Per person",
                            style: grayTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      textButton: "Book Now",
                      eventFunc: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => ChooseSeat(destination)),
                          ),
                        );
                      },
                      width: 170,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
          child: Stack(
        children: [
          backgroundImage(),
          content(),
        ],
      )),
    );
  }
}
