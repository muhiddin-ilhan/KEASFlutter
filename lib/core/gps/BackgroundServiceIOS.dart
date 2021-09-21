// import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;

// class BackgroundServiceIOS {

//   Future initialize(int userId, int taskId, int truckId, int relationId) async {
//     bg.BackgroundGeolocation.onLocation((bg.Location location) {
//       print('[location] - $location');
//     });

//     await bg.BackgroundGeolocation.ready(bg.Config(
//         desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
//         distanceFilter: 25.0,
//         stopOnTerminate: false,
//         startOnBoot: false,
//         debug: false,
//         activityType: bg.Config.ACTIVITY_TYPE_OTHER,
//         disableElasticity: true,
//         geofenceInitialTriggerEntry: false,
//         isMoving: true,
//         logLevel: bg.Config.LOG_LEVEL_VERBOSE,
//         disableStopDetection: true,
//         pausesLocationUpdatesAutomatically: false,
//         preventSuspend: true,
//         showsBackgroundLocationIndicator: true,
//         activityRecognitionInterval: 0,
//         disableMotionActivityUpdates: true,
//         autoSync: true,
//         httpRootProperty: ".",
//         locationTemplate: '{"Lat":<%= latitude %>,"Lon":<%= longitude %>,"Speed":<%= speed %>,"RecordDate":"<%= timestamp %>"}',
//         locationTimeout: 30,
//         locationsOrderDirection: 'DESC',
//         method: 'POST',
//         params: {
//           "UserId": userId,
//           "TaskId": taskId,
//           "TruckId": truckId,
//           "IsDangerArea": 0,
//           "IsBreakArea": 0,
//           "IsDeleted": 0,
//           "RelationId": relationId
//         },
//         url: 'https://mobil.basarsoft.com.tr/Dev/KEASWebApiV2/DriverRoute/InsertDriverRoute'
//     ));

//     return;
//   }

//   Future start() async {
//     await bg.BackgroundGeolocation.start();

//     return;
//   }

//   Future stop() async {
//     await bg.BackgroundGeolocation.stop();

//     return;
//   }

//   Future syncSavedDate() async {
//     try{
//       List<dynamic> result = await bg.BackgroundGeolocation.sync();
//       print(result);
//     } catch (e) {
//       print(e);
//     }

//     return;
//   }
// }