import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foode_delivery/feature/auth/data/models/location_model.dart';
import 'package:foode_delivery/feature/auth/presentation/bloc/auth_bloc.dart';

import 'barrel.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../../../barrel.dart';

class SetLocationScreen extends StatefulWidget {
  final String userId;
  const SetLocationScreen({super.key, required this.userId});

  @override
  State<SetLocationScreen> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  YandexMapController? _mapController;
  PlacemarkMapObject? _placemarkObject;
  bool _isLocationSet = false;
  TextEditingController _locationController = TextEditingController(
    text: "Bung Tomo St. 109",
  );
  Point _currentPoint = const Point(latitude: 41.311158, longitude: 69.279737);

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      CommonMethods.showSnackBar(context, 'Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        CommonMethods.showSnackBar(context, 'Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      CommonMethods.showSnackBar(
        context,
        'Location permissions are permanently denied, we cannot request permissions.',
      );
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPoint = Point(
          latitude: position.latitude,
          longitude: position.longitude,
        );
        _updatePlacemark();
      });
    } on PlatformException catch (e) {
      CommonMethods.showSnackBar(context, 'Error: ${e.message}');
    }
  }

  void _updatePlacemark() {
    _placemarkObject = PlacemarkMapObject(
      mapId: const MapObjectId('current_location_placemark'),
      point: _currentPoint,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(
            'assets/icons/place_mark_icon.png',
          ),
          scale: 0.5,
        ),
      ),
      opacity: 0.8,
    );
    _mapController?.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _currentPoint, zoom: 15),
      ),
    );
    _getAddressFromCoordinates(_currentPoint);
  }

  Future<void> _getAddressFromCoordinates(Point point) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        point.latitude,
        point.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        setState(() {
          _locationController.text =
              "${place.street}, ${place.name}, ${place.locality}";
        });
      }
    } catch (e) {
      CommonMethods.showSnackBar(context, "Could not get address: $e");
    }
  }

  @override
  void dispose() {
    _mapController?.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> handleSetLocation() async {
    final location = LocationModel(
      lat: _currentPoint.latitude,
      long: _currentPoint.longitude,
      street: _locationController.text,
    );
    context.read<AuthBloc>().add(
      UpdateUserLocationEvent(userId: widget.userId, location: location),
    );
    context.go('/sign-up/fill-in-bio/${widget.userId}/payment-method/upload-photo/set-location/congrats');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonMethods.customAppBar(
        context: context,
        onPressed: () {
          if (_isLocationSet) {
            setState(() {
              _isLocationSet = false;
            });
          } else {
            context.pop();
          }
        },
        title: "Set your location",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
        child: Column(
          children: [
            Text(
              AppStrings.securityText,
              style: AppTextStyles.appBarBottomTextStyle,
            ),
            SizedBox(height: 3.h),
            if (!_isLocationSet)
              Material(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    setState(() {
                      _isLocationSet = true;
                      _updatePlacemark();
                    });
                  },
                  child: SizedBox(
                    height: 160,
                    width: double.infinity,
                    child: Card(
                      color: AppColors.white,
                      elevation: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.pink.withAlpha(70),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.location_on,
                                size: 32,
                                color: AppColors.darkPink,
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            "Set location",
                            style: AppTextStyles.blackTextStyle16.copyWith(
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.pink, width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: SizedBox(
                          height: 400,
                          width: 300,
                          child: YandexMap(
                            onMapCreated: (controller) {
                              _mapController = controller;
                              _updatePlacemark();
                            },
                            onMapTap: (point) {
                              setState(() {
                                _currentPoint = point;
                                _updatePlacemark();
                              });
                            },
                            mapObjects:
                                _placemarkObject != null
                                    ? [_placemarkObject!]
                                    : [],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.pink, width: 2),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.pink),
                          SizedBox(width: 2.w),
                          Expanded(
                            child: TextField(
                              controller: _locationController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                hintText: "Location",
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: AppTextStyles.blackTextStyle16,
                            ),
                          ),
                          Icon(Icons.edit, color: AppColors.pink),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 3.h),
            MainButton(
              color1: AppColors.pink,
              color2: AppColors.darkPink,
              text: _isLocationSet ? "Set location" : "Next",
              onPressed: () async {
                if (_isLocationSet) {
                  handleSetLocation();
                } else {
                  setState(() {
                    _isLocationSet = true;
                    _updatePlacemark();
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
