import 'package:cloud_firestore/cloud_firestore.dart';

class BookingService {
  static CollectionReference bookingCollection =
      FirebaseFirestore.instance.collection('bookings');

  static Future<void> updateReport(String id) async {
    await bookingCollection.doc(id).update({
      'report': "Selesai",
    });
  }
}
