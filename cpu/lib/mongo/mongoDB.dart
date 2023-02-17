import 'dart:developer';

import 'package:cpu/mongo/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase{
  static connect() async {
    var db= await Db.create(mongoURL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(collectionName);
  }
}