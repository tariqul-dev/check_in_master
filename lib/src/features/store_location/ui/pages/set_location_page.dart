import 'dart:async';

import 'package:check_in_master/src/features/store_location/ui/bottom_sheets/show_saved_locations_bottom_sheet.dart';
import 'package:check_in_master/src/core/bottom_sheets/show_single_input_bottom_sheet.dart';
import 'package:check_in_master/src/core/constants.dart';
import 'package:check_in_master/src/core/cubits/loading_hud/loading_hud_cubit.dart';
import 'package:check_in_master/src/core/di/app_dependencies_builder.dart';
import 'package:check_in_master/src/core/dialogs/dialog_utils.dart';
import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/features/store_location/ui/cubits/location_fetching/location_fetching_cubit.dart';
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
  late final LocationFetchingCubit _locationFetchingCubit;

  final ValueNotifier<LatLng> currentLocation = ValueNotifier(
    defaultLocationData,
  );

  GoogleMapController? _mapController;

  late final StreamSubscription<SetLocationState> _setLocationSubscription;
  LocationDataEntity? _currentActiveLocation;
  late final StreamSubscription<LocationFetchingState>
  _locationFetchingSubscription;

  Map<String, LocationDataEntity>? _locationsMap;
  LocationDataEntity? _selectedLocationEntity;

  @override
  void initState() {
    super.initState();
    _setLocationCubit = getIt<SetLocationCubit>();
    _loadingCubit = getIt<LoadingHudCubit>();
    _locationFetchingCubit = getIt<LocationFetchingCubit>();
    _setLocationSubscription = _setLocationCubit.stream.listen(
      _setLocationStateListener,
    );
    _setLocationCubit.getLocationData();
    _locationFetchingSubscription = _locationFetchingCubit.stream.listen(
      _locationFetchingStateListener,
    );
  }

  @override
  void dispose() {
    _loadingCubit.close();
    _setLocationCubit.close();
    _locationFetchingCubit.close();
    _mapController?.dispose();
    _setLocationSubscription.cancel();
    _locationFetchingSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select check in point'),

        actions: [
          IconButton(
            onPressed: () {
              _locationFetchingCubit.getLocations();
              showSavedLocationsBottomSheet(
                _locationFetchingCubit,
                context,
                onPressedItem: _onPressedLocationListItem,
              );
            },

            icon: Icon(Icons.list),
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildSaveLocationButton(),
    );
  }

  Widget _buildBody() {
    return SafeArea(child: _buildMap());
  }

  Widget _buildSaveLocationButton() {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
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
            _setCurrentLocation(tappedPoint);
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
        _setCurrentLocation(latLng);
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

  void _locationFetchingStateListener(LocationFetchingState state) {
    state.maybeMap(
      fetchLocationData: (s) {
        _locationsMap = _locationsListToMap(s.locationsData);
      },
      orElse: () {},
    );
  }

  Map<String, LocationDataEntity> _locationsListToMap(
    List<LocationDataEntity> list,
  ) {
    return {for (var loc in list) loc.id: loc};
  }

  void _onPressedLocationListItem(LocationDataEntity locationDataEntity) {
    locationDataEntity.id;
    if (_locationsMap?[locationDataEntity.id] != null) {
      _selectedLocationEntity = _locationsMap?[locationDataEntity.id];
    }
    final latLng = LatLng(locationDataEntity.lat, locationDataEntity.lng);
    _setCurrentLocation(latLng);
  }

  void _setCurrentLocation(LatLng latLng) {
    currentLocation.value = latLng;
    _setMapCameraPosition(latLng);
  }

  void _setMapCameraPosition(LatLng latLng) {
    _mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
  }
}
