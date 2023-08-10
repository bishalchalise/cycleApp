import 'package:cyclego/features/auth/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:cyclego/features/auth/presentation/cubit/user/get_single_user/cubit/single_user_cubit.dart';
import 'package:cyclego/features/auth/presentation/widgets/home_widgets/drawer_widget.dart';
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
                Expanded(child: _bottonWidget())
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

  Widget _bottonWidget() {
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose Bicycle',
                    style: TextStyle(
                        fontSize: 25, decoration: TextDecoration.underline),
                  ),
                  Text(
                    'More',
                    style: TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.green),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      surfaceTintColor: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 90,
                            child: Image.network(
                              'https://m.media-amazon.com/images/I/71iiQzfzS2L.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Text(
                            'Cycle Name',
                          ),
                          const Text("Type: Cycle Type")
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
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
          fontFamily: 'Tondo',
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
