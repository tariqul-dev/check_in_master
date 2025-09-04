import 'dart:async';

import 'package:check_in_master/src/core/constants.dart';
import 'package:check_in_master/src/core/cubits/loading_hud/loading_hud_cubit.dart';
import 'package:check_in_master/src/core/di/app_dependencies_builder.dart';
import 'package:check_in_master/src/core/dialogs/dialog_utils.dart';
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
  final ValueNotifier<LatLng> tappedLocation = ValueNotifier(
    defaultLocationData,
  );

  late final StreamSubscription<SetLocationState> _setLocationSubscription;

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
        onPressed: () {
          _setLocationCubit.saveLocationData(tappedLocation.value);
        },
        child: Text('Save location'),
      ),
    );
  }

  ValueListenableBuilder<LatLng> _buildMap() {
    return ValueListenableBuilder<LatLng>(
      valueListenable: tappedLocation,
      builder: (context, value, child) {
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: tappedLocation.value,
            zoom: 14.0,
          ),
          onTap: (LatLng tappedPoint) {
            tappedLocation.value = tappedPoint;

            print(
              'Tapped Location: ${tappedPoint.latitude}, ${tappedPoint.longitude}',
            );
          },
          markers: {
            Marker(
              markerId: MarkerId('selected-location'),
              position: tappedLocation.value,
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
}
