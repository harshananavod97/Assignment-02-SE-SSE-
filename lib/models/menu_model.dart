class Menu {
  final String id;
  final String menuID;
  final String verticalID;
  final String storeID;
  final String title;
  final String? subtitle;
  final String? description;
  final Map<String, TimePeriod> menuAvailability;
  final List<String> menuCategoryIDs;
  final String createdDate;
  final String modifiedDate;
  final String createdBy;
  final String modifiedBy;

  Menu({
    required this.id,
    required this.menuID,
    required this.verticalID,
    required this.storeID,
    required this.title,
    this.subtitle,
    this.description,
    required this.menuAvailability,
    required this.menuCategoryIDs,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  // Factory constructor to create a Menu instance from a JSON object
  factory Menu.fromJson(Map<String, dynamic> json) {
    var availabilityJson = json['MenuAvailability'] as Map<String, dynamic>;
    Map<String, TimePeriod> availability = {};

    // Parse each day for the availability
    availabilityJson.forEach((day, value) {
      availability[day] = TimePeriod.fromJson(value);
    });

    return Menu(
      id: json['ID'] ?? '',
      menuID: json['MenuID'] ?? '',
      verticalID: json['VerticalID'] ?? '',
      storeID: json['StoreID'] ?? '',
      title: json['Title']?['en'] ?? '',
      subtitle: json['SubTitle'],
      description: json['Description'],
      menuAvailability: availability,
      menuCategoryIDs: List<String>.from(json['MenuCategoryIDs'] ?? []),
      createdDate: json['CreatedDate'] ?? '',
      modifiedDate: json['ModifiedDate'] ?? '',
      createdBy: json['CreatedBy'] ?? '',
      modifiedBy: json['ModifiedBy'] ?? '',
    );
  }

  // Method to extract only the menuCategoryIDs and title
  Map<String, dynamic> extractIDsAndNames() {
    return {
      'menuCategoryIDs': menuCategoryIDs,
      'title': title,
    };
  }
}

class TimePeriod {
  final String startTime;
  final String endTime;

  TimePeriod({
    required this.startTime,
    required this.endTime,
  });

  factory TimePeriod.fromJson(Map<String, dynamic> json) {
    return TimePeriod(
      startTime: json['StartTime'] ?? '',
      endTime: json['EndTime'] ?? '',
    );
  }
}
