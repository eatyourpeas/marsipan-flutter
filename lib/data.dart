class Data {
  bool selected = false;
  String percentage = '';
  bool isFemale = false;
  double weight = 0.0;
  double weightSDS = 0.0;
  String weightCentile = '';
  double height = 0.0;
  double heightSDS = 0.0;
  String heightCentile = '';
  double bmi = 0.0;
  double bmiSDS = 0.0;
  String bmiCentile = '';
  double pctMBMI = 0.0;
  double eightyFivePCTWeight = 0.0;
  double ninetyPCTWeight = 0.0;
  double ninetyFivePCTWeight = 0.0;
  double hundredPCTWeight = 0.0;
  DateTime clinicDate = DateTime.now();
  DateTime dobDate = DateTime.now();
  double decimalAge = 0.0;
  String chronologicalAge = "";
  Data(
      {this.selected,
      this.percentage,
      this.isFemale,
      this.height,
      this.weight,
      this.eightyFivePCTWeight,
      this.ninetyPCTWeight,
      this.ninetyFivePCTWeight,
      this.clinicDate,
      this.dobDate});
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
      {this.validated,
      this.weight,
      this.height,
      this.result,
      this.bmi,
      this.isImperial,
      this.eighteenPointFive,
      this.isWeight,
      this.heightString,
      this.heightUnits,
      this.weightString,
      this.weightUnits});
}
