import 'package:delivery_app/controllers/auth_controller.dart';
import 'package:delivery_app/controllers/location_controller.dart';
import 'package:delivery_app/controllers/user_controller.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_text_field.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _addressController = TextEditingController();
    final TextEditingController _contactPersonName = TextEditingController();
    final TextEditingController _contactPersonNumber = TextEditingController();

    late bool _isLoggedIn;
    CameraPosition _cameraPosition =
        CameraPosition(target: LatLng(-33.9558, 22.4675), zoom: 17);
    //late LatLng _initialPosition = LatLng(-33.977074, 22.457581);
    late LatLng _initialPosition = LatLng(-33.9558, 22.4675);

    @override
    void initState() {
      super.initState();

      _isLoggedIn = Get.find<AuthController>().userLoggedIn();

      if (_isLoggedIn && Get.find<UserController>().userModel == null) {
        Get.find<UserController>().getUserInfo();
      }

      if (Get.find<LocationController>().addressList.isNotEmpty) {
        _cameraPosition = CameraPosition(
            target: LatLng(
                double.parse(
                    Get.find<LocationController>().getAddress['latitude']),
                double.parse(
                    Get.find<LocationController>().getAddress['longitude'])));
        _initialPosition = LatLng(
            double.parse(Get.find<LocationController>().getAddress['latitude']),
            double.parse(
                Get.find<LocationController>().getAddress['longitude']));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Address Page'),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<LocationController>(
        builder: (locationcontroller) {
          _addressController.text =
              '${locationcontroller.placeMark.name ?? ''}${locationcontroller.placeMark.locality ?? ''}${locationcontroller.placeMark.country ?? ''}${locationcontroller.placeMark.postalCode ?? ''}';
          print(_addressController.text);
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
                width: MediaQuery.of(context).size.width,
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    )),
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition:
                          CameraPosition(target: _initialPosition, zoom: 17),
                      zoomControlsEnabled: false,
                      compassEnabled: false,
                      indoorViewEnabled: true,
                      mapToolbarEnabled: false,
                      onCameraIdle: () {
                        locationcontroller.updatePosition(
                            _cameraPosition, true);
                      },
                      onCameraMove: ((position) => _cameraPosition = position),
                      onMapCreated: (GoogleMapController mapcontroller) {
                        locationcontroller.setMapController(mapcontroller);
                      },
                      myLocationEnabled: true,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: DimensionsCus.height20,
              ),
              BigText(text: 'Delivery Address'),
              SizedBox(
                height: DimensionsCus.height20,
              ),
              AppTextField(
                  textEditingController: _addressController,
                  hintText: 'Your Address',
                  iconData: Icons.map),
            ],
          );
        },
      ),
    );
  }
}
