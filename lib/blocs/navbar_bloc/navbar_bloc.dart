import 'package:rxdart/subjects.dart';

class NavbarBloc {
  var navItemController = PublishSubject<int>();
  Sink<int> get navItemSink => navItemController.sink;
  Stream<int> get navItemStream => navItemController.stream;

  void dispose() {
    navItemController.close();
  }
}

final NavbarBloc navbarBloc = NavbarBloc();
