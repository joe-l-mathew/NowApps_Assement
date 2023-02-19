class ProductModel {
  bool? status;
  String? message;
  Data? data;

  ProductModel({this.status, this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Products>? products;

  Data({this.products});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? prodImage;
  String? prodId;
  String? prodCode;
  String? barCode;
  String? prodName;
  String? uOM;
  String? unitId;
  String? prodCombo;
  String? isFocused;
  String? groupIds;
  String? categoryIds;
  String? unitFromValue;
  String? unitToValue;
  String? uomAlternateName;
  String? uomAlternateId;
  String? underWarranty;
  String? groupId;
  String? catId;
  String? prodHsnId;
  String? prodHsnCode;
  String? prodShortName;
  String? prodPrice;
  String? prodMrp;
  String? prodBuy;
  String? prodSell;
  String? prodFreeItem;
  String? prodRkPrice;
  int? dbId;

  Products(
      {this.prodImage,
      this.prodId,
      this.prodCode,
      this.barCode,
      this.prodName,
      this.uOM,
      this.unitId,
      this.prodCombo,
      this.isFocused,
      this.groupIds,
      this.categoryIds,
      this.unitFromValue,
      this.unitToValue,
      this.uomAlternateName,
      this.uomAlternateId,
      this.underWarranty,
      this.groupId,
      this.catId,
      this.prodHsnId,
      this.prodHsnCode,
      this.prodShortName,
      this.prodPrice,
      this.prodMrp,
      this.prodBuy,
      this.prodSell,
      this.prodFreeItem,
      this.dbId,
      this.prodRkPrice});

  Products.fromJson(Map<String, dynamic> json) {
    prodImage = json['prodImage'];
    prodId = json['prodId'];
    prodCode = json['prodCode'];
    barCode = json['barCode'];
    prodName = json['prodName'];
    uOM = json['UOM'];
    unitId = json['unit_id'];
    prodCombo = json['prod_combo'];
    isFocused = json['is_focused'];
    groupIds = json['group_ids'];
    categoryIds = json['category_ids'];
    unitFromValue = json['unit_from_value'];
    unitToValue = json['unit_to_value'];
    uomAlternateName = json['uom_alternate_name'];
    uomAlternateId = json['uom_alternate_id'];
    underWarranty = json['under_warranty'];
    groupId = json['groupId'];
    catId = json['catId'];
    prodHsnId = json['prodHsnId'];
    prodHsnCode = json['prodHsnCode'];
    prodShortName = json['prodShortName'];
    prodPrice = json['prodPrice'];
    prodMrp = json['prodMrp'];
    prodBuy = json['prodBuy'];
    prodSell = json['prodSell'];
    prodFreeItem = json['prodFreeItem'];
    prodRkPrice = json['prodRkPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prodImage'] = prodImage;
    data['prodId'] = prodId;
    data['prodCode'] = prodCode;
    data['barCode'] = barCode;
    data['prodName'] = prodName;
    data['UOM'] = uOM;
    data['unit_id'] = unitId;
    data['prod_combo'] = prodCombo;
    data['is_focused'] = isFocused;
    data['group_ids'] = groupIds;
    data['category_ids'] = categoryIds;
    data['unit_from_value'] = unitFromValue;
    data['unit_to_value'] = unitToValue;
    data['uom_alternate_name'] = uomAlternateName;
    data['uom_alternate_id'] = uomAlternateId;
    data['under_warranty'] = underWarranty;
    data['groupId'] = groupId;
    data['catId'] = catId;
    data['prodHsnId'] = prodHsnId;
    data['prodHsnCode'] = prodHsnCode;
    data['prodShortName'] = prodShortName;
    data['prodPrice'] = prodPrice;
    data['prodMrp'] = prodMrp;
    data['prodBuy'] = prodBuy;
    data['prodSell'] = prodSell;
    data['prodFreeItem'] = prodFreeItem;
    data['prodRkPrice'] = prodRkPrice;
    return data;
  }
}
