class DataPlanFormModel {
  final int? id;
  final String? phoneNumber;
  final String? pin;

  const DataPlanFormModel({
    this.id,
    this.phoneNumber,
    this.pin,
  });

  Map<String, dynamic> toJson() {
    return {
      'data_plan_id': id.toString(),
      'phone_number': phoneNumber,
      'pin': pin,
    };
  }
}
