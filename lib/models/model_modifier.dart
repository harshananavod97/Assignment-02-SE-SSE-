class ModifierGroup {
  String id;
  String modifierGroupID;
  Description title;
  Description description;
  String storeID;
  String displayType;
  List<ModifierOption> modifierOptions;
  QuantityConstraintsRules quantityConstraintsRules;
  String createdDate;
  String modifiedDate;
  MetaData? metaData;

  ModifierGroup({
    required this.id,
    required this.modifierGroupID,
    required this.title,
    required this.description,
    required this.storeID,
    required this.displayType,
    required this.modifierOptions,
    required this.quantityConstraintsRules,
    required this.createdDate,
    required this.modifiedDate,
    this.metaData,
  });

  factory ModifierGroup.fromJson(Map<String, dynamic> json) {
    var modifierOptionsList = (json['ModifierOptions'] as List)
        .map((item) => ModifierOption.fromJson(item))
        .toList();

    return ModifierGroup(
      id: json['ID'],
      modifierGroupID: json['ModifierGroupID'],
      title: Description.fromJson(json['Title']),
      description: Description.fromJson(json['Description']),
      storeID: json['StoreID'],
      displayType: json['DisplayType'],
      modifierOptions: modifierOptionsList,
      quantityConstraintsRules:
          QuantityConstraintsRules.fromJson(json['QuantityConstraintsRules']),
      createdDate: json['CreatedDate'],
      modifiedDate: json['ModifiedDate'],
      metaData:
          json['MetaData'] != null ? MetaData.fromJson(json['MetaData']) : null,
    );
  }
}

class ModifierOption {
  String id;
  String type;

  ModifierOption({required this.id, required this.type});

  factory ModifierOption.fromJson(Map<String, dynamic> json) {
    return ModifierOption(
      id: json['Id'],
      type: json['Type'],
    );
  }
}

class QuantityConstraintsRules {
  QuantityQuantity quantity;
  dynamic overrides;

  QuantityConstraintsRules({required this.quantity, this.overrides});

  factory QuantityConstraintsRules.fromJson(Map<String, dynamic> json) {
    return QuantityConstraintsRules(
      quantity: QuantityQuantity.fromJson(json['Quantity']),
      overrides: json['Overrides'],
    );
  }
}

class QuantityQuantity {
  int minPermitted;
  int maxPermitted;
  bool isMinPermittedOptional;
  int chargeAbove;
  int refundUnder;
  int minPermittedUnique;
  int maxPermittedUnique;

  QuantityQuantity({
    required this.minPermitted,
    required this.maxPermitted,
    required this.isMinPermittedOptional,
    required this.chargeAbove,
    required this.refundUnder,
    required this.minPermittedUnique,
    required this.maxPermittedUnique,
  });

  factory QuantityQuantity.fromJson(Map<String, dynamic> json) {
    return QuantityQuantity(
      minPermitted: json['MinPermitted'],
      maxPermitted: json['MaxPermitted'],
      isMinPermittedOptional: json['IsMinPermittedOptional'],
      chargeAbove: json['ChargeAbove'],
      refundUnder: json['RefundUnder'],
      minPermittedUnique: json['MinPermittedUnique'],
      maxPermittedUnique: json['MaxPermittedUnique'],
    );
  }
}

class MetaData {
  String createdBy;
  String createdDate;
  String modifiedBy;
  String modifiedDate;

  MetaData({
    required this.createdBy,
    required this.createdDate,
    required this.modifiedBy,
    required this.modifiedDate,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      createdBy: json['CreatedBy'],
      createdDate: json['CreatedDate'],
      modifiedBy: json['ModifiedBy'],
      modifiedDate: json['ModifiedDate'],
    );
  }
}

class Description {
  String en;

  Description({required this.en});

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      en: json[
          'en'], // Assuming the 'en' field exists in the JSON for localization
    );
  }
}
