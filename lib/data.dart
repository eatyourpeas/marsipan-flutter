class Data {
  bool selected = false;
  String percentage = '';
  bool isFemale = false;
  double weight = 0.0;
  double weight_sds = 0.0;
  String weight_centile = '';
  double height = 0.0;
  double height_sds = 0.0;
  String height_centile = '';
  double bmi = 0.0;
  double bmi_sds = 0.0;
  String bmi_centile = '';
  double pct_mbmi = 0.0;
  double eighty_five_pct_weight = 0.0;
  double ninety_pct_weight = 0.0;
  double ninety_five_pct_weight = 0.0;
  double hundred_pct_weight = 0.0;
  DateTime clinicDate = DateTime.now();
  DateTime dobDate = DateTime.now();
  double decimal_age = 0.0;
  String chronological_age = "";
  Data({this.selected, this.percentage, this.isFemale, this.height, this.weight, this.eighty_five_pct_weight, this.ninety_pct_weight, this.ninety_five_pct_weight, this.clinicDate, this.dobDate});
}