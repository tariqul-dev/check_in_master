import 'dart:async';

import 'package:check_in_master/src/core/bottom_sheets/show_single_input_bottom_sheet.dart';
import 'package:check_in_master/src/core/constants.dart';
import 'package:check_in_master/src/core/cubits/loading_hud/loading_hud_cubit.dart';
import 'package:check_in_master/src/core/di/app_dependencies_builder.dart';
import 'package:check_in_master/src/core/dialogs/dialog_utils.dart';
import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/features/store_location/ui/cubits/set_location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SetLocationPage extends StatefulWidget {
  static const String path = '/SetLocationPage';

  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (_) => SetLocationPage(),
      settings: RouteSettings(name: SetLocationPage.path),
    );
  }

  const SetLocationPage({super.key});

  @override
  State<SetLocationPage> createState() => _SetLocationPageState();
}

class _SetLocationPageState extends State<SetLocationPage> {
  late final SetLocationCubit _setLocationCubit;
  late final LoadingHudCubit _loadingCubit;

  final ValueNotifier<LatLng> currentLocation = ValueNotifier(
    defaultLocationData,
  );

  GoogleMapController? _mapController;

  late final StreamSubscription<SetLocationState> _setLocationSubscription;
  LocationDataEntity? _currentActiveLocation;

  @override
  void initState() {
    super.initState();
    _setLocationCubit = getIt<SetLocationCubit>();
    _loadingCubit = getIt<LoadingHudCubit>();
    _setLocationSubscription = _setLocationCubit.stream.listen(
      _setLocationStateListener,
    );
    _setLocationCubit.getLocationData();
  }

  @override
  void dispose() {
    _loadingCubit.close();
    _setLocationCubit.close();
    _mapController?.dispose();
    _setLocationSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select check in point')),
      body: _buildBody(),
      bottomSheet: _buildSaveLocationButton(),
    );
  }

  Widget _buildBody() {
    return SafeArea(child: _buildMap());
  }

  Widget _buildSaveLocationButton() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom,
      ),
      child: FilledButton(
        onPressed: () async {
          await showSingleInputBottomSheet(
            context,
            onPressSave: (name) {
              _setLocationCubit.saveLocationData(
                locationData: currentLocation.value,
                locationName: name,
                currentActiveLocationId: _currentActiveLocation?.id,
              );
            },
          );
        },
        child: Text('Save location'),
      ),
    );
  }

  ValueListenableBuilder<LatLng> _buildMap() {
    return ValueListenableBuilder<LatLng>(
      valueListenable: currentLocation,
      builder: (context, value, child) {
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: currentLocation.value,
            zoom: 14.0,
          ),
          onMapCreated: (controller) {
            _mapController = controller;
          },
          onTap: (LatLng tappedPoint) {
            currentLocation.value = tappedPoint;
            _setMapCameraPosition(tappedPoint);

            print(
              'Tapped Location: ${tappedPoint.latitude}, ${tappedPoint.longitude}',
            );
          },
          markers: {
            Marker(
              markerId: MarkerId('selected-location'),
              position: currentLocation.value,
            ),
          },
        );
      },
    );
  }

  void _setLocationStateListener(SetLocationState state) {
    state.map(
      initial: (_) {},
      inProgress: (_) {
        _loadingCubit.startLoading();
        DialogUtils.showLoadingDialog(context: context);
      },
      failure: (s) {
        _loadingCubit.completeLoading();
        DialogUtils.hideDialog(context);
        DialogUtils.showMessageDialog(
          context: context,
          title: "Error",
          message: s.message,
        );
      },
      fetchLocationData: (s) {
        _loadingCubit.completeLoading();
        DialogUtils.hideDialog(context);
        _currentActiveLocation = s.locationData;
        final latLng = LatLng(s.locationData.lat, s.locationData.lng);
        currentLocation.value = latLng;
        _setMapCameraPosition(latLng);
      },
      saveLocationSuccess: (_) {
        _loadingCubit.completeLoading();
        DialogUtils.hideDialog(context);
        DialogUtils.showMessageDialog(
          context: context,
          title: "Success",
          message: "Check in point saved successfully",
        );
      },
    );
  }

  void _setMapCameraPosition(LatLng latLng) {
    _mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
  }
}
