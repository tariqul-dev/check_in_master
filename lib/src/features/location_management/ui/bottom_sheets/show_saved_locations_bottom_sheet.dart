import 'package:check_in_master/src/core/bottom_sheets/show_app_bottom_sheet.dart';
import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/utils/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/location_fetching/location_fetching_cubit.dart';

Future<void> showSavedLocationsBottomSheet(
  LocationFetchingCubit bloc,
  BuildContext context, {
  required Function(LocationDataEntity locationDataEntity) onPressedItem,
}) async {
  await showAppBottomSheet(
    context: context,
    builder: (ctx) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Saved Locations",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            BlocBuilder<LocationFetchingCubit, LocationFetchingState>(
              bloc: bloc,
              builder: (context, state) {
                return state.maybeMap(
                  failure: (s) => Text(s.message),
                  fetchLocationData: (s) {
                    final locations = s.locationsData;

                    if (locations.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(24),
                        child: Text("No locations saved yet."),
                      );
                    } else {
                      return SizedBox(
                        height: 300,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: locations.length,
                          separatorBuilder: (_, __) => const Divider(),
                          itemBuilder: (ctx, index) {
                            final location = locations[index];
                            return ListTile(
                              title: Text(location.name),
                              subtitle: Text(
                                'Created At: ${DateTimeHelper.formatDateTime(location.createdAt)}',
                              ),
                              trailing: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: location.active
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                              ),

                              onTap: () {
                                onPressedItem(location);
                                Navigator.pop(ctx);
                              },
                            );
                          },
                        ),
                      );
                    }
                  },
                  orElse: () => CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
