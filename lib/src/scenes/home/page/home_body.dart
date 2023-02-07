import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research/src/constants/app_text_style.dart';
import 'package:research/src/scenes/home/bloc/home_bloc.dart';
import 'package:research/src/scenes/home/bloc/home_state.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

void _onLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            CircularProgressIndicator(),
            Text("Loading"),
          ],
        ),
      );
    },
  );
  // Future.delayed(new Duration(seconds: 3), () {
  //   Navigator.pop(context); //pop dialog
  // });
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: ((context, state) {}),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == FetchHealthDataStatus.processing) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == FetchHealthDataStatus.success) {
            // Navigator.pop(context);
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: healthCard(
                          title: 'Heart rate',
                          data: '${state.heartRate}',
                          image: 'assets/images/ic_heart_rate.png',
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: healthCard(
                          title: 'Blood pressure',
                          data: '${state.bp}',
                          image: 'assets/images/ic_stethoscope.png',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: healthCard(
                          title: 'Steps',
                          data: '${state.steps}',
                          image: 'assets/images/ic_body.png',
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: healthCard(
                          title: 'Active energy',
                          data: '${state.activeEnergy}',
                          image: 'assets/images/ic_checkup.png',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget healthCard(
      {String title = "",
      String data = "",
      Color color = Colors.white,
      required String image}) {
    return Container(
      // height: 240,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: AppTextStyle.customStyle(18, Colors.black, FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            image,
            width: 70,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data,
            style: AppTextStyle.customStyle(16, Colors.black, FontWeight.bold),
          )
        ],
      ),
    );
  }
}
