// import 'dart:io';

// class WriteTextFile {
//   File? file;

//   Future<File?> initFile() async {
//     try {
//       File parentDir = File('/storage/emulated/0/KEAS');
//       File myFile = File('/storage/emulated/0/KEAS/sample.txt');
//       if (!(await parentDir.exists())) {
//         await parentDir.create();
//       }
//       if (!(await myFile.exists())) {
//         await myFile.create();
//       }
//       return myFile;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   Future<void> writeLog(String log) async {
//     try {
//       File? myFile = await initFile();
//       DateTime now = DateTime.now();

//       if (myFile != null) {
//         await myFile.writeAsString(now.toString() + " -> " + log, mode: FileMode.append);
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<void> deleteLog() async {
//     try {
//       File? myFile = await initFile();
//       if (myFile != null) {
//         await myFile.delete();
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
