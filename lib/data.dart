class Data {
  bool selected = false;
  String percentage = '';
  bool isFemale = false;
  double? weight = 0.0;
  double? weightSDS = 0.0;
  String? weightCentile = '';
  double? height = 0.0;
  double? heightSDS = 0.0;
  String? heightCentile = '';
  double? bmi = 0.0;
  double? bmiSDS = 0.0;
  String? bmiCentile = '';
  double? pctMBMI = 0.0;
  double? eightyFivePCTWeight = 0.0;
  double? ninetyPCTWeight = 0.0;
  double? ninetyFivePCTWeight = 0.0;
  double? hundredPCTWeight = 0.0;
  DateTime clinicDate = DateTime.now();
  DateTime dobDate = DateTime.now();
  double? decimalAge = 0.0;
  String? chronologicalAge = "";
  Data(
      {required this.selected,
      required this.percentage,
      required this.isFemale,
      required this.height,
      required this.weight,
      required this.eightyFivePCTWeight,
      required this.ninetyPCTWeight,
      required this.ninetyFivePCTWeight,
      required this.clinicDate,
      required this.dobDate});
}

class AdultBMIData {
  bool validated = false;
  double weight = 0.0;
  double height = 0.0;
  String result = '';
  double bmi = 0.0;
  bool isImperial = true;
  bool isWeight = false;
  String weightString = "stone.pounds";
  String heightString = "feet.inches";
  String weightUnits = "stone";
  String heightUnits = "feet";
  double eighteenPointFive = 0.0;

  AdultBMIData(
      {required this.validated,
      required this.weight,
      required this.height,
      required this.result,
      required this.bmi,
      required this.isImperial,
      required this.eighteenPointFive,
      required this.isWeight,
      required this.heightString,
      required this.heightUnits,
      required this.weightString,
      required this.weightUnits});
}
