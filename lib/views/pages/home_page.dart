import 'package:bwa_airplane/logics/cubit/auth_cubit.dart';
import 'package:bwa_airplane/logics/cubit/destination_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/destination_model.dart';
import '../widgets/custom_destination_tile.dart';
import '../widgets/custom_destination_card.dart';

import 'package:flutter/material.dart';
import '../../preferences/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is AuthSuccess) {
                          return Text(
                            'Howdy, \n${state.user.name}',
                            style: primaryTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          );
                        }
                        return SizedBox();
                      },
                    ),
                    SizedBox(height: 6),
                    Text(
                      'where to fly today?',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/image_profile.png',
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget destinationsCarousel(List<DestinationModel> destinations) {
      return Container(
          margin: EdgeInsets.only(
            top: 30,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: destinations
                    .map((DestinationModel destination) =>
                        CustomDestinationCard(destination))
                    .toList()),
          ));
    }

    Widget destinationsListNew(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 140,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Column(
              children: destinations
                  .map((DestinationModel destination) =>
                      CustomDestinationTile(destination))
                  .toList(),
            )
          ],
        ),
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: kNoColor,
          ));
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              header(),
              destinationsCarousel(state.destinations),
              destinationsListNew(state.destinations),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
