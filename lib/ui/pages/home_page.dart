import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sriwijaya/cubit/destination_cubit.dart';
import 'package:sriwijaya/models/destination_model.dart';
import 'package:sriwijaya/shared/theme.dart';
import 'package:sriwijaya/ui/widgets/destination_card.dart';
import 'package:sriwijaya/ui/widgets/destination_tile.dart';
import 'package:sriwijaya/ui/widgets/header.dart';
import 'package:flutter/material.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<DestinationCubit>().fetchDestinations();
      return null;
    }, []);
    Widget popularDestination(List<DestinationModel> destinations) {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations
                .map((DestinationModel destination) => DestinationCard(
                      destination: destination,
                      marginRight: 10,
                    ))
                .toList(),
          ),
        ),
      );
    }

    Widget newDestination(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: const EdgeInsets.only(
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New This Year",
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              child: Column(
                children: destinations
                    .map((DestinationModel destination) => DestinationTile(
                          destination: destination,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: kRedColor,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              const Header(),
              popularDestination(state.destinations),
              newDestination(state.destinations),
            ],
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
