import 'dart:convert';

Courier courierFromJson(String str) => Courier.fromJson(json.decode(str));

String courierToJson(Courier data) => json.encode(data.toJson());

class Courier {
  Courier({
    required this.code,
    required this.name,
    required this.costs,
  });

  String code;
  String name;
  List<CourierCost> costs;

  factory Courier.fromJson(Map<String, dynamic> json) => Courier(
        code: json["code"],
        name: json["name"],
        costs: List<CourierCost>.from(
            json["costs"].map((x) => CourierCost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "costs": List<dynamic>.from(costs.map((x) => x.toJson())),
      };
}

class CourierCost {
  CourierCost({
    required this.service,
    required this.description,
    required this.cost,
  });

  String service;
  String description;
  List<CostCost> cost;

  factory CourierCost.fromJson(Map<String, dynamic> json) => CourierCost(
        service: json["service"],
        description: json["description"],
        cost:
            List<CostCost>.from(json["cost"].map((x) => CostCost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "service": service,
        "description": description,
        "cost": List<dynamic>.from(cost.map((x) => x.toJson())),
      };

  static List<Courier> fromJsonList(List list) {
    if (list.length == null) return List<Courier>.empty();
    return list.map((item) => Courier.fromJson(item)).toList();
  }
}

class CostCost {
  CostCost({
    required this.value,
    required this.etd,
    required this.note,
  });

  int value;
  String etd;
  String note;

  factory CostCost.fromJson(Map<String, dynamic> json) => CostCost(
        value: json["value"],
        etd: json["etd"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "etd": etd,
        "note": note,
      };
}
