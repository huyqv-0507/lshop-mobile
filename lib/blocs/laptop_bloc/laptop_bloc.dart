import 'dart:async';

import 'package:laptop_mobile/models/repos/laptop_model/laptop.dart';
import 'package:laptop_mobile/repositories/laptop_repository.dart';
import 'package:rxdart/subjects.dart';

class LaptopBloc {
  //Controll All Laptop data
  var fetchLaptopsController = PublishSubject<List<Laptop>>();
  Sink<List<Laptop>> get fetchLaptopsSink => fetchLaptopsController.sink;
  Stream<List<Laptop>> get fetchLaptopsStream => fetchLaptopsController.stream;

  final laptopRepos = LaptopRepository();

  //Get all laptops from database
  fetchAllLaptops() async {
    await laptopRepos
        .fetchLaptops()
        .then((value) => {fetchLaptopsSink.add(value)})
        .catchError((onError) => fetchLaptopsController.addError('$onError'));
  }

  void dispose() {
    fetchLaptopsController.close();
  }
}

final LaptopBloc laptopBloc = LaptopBloc();
