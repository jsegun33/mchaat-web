import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firebase.dart';


//Replace These Values With Yours
class FirebaseHelper  {
  static fb.Database initDatabase() {
    try {
      if (fb.apps.isEmpty) {
        fb.initializeApp(
            // apiKey: "AIzaSyDZLd6g_xlc3NGE-VOBVwDAa50GYH05FKs",
            // authDomain: "laravel-firebase-crud-365ae.firebaseapp.com",
            // databaseURL: "https://laravel-firebase-crud-365ae-default-rtdb.firebaseio.com",
            // projectId: "laravel-firebase-crud-365ae",
            // storageBucket: "laravel-firebase-crud-365ae.appspot.com",
            // messagingSenderId: "643041406600",
            // appId: "1:643041406600:web:8050ec3ec9cee40fbdf93d"


                apiKey: "AIzaSyDPHXD2e7J5e0jV6mJXYT8wYTnn7ysYbQ4",
                authDomain: "mchaat-13797.firebaseapp.com",
                databaseURL: "https://mchaat-13797-default-rtdb.asia-southeast1.firebasedatabase.app",
                projectId: "mchaat-13797",
                storageBucket: "mchaat-13797.appspot.com",
                messagingSenderId: "298447617033",
                appId: "1:298447617033:web:799113e2ab6a2d37de8cd8",
                //measurementId: "G-ZHNGS2BVCC"

        );
      }
    } on fb.FirebaseJsNotLoadedException catch (e) {
      print(e);
    }
    return fb.database();
  }
}

class fire{
  static fb.Database database = FirebaseHelper.initDatabase();
}


// Future<String> getOnce(fb.DatabaseReference AdsRef) async {
//   String a;
//   await AdsRef.once('value').then((value) => {a = value.snapshot.val()});
//   return a;
// }

Future<List> getList(fb.DatabaseReference AdsRef) async {
  List list = [""];
  await AdsRef.once('value').then((value) => {
    list = result(value.snapshot, list)
  });
  return list;
}

List result(DataSnapshot dp,List list){
  list.clear();
  dp.forEach((v) {
    list.add(v);
  });
  return list;
}

