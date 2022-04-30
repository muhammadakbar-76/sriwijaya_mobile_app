import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/destination_model.dart';

class DestinationService {
  final CollectionReference _destinationRef =
      FirebaseFirestore.instance.collection("destinations");

  Future<List<DestinationModel>> fecthDestinations() async {
    try {
      QuerySnapshot result = await _destinationRef.get();
      List<DestinationModel> destinations = result.docs.map((e) {
        return DestinationModel.fromJson(
          e.id,
          e.data() as Map<String, dynamic>,
        );
      }).toList();

      return destinations;
    } catch (e) {
      rethrow;
    }
  }

  void reserveSeat(String id, List<dynamic> seats) async {
    try {
      await _destinationRef.doc(id).update({"reservedSeat": seats});
    } catch (e) {
      rethrow;
    }
  }
}
