

import 'dart:convert';

List<Categorys> categorysFromJson(String str) =>
    List<Categorys>.from(json.decode(str).map((x) => Categorys.fromJson(x)));

String categorysToJson(List<Categorys> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categorys {
  Id id;
  String menuCategoryId;
  String menuId;
  StoreId storeId;
  Title title;
  Title subTitle;
  List<MenuEntity> menuEntities;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdBy;
  String modifiedBy;

  Categorys({
    required this.id,
    required this.menuCategoryId,
    required this.menuId,
    required this.storeId,
    required this.title,
    required this.subTitle,
    required this.menuEntities,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory Categorys.fromJson(Map<String, dynamic> json) => Categorys(
        id: idValues.map[json["ID"]]!,
        menuCategoryId: json["MenuCategoryID"],
        menuId: json["MenuID"],
        storeId: storeIdValues.map[json["StoreID"]]!,
        title: Title.fromJson(json["Title"]),
        subTitle: Title.fromJson(json["SubTitle"]),
        menuEntities: List<MenuEntity>.from(
            json["MenuEntities"].map((x) => MenuEntity.fromJson(x))),
        createdDate: DateTime.parse(json["CreatedDate"]),
        modifiedDate: DateTime.parse(json["ModifiedDate"]),
        createdBy: json["CreatedBy"],
        modifiedBy: json["ModifiedBy"],
      );

  Map<String, dynamic> toJson() => {
        "ID": idValues.reverse[id],
        "MenuCategoryID": menuCategoryId,
        "MenuID": menuId,
        "StoreID": storeIdValues.reverse[storeId],
        "Title": title.toJson(),
        "SubTitle": subTitle.toJson(),
        "MenuEntities": List<dynamic>.from(menuEntities.map((x) => x.toJson())),
        "CreatedDate": createdDate.toIso8601String(),
        "ModifiedDate": modifiedDate.toIso8601String(),
        "CreatedBy": createdBy,
        "ModifiedBy": modifiedBy,
      };
}

enum Id { THE_66750_A6_E57_DF26_F5_B75_C4_C42 }

final idValues = EnumValues(
    {"66750a6e57df26f5b75c4c42": Id.THE_66750_A6_E57_DF26_F5_B75_C4_C42});

class MenuEntity {
  String id;
  Type type;

  MenuEntity({
    required this.id,
    required this.type,
  });

  factory MenuEntity.fromJson(Map<String, dynamic> json) => MenuEntity(
        id: json["ID"],
        type: typeValues.map[json["Type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Type": typeValues.reverse[type],
      };
}

enum Type { ITEM }

final typeValues = EnumValues({"ITEM": Type.ITEM});

enum StoreId { THE_660_E347_E2_FD190588_DF12_AFE }

final storeIdValues = EnumValues(
    {"660e347e2fd190588df12afe": StoreId.THE_660_E347_E2_FD190588_DF12_AFE});

class Title {
  String en;

  Title({
    required this.en,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
