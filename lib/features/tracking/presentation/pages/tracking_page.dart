import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wb_sweet_sweat/features/dashboard/presentation/widgets/dashboard_distance_widget.dart';
import 'package:wb_sweet_sweat/features/dashboard/presentation/widgets/dashboard_widget.dart';
import 'package:wb_sweet_sweat/features/map/application/notifiers/map_current_controller_notifier.dart';
import 'package:wb_sweet_sweat/features/map/presentation/widgets/google_map_widget.dart';
import 'package:wb_sweet_sweat/features/tracking/application/providers/tracking_provider.dart';

const fetchBackground = "fetchBackground";

class TrackingPage extends HookConsumerWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(trackingControllerProvider);

    final initFabHeight = 120.0;
    final fabHeight = useState<double>(initFabHeight);
    final panelHeightOpen = useState<double>(320.0);
    final panelHeightClosed = useState<double>(120.0);
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        SlidingUpPanel(
            minHeight: panelHeightClosed.value,
            maxHeight: panelHeightOpen.value,
            parallaxEnabled: true,
            parallaxOffset: 0.5,
            color: Colors.transparent,
            panel: Container(
              margin: const EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: const DashboardWidget(),
            ),
            body: Stack(
              children: [
                SizedBox(
                  height: height - 60,
                  child: GoogleMapWidget(),
                ),
              ],
            ),
            onPanelSlide: (double pos) => fabHeight.value =
                pos * (panelHeightOpen.value - panelHeightClosed.value) +
                    initFabHeight),
        Positioned(
          right: 10.0,
          bottom: fabHeight.value,
          child: FloatingActionButton(
            onPressed: () {
              ref
                  .watch(mapCurrentControllerNotifierProvider.notifier)
                  .animateToMyLocation();
            },
            backgroundColor: Colors.white,
            child: Icon(
              Icons.gps_fixed,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          bottom: fabHeight.value,
          child: const DashboardDistanceWidget(),
        ),
      ],
    );
  }
}
