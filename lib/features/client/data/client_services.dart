import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_in_policy/constants.dart';
import 'package:smart_in_policy/features/client/data/client_model.dart';
import 'package:smart_in_policy/features/policy/data/policy_model.dart';

final clientServiceProvider = Provider<ClientService>((ref) {
  return ClientService();
});

class ClientService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late CollectionReference clientsCollection;

  Future addClient(Client newClient) async {
    clientsCollection = _firestore.collection('Clients');

    Map<String, dynamic> clientMap = newClient.toCollectionObj();
    clientMap['createdBy'] = 'tempUid';

    try {
      await clientsCollection.add(clientMap);
    } catch (e) {
      print(e);
    }
  }
}

final newClientFormKeyProvider = StateProvider((ref) => GlobalKey<FormState>());

final newClientFormProvider =
    StateProvider<NewClientForms>((ref) => NewClientForms());

class NewClientForms {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController nickName = TextEditingController();
  TextEditingController martialStatus = TextEditingController();
  TextEditingController birthDay = TextEditingController();
  TextEditingController birthMonth = TextEditingController();
  TextEditingController birthYear = TextEditingController();
  TextEditingController age = TextEditingController();

  Client toClientObj() {
    return Client(
      firstName.text,
      lastName.text,
      nickName.text,
      DateTime.utc(int.parse(birthYear.text) - 543, int.parse(birthMonth.text),
          int.parse(birthDay.text)),
      int.parse(age.text),
    );
  }
}

final clientsProvider = StreamProvider<List<Client>>((ref) async* {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var allClient = const <Client>[];

  await for (var snapshot in firestore
      .collection(cClients)
      // .where('createdBy', isEqualTo: user.uid)
      .snapshots()) {
    allClient = [];

    if (snapshot.docs.isNotEmpty) {
      for (DocumentSnapshot clientDoc in snapshot.docs) {
        // List<dynamic> colorList = colorPaletteDoc.get('colorPalette');
        // List<Color> colorPalette = List.generate(
        //   colorList.length,
        //   (index) => hexToColor(colorList[index]),
        // );

        // ColorPaletteDoc savedColorPalette =
        //     ColorPaletteDoc(colorPaletteDoc.id, colorPalette);
        // savedColorPalette.timeCreated = colorPaletteDoc.get('timeCreated');
        Client client = Client(
          clientDoc.get('firstName'),
          clientDoc.get('lastName'),
          clientDoc.get('nickName'),
          clientDoc.get('dateOfBirth'),
          clientDoc.get('age'),
          clientDoc.get('uid'),
          clientDoc.get('createdBy'),
        );

        allClient = [...allClient, client];
        yield allClient;
      }
    } else {
      yield allClient;
    }
  }
});
