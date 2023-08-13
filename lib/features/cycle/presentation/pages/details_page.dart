import 'package:cyclego/features/cycle/domain/entities/cycle_detail_entity.dart';
import 'package:cyclego/features/cycle/presentation/bloc/cycle_details/cycle_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/action_botton.dart';

class DetailsPage extends StatefulWidget {
  final CycleDetaillEntity cycle;
  static const routeName = '/details';
  const DetailsPage({super.key, required this.cycle});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CycleDetailsCubit, CycleDetailsState>(
      builder: (context, state) {
        if (state is CycleDetailsLoaded) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Container(
                  padding: const EdgeInsets.only(left: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 1,
                          color: Theme.of(context).highlightColor)
                    ],
                  ),
                  child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      iconSize: 20,
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                      )),
                ),
              ),
              actions: const [
                ActionButton(
                    icon: Icon(
                  Icons.favorite_border_outlined,
                ))
              ],
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.network(state.cycle.image!),
                ),
                _bottomCycleDetails(
                  cycleName: state.cycle.name!,
                  color: state.cycle.color!,
                  speed: '${state.cycle.speed!} km/h',
                  rating: "${state.cycle.rating!}",
                ),
              ],
            )),
          );
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }

  _bottomCycleDetails(
      {required String cycleName,
      required String color,
      required String speed,
      required String rating}) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cycleName,
              style: const TextStyle(
                  fontSize: 40,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomColumnWidegt(
                labelText: 'Primary Color',
                titleText: color,
              ),
              BottomColumnWidegt(
                labelText: 'Speed',
                titleText: speed,
              ),
              BottomColumnWidegt(
                labelText: 'Rating',
                titleText: rating,
              ),
            ],
          ),
          const Divider(),
          const Text(
              "jjdkjfk dfd fj djfjdfjd fdjfkd fkdjfdfdjf dkfdkfkd fkdnfndfnfkdfdkfdnfn dkfj dfjfkfj dkfjdkfjkdfjdfdjfkdfd fkdkfdkfdjfdkfjkdfjdfkdfdfkfdkfj dkdfk djfkdkfdkf  fdkfkdfjdkf d ff")
        ],
      ),
    );
  }
}

class BottomColumnWidegt extends StatelessWidget {
  final String titleText;
  final String labelText;
  const BottomColumnWidegt({
    super.key,
    required this.titleText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(titleText), Text(labelText)],
    );
  }
}
