import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:provider/provider.dart';
import 'package:resturant_delivery_boy/data/model/response/order_details_model.dart';
import 'package:resturant_delivery_boy/data/model/response/order_model.dart';
import 'package:resturant_delivery_boy/provider/location_provider.dart';
import 'package:resturant_delivery_boy/provider/order_provider.dart';
import 'package:resturant_delivery_boy/provider/splash_provider.dart';
import 'package:resturant_delivery_boy/utill/dimensions.dart';
import 'package:resturant_delivery_boy/utill/images.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui';

class TrackingMapWidget extends StatefulWidget {
  // TrackingMapWidget({@required this.deliveryManModel, @required this.orderID, @required this.addressModel});

  @override
  _TrackingMapWidgetState createState() => _TrackingMapWidgetState();
}

class _TrackingMapWidgetState extends State<TrackingMapWidget> {
  GoogleMapController _controller;
  bool _isLoading = true;
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polyline> _polylines = HashSet<Polyline>();
  LatLng _deliveryBoyLatLng;
  LatLng _addressLatLng;
  // LatLng _restaurantLatLng;

  List<LatLng> polylineCoordinates = [];

  String googleAPIkey = "AIzaSyBwWiMORYuexNkxJQfwnaoi95ySlH15qJQ";
  @override
  void initState() {
    super.initState();
    // requestPermission();

    // RestaurantLocationCoverage coverage = Provider.of<SplashProvider>(context, listen: false).configModel.restaurantLocationCoverage;
    // _deliveryBoyLatLng = LatLng(
    //     Provider.of<LocationProvider>(context, listen: false)
    //             .currentLocation
    //             .latitude ??
    //         0,
    //     Provider.of<LocationProvider>(context, listen: false)
    //             .currentLocation
    //             .longitude ??
    //         0);

    _loadData();

    // _deliveryBoyLatLng = LatLng(23.8513, 90.4133);
    // _addressLatLng = LatLng(19.228825, 72.854118);

    // _restaurantLatLng = LatLng(Provider.of<SplashProvider>(context,listen: false).configModel., longitude)
    // // _deliveryBoyLatLng = LatLng(double.parse('16.9987'), double.parse('81.7845'));
    // _addressLatLng = widget.addressModel != null ? LatLng(double.parse(widget.addressModel.latitude), double.parse(widget.addressModel.longitude)) : LatLng(0,0);
    // _restaurantLatLng = LatLng(double.parse(coverage.latitude), double.parse(coverage.longitude));


  }

  _loadData(){
    Provider.of<OrderProvider>(context, listen: false).refresh(context);
    _deliveryBoyLatLng = LatLng(
        Provider.of<LocationProvider>(context, listen: false)
            .currentLocation
            .latitude ??
            0,
        Provider.of<LocationProvider>(context, listen: false)
            .currentLocation
            .longitude ??
            0);
  }

  @override
  void dispose() {
    super.dispose();
    _deliveryBoyLatLng = LatLng(
        Provider.of<LocationProvider>(context, listen: false)
            .currentLocation
            .latitude ??
            0,
        Provider.of<LocationProvider>(context, listen: false)
            .currentLocation
            .longitude ??
            0);
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    // _loadData();
    return Container(
        height: _screenSize.height * 0.9,
        width: _screenSize.width,
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition:
                  CameraPosition(target: _deliveryBoyLatLng, zoom: 18),
              zoomControlsEnabled: true,
              markers: _markers,
              // polylines: _polylines,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
                _isLoading = false;
                setMarker();
                controller
                    .getVisibleRegion()
                    .then((value) => print(value.toString()));
              },
              onTap: (latLng) async {
                String url =
                    'https://www.google.com/maps/dir/?api=1&origin=${_deliveryBoyLatLng.latitude},${_deliveryBoyLatLng.longitude}'
                    '&destination=${_addressLatLng.latitude},${_addressLatLng.longitude}&mode=d';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor)))
                : SizedBox(),
          ],
        ));
  }

  void setMarker() async {
    print("Set Markers");
    Uint8List addressImageData =
        await convertAssetToUnit8List(Images.address_marker, width: 100);
    Uint8List deliveryBoyImageData =
        await convertAssetToUnit8List(Images.delivery_boy_marker, width: 50);
    // Uint8List pantryImageData = await convertAssetToUnit8List(Images.destination_marker, width: 50);

    // Animate to coordinate
    LatLngBounds bounds;
    double _rotation = 0;

    // double right=double.minPositive, left=double.maxFinite;
    LatLng left=LatLng(_deliveryBoyLatLng.latitude, _deliveryBoyLatLng.longitude);
    LatLng right=LatLng(_deliveryBoyLatLng.latitude,_deliveryBoyLatLng.longitude);
    List<OrderModel> orders = Provider.of<OrderProvider>(context, listen: false).currentOrders;
    for(int i=0;i<orders.length;i++){
      if(orders[i].deliveryAddress.latitude!=null) {
        if (double.parse(orders[i].deliveryAddress.latitude) <
            _deliveryBoyLatLng.latitude &&
            double.parse(orders[i].deliveryAddress.latitude) < left.latitude) {
          left = LatLng(double.parse(orders[i].deliveryAddress.latitude),
              double.parse(orders[i].deliveryAddress.longitude));
        } else if (double.parse(orders[i].deliveryAddress.latitude) >
            _deliveryBoyLatLng.latitude &&
            double.parse(orders[i].deliveryAddress.latitude) > right.latitude) {
          right = LatLng(double.parse(orders[i].deliveryAddress.latitude),
              double.parse(orders[i].deliveryAddress.longitude));
        }
      }
    }
    print("Delivery: ${_deliveryBoyLatLng.latitude},${_deliveryBoyLatLng.longitude}");
    print("Left: ${left.latitude},${left.longitude}");
    print("Right: ${right.latitude},${right.longitude}");

    if(_controller != null) {
      if (left.latitude < right.latitude) {
      bounds = LatLngBounds(southwest: left, northeast: right);
      _rotation = 0;
      }else {
        bounds = LatLngBounds(southwest: right, northeast: left);
        _rotation = 180;
      }
    }
    LatLng centerBounds = LatLng(
        (bounds.northeast.latitude + bounds.southwest.latitude)/2,
        (bounds.northeast.longitude + bounds.southwest.longitude)/2
    );

    print(centerBounds.toString() + bounds.toString());
    _controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: centerBounds, zoom: 17)));
    zoomToFit(_controller, bounds, centerBounds);
    // _controller.getVisibleRegion().then((value) => print(value.toString()));

    // Marker
    _markers = HashSet<Marker>();
    _markers.add(Marker(
      markerId: MarkerId('DeliveryMan'),
      position: _deliveryBoyLatLng,
      infoWindow: InfoWindow(
        title: 'Delivery Guy',
        snippet:
            '${_deliveryBoyLatLng.latitude}, ${_deliveryBoyLatLng.longitude}',
      ),
      icon: BitmapDescriptor.fromBytes(deliveryBoyImageData),
    ));

    for (OrderModel order
        in Provider.of<OrderProvider>(context, listen: false).currentOrders) {
      if(order.deliveryAddress.latitude!=null)
      _markers.add(Marker(
        markerId: MarkerId(order.id.toString()),
        position:  LatLng(double.parse(order.deliveryAddress.latitude),
            double.parse(order.deliveryAddress.longitude)),
        infoWindow: InfoWindow(
          title: order.customer.phone,
          snippet:
              '${order.deliveryAddress.latitude != null ? order.deliveryAddress.latitude : 26.912434}, ${order.deliveryAddress.longitude != null ? order.deliveryAddress.longitude : 75.787270}',
        ),
        icon: BitmapDescriptor.fromBytes(addressImageData),
      ));
      // }
      // LatLng _address1LatLng = LatLng(18.993652,72.825218);
      //
      // _markers.add(Marker(
      //   markerId: MarkerId('destination2'),
      //   position: _address1LatLng,
      //   infoWindow: InfoWindow(
      //     title: 'Delivery Address',
      //     snippet: '${_address1LatLng}, ${_address1LatLng.longitude}',
      //   ),
      //   icon: BitmapDescriptor.fromBytes(addressImageData),
      // ));

      // LatLng _address3LatLng = LatLng(19.114424, 72.867943);

      // _markers.add(Marker(
      //   markerId: MarkerId('destination3'),
      //   position: _address3LatLng,
      //   infoWindow: InfoWindow(
      //     title: 'Delivery Address',
      //     snippet: '${_address3LatLng}, ${_address3LatLng.longitude}',
      //   ),
      //   icon: BitmapDescriptor.fromBytes(addressImageData),
      // ));

      // _markers.add(Marker(
      //   markerId: MarkerId('restaurant'),
      //   position: _restaurantLatLng,
      //   infoWindow: InfoWindow(
      //     title: 'Restaurant',
      //     snippet: '${_restaurantLatLng.latitude}, ${_restaurantLatLng.longitude}',
      //   ),
      //   icon: BitmapDescriptor.fromBytes(restaurantImageData),
      // ));
      // _markers.add(Marker(
      //   markerId: MarkerId('delivery_boy'),
      //   position: _deliveryBoyLatLng,
      //   infoWindow: InfoWindow(
      //     title: 'Delivery Man',
      //     snippet: '${_deliveryBoyLatLng.latitude}, ${_deliveryBoyLatLng.longitude}',
      //   ),
      //   rotation: _rotation,
      //   icon: BitmapDescriptor.fromBytes(deliveryBoyImageData),
      // ));
      print(_markers.length);
      // setPolylines();
      setState(() {});
    }

    // void setPolylines() async {
    //   print("Setting Polylines");
    //   PolylinePoints polylinePoints=PolylinePoints();
    //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(googleAPIkey,
    //       PointLatLng(_deliveryBoyLatLng.latitude, _deliveryBoyLatLng.longitude),
    //       PointLatLng(_addressLatLng.latitude, _addressLatLng.longitude));
    //   print("Result ${result.errorMessage}");
    //   if (result.points.isNotEmpty) {
    //     print("Not Empty Polylines");
    //     result.points.forEach((PointLatLng point) {
    //       polylineCoordinates.add(
    //           LatLng(point.latitude, point.longitude)
    //       );
    //     });
    //     setState(() {
    //       _polylines.add(Polyline(
    //           width: 5, // set the width of the polylines
    //           polylineId: PolylineId("poly"),
    //           color: Color.fromARGB(255, 40, 122, 198),
    //           points: polylineCoordinates
    //       ));
    //
    //     });
    //     print("Polylines"+_polylines.toString());
    //   } else {
    //     print("Empty Polylines");
    //   }
  }

  Future<void> zoomToFit(GoogleMapController controller, LatLngBounds bounds,
      LatLng centerBounds) async {
    bool keepZoomingOut = true;
    int i = 0;
    while (keepZoomingOut) {
      print(i++);
      final LatLngBounds screenBounds = await controller.getVisibleRegion();
      if (fits(bounds, screenBounds)) {
        keepZoomingOut = false;
        final double zoomLevel = await controller.getZoomLevel() - 0.5;
        controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: centerBounds,
          zoom: zoomLevel,
        )));
        break;
      } else {
        // Zooming out by 0.1 zoom level per iteration
        final double zoomLevel = await controller.getZoomLevel() - 0.5;
        controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: centerBounds,
          zoom: zoomLevel,
        )));
      }
    }
  }

  bool fits(LatLngBounds fitBounds, LatLngBounds screenBounds) {
    final bool northEastLatitudeCheck =
        screenBounds.northeast.latitude >= fitBounds.northeast.latitude;
    final bool northEastLongitudeCheck =
        screenBounds.northeast.longitude >= fitBounds.northeast.longitude;

    final bool southWestLatitudeCheck =
        screenBounds.southwest.latitude <= fitBounds.southwest.latitude;
    final bool southWestLongitudeCheck =
        screenBounds.southwest.longitude <= fitBounds.southwest.longitude;

    return northEastLatitudeCheck &&
        northEastLongitudeCheck &&
        southWestLatitudeCheck &&
        southWestLongitudeCheck;
  }

  Future<Uint8List> convertAssetToUnit8List(String imagePath,
      {int width = 50}) async {
    ByteData data = await rootBundle.load(imagePath);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))
        .buffer
        .asUint8List();
  }
}
