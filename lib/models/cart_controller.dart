import 'package:get/get.dart';
import 'package:newtruck/models/apis.dart';
import 'package:collection/collection.dart';
import 'package:newtruck/models/invoice.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
            () => CartController());
  }
}

class CartController extends GetxController{
  final _products ={}.obs;

  void addProduct(trucksfrom product){
    if(_products.containsKey(product)){
      _products[product] +=1;
    }else{
      _products[product] =1;
    }
    Get.snackbar(
      "Product Added",
      "Item added to the cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );

  }
  void removeProduct(trucksfrom product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
    Get.snackbar(
      "Product Removed",
      "Item removed from cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  get products => _products;

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries.isEmpty ? 0 :
      _products.entries
          .map((product) => product.key.price * product.value)
          .toList()
          .reduce((value, element) => value + element).toStringAsFixed(2);

// get listofproduct => _products.entries.map((item) {InvoiceItem(
//     imageurl: "${item.imageurl}",
//     description: item.model,
//     date: DateTime.now(),
//     unitPrice: double.parse(item.price)
// );}).toList();




}


