import 'package:cyclego/features/auth/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:cyclego/features/auth/presentation/cubit/user/get_single_user/cubit/single_user_cubit.dart';
import 'package:cyclego/features/cycle/domain/entities/cycle_detail_entity.dart';
import 'package:cyclego/features/cycle/presentation/bloc/all_cycles/cycle_cubit.dart';
import 'package:cyclego/features/cycle/presentation/bloc/cycle_details/cycle_details_cubit.dart';
import 'package:cyclego/features/cycle/presentation/pages/details_page.dart';
import 'package:cyclego/features/cycle/presentation/pages/home/all_cycles.dart';
import 'package:cyclego/features/cycle/presentation/widgets/home_widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';

  final String uid;
  const HomePage({
    required this.uid,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  void initState() {
    BlocProvider.of<CycleCubit>(context)
        .getCycles(cycle: const CycleDetaillEntity());
    BlocProvider.of<SingleUserCubit>(context).getSingleUser(uid: widget.uid);
    super.initState();
  }

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(27.711891, 85.328172);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleUserCubit, SingleUserState>(
      builder: (context, singleUserState) {
        if (singleUserState is SingleUserLoaded) {
          return Scaffold(
            key: _scaffoldKey,
            drawer: MyDrawer(
              userText: ' ${singleUserState.user.firstName!}',
              logOut: () {
                BlocProvider.of<AuthCubit>(context).loggedOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login-page', (route) => false);
              },
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 650,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      GoogleMap(
                        markers: {
                          marker(),
                        },
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        compassEnabled: true,
                        mapToolbarEnabled: true,
                        zoomGesturesEnabled: true,
                        onMapCreated: (controller) {
                          mapController = controller;
                        },
                        initialCameraPosition: CameraPosition(
                          target: _center,
                          zoom: 20.0,
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 20,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.white,
                              mini: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: _openDrawer,
                              child: const Icon(
                                Icons.menu,
                              ),
                            ),
                            _ourLoactionTab(),
                            const SizedBox(
                              width: 35,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: BottomWidget(),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Marker marker() {
    return const Marker(
      markerId: MarkerId('Our_location'),
      position: LatLng(
        27.711891,
        85.328172,
      ),
      infoWindow: InfoWindow(
        title: 'CycleGo',
        snippet: 'Naxal',
      ),
      icon: BitmapDescriptor.defaultMarker,
    );
  }

  Widget _ourLoactionTab() {
    return Container(
      alignment: Alignment.center,
      width: 180,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(0, 2),
                blurRadius: 3,
                spreadRadius: 1)
          ]),
      child: const Text(
        "Our Location",
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class BottomWidget extends StatefulWidget {
  const BottomWidget({super.key});

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, -2))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Choose Bicycle',
                  style: TextStyle(
                      fontSize: 25, decoration: TextDecoration.underline),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AllCycleList.routeName);
                  },
                  child: const Text(
                    'More',
                    style: TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.green),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<CycleCubit, CycleState>(
              builder: (context, cycleState) {
                if (cycleState is CycleLoaded) {
                  final cycles = cycleState.cycles;

                  return SizedBox(
                    height: 150,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: cycles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () => _cycleDetails(id: cycles[index].id!),
                            child: Card(
                              surfaceTintColor: Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 90,
                                    width: 150,
                                    child: Image.network(
                                      cycles[index].image!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    cycles[index].name!,
                                  ),
                                  Text("Type: ${cycles[index].type}")
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (cycleState is CycleLoading) {
                  return const CircularProgressIndicator();
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _cycleDetails({required String id}) {
    BlocProvider.of<CycleDetailsCubit>(context).getCycleDetails(id: id);
    Navigator.pushNamed(context, DetailsPage.routeName,
        arguments: const CycleDetaillEntity());
  }
}
