

import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class Risk {
  final String category;
  final String colour;
  final String description;
  final String grade;
  final Color selectedColour;

  Risk(this.category, this.colour, this.description, this.grade, this.selectedColour);

//  factory Risk.fromJson(Map<String, dynamic> json) {
//    return Risk(
//      category: json['category'] as String,
//      colour: json['colour'] as String,
//      description: json['description'] as String,
//        grade: json['grade'] as String
//    );
//  }
//
//  Map<String, dynamic> toJson() {
//    return {
//      'category': category,
//      'colour': colour,
//      'description': description,
//      'grade': grade
//    };
//  }
}

class RiskCategory {
  final String category;
  final IconData icon;
  final Risk red;
  final Risk amber;
  final Risk green;
  final Risk blue;
  final Risk unscored;

  RiskCategory(this.category, this.icon, this.red, this.amber, this.green, this.blue, this.unscored);

//  factory RiskCategory.fromJson(Map<String, dynamic> json) {
//    return RiskCategory(
//      category: json['category'] as String,
//      icon: json['icon'] as IconData
//    );
//  }
//
//  Map<String, dynamic> toJson() {
//    return {
//      'category': category,
//      'icon': icon
//    };
//  }
}

List<Risk> scoredCategories = [
  marsipanRisks[4],
  marsipanRisks[9],
  marsipanRisks[14],
  marsipanRisks[19],
  marsipanRisks[24],
  marsipanRisks[29],
  marsipanRisks[34],
  marsipanRisks[39],
  marsipanRisks[44],
  marsipanRisks[49],
  marsipanRisks[54],
  marsipanRisks[59],
  marsipanRisks[64]
];

List<RiskCategory> marsipanCategories = [
  RiskCategory('Body Mass', LineAwesomeIcons.balance_scale, marsipanRisks[0], marsipanRisks[1], marsipanRisks[2], marsipanRisks[3], marsipanRisks[4]),
  RiskCategory('Cardiovascular Health', LineAwesomeIcons.heart, marsipanRisks[5], marsipanRisks[6], marsipanRisks[7], marsipanRisks[8], marsipanRisks[9]),
  RiskCategory('ECG Abnormalities', LineAwesomeIcons.heartbeat, marsipanRisks[10], marsipanRisks[11], marsipanRisks[12], marsipanRisks[13], marsipanRisks[14]),
  RiskCategory('Hydration Status', LineAwesomeIcons.tint, marsipanRisks[15], marsipanRisks[16], marsipanRisks[17], marsipanRisks[18], marsipanRisks[19]),
  RiskCategory('Temperature', Icons.ac_unit, marsipanRisks[20], marsipanRisks[21], marsipanRisks[22], marsipanRisks[23], marsipanRisks[24]),
  RiskCategory('Biochemical Abnormalities', LineAwesomeIcons.ambulance, marsipanRisks[25], marsipanRisks[26], marsipanRisks[27], marsipanRisks[28], marsipanRisks[29]),
  RiskCategory('Calorie Intake', LineAwesomeIcons.battery_half, marsipanRisks[30], marsipanRisks[31], marsipanRisks[32], marsipanRisks[33], marsipanRisks[34]),
  RiskCategory('Engagement With Management Plan', LineAwesomeIcons.comments, marsipanRisks[35], marsipanRisks[36], marsipanRisks[37], marsipanRisks[38], marsipanRisks[39]),
  RiskCategory('Activity and Exercise', LineAwesomeIcons.bicycle, marsipanRisks[40], marsipanRisks[41], marsipanRisks[42], marsipanRisks[43], marsipanRisks[44]),
  RiskCategory('Self Harm and Suicide', LineAwesomeIcons.frown_o, marsipanRisks[45], marsipanRisks[46], marsipanRisks[47], marsipanRisks[48], marsipanRisks[49]),
  RiskCategory('Muscular Weakness', LineAwesomeIcons.hand_grab_o, marsipanRisks[50], marsipanRisks[51], marsipanRisks[52], marsipanRisks[53], marsipanRisks[54]),
  RiskCategory('Other Mental Health Diagnoses', LineAwesomeIcons.hand_peace_o, marsipanRisks[55], marsipanRisks[56], marsipanRisks[57], marsipanRisks[58], marsipanRisks[59]),
  RiskCategory('Other', LineAwesomeIcons.stethoscope, marsipanRisks[60], marsipanRisks[61], marsipanRisks[62], marsipanRisks[63], marsipanRisks[64])
];

List<Risk> marsipanRisks = [
  Risk('Body Mass', 'Red', 'Percentage Median BMI <70 [Approximates to below 0.4th BMI centile] OR Recent loss of weight of 1kg or more/week for two consecutive weeks', '', Colors.red),
  Risk('Body Mass', 'Amber', 'Percentage Median BMI 70-80% [Approximates to between 2nd and 0.4th BMI centile] OR Recent loss of weight of 500g-999g/week for two consecutive weeks', '', Colors.amber),
  Risk ('Body Mass', 'Green', 'Percentage Median BMI 80-85% [Approximates to between 9th and 2nd BMI centile] OR Recent weight loss of up to 500g/week for two consecutive weeks', '', Colors.green),
  Risk('Body Mass','Blue','Percentage Median BMI>85% [Approximates to above 9th BMI centile] OR No weight loss over past two weeks','', Colors.blue),
  Risk('Body Mass','White', 'Unscored', '0', Colors.white),
  Risk('Cardiovascular Health', 'Red', 'Heart rate (awake) <40 bpm. History of Recurrent Syncope. Marked orthostatic changes (fall in systolic blood pressure of 20mmHg or more, or below 0.4th-2nd centiles for age, or increase in heart rate up to 30bpm)', '', Colors.red),
  Risk('Cardiovascular Health','Amber','Heart rate (awake) 40-50bpm. Sitting Blood Pressure: Systolic below 0.4th centile (84-98mmHg depending on age and sex). Diastolic: below 0.4th centile (35-40 mmHg depending on age and sex). Moderate orthostatic cardiovascular changes (fall in systolic blood pressure of 15mmHg or more, or diastolic blood pressure fall of 10mmHg or more within 3 mins standing, or increase in heart rate up to 30bpm). Occasional syncope','', Colors.amber),
  Risk('Cardiovascular Health', 'Green','Heart rate (awake) 50-60bpm. Sitting Blood Pressure: Systolic below 2nd centile (88 - 105mmHg depending on age and sex), Diastolic below 2nd centile (40 - 45mmHg depending on age and sex). Pre-syncopal symptoms but no orthostatic cardiovascular changes. Cool peripheries.<br>Prolonged peripheral capillary refill time (normal central capillary refill time)','', Colors.green),
  Risk('Cardiovascular Health', 'Blue', 'Heart rate (awake) >60bpm. Normal sitting blood pressure for age and sex with reference to centile charts. Normal orthostatic cardiovascular changes. Normal heart rhythm', '', Colors.blue),
  Risk('Cardiovascular Health','White', 'Unscored', '0', Colors.white),
  Risk('ECG Abnormalities', 'Red', 'Irregular heart rhythm (does not include sinus arrhythmia). QTc >450 ms with evidence of bradyarrhythmia or tachyarrhythmia (excludes sinus bradycardia and sinus arrhythmia). ECG evidence of biochemical abnormality', '', Colors.red),
  Risk('ECG Abnormalities', 'Amber', 'QTc >450ms', '', Colors.amber),
  Risk('ECG Abnormalities', 'Green', 'QTc < 450ms AND taking medication known to prolong QTc interval. Family history of prolonged QTc or deafness', '', Colors.green),
  Risk('ECG Abnormalities', 'Blue', 'QTc < 450ms', '', Colors.blue),
  Risk('ECG Abnormalities','White', 'Unscored', '0', Colors.white),
  Risk('Hydration Status', 'Red', 'Severe dehydration (10%): Reduced urine output, Dry mouth, Decreased skin turgor, sunken eyes, Tachypnoea, Tachycardia', '', Colors.red),
  Risk('Hydration Status', 'Amber', 'Moderate dehydration (5-10%). Reduced urine output. Dry mouth. Normal skin turgor. Some tachypnoea. Some tachycardia. Peripheral oedema', '', Colors.amber),
  Risk('Hydration Status', 'Green', 'Mild (less than 5%). May have dry mouth or not clinically dehydrated but with concerns about risk of dehydration with negative fluid balance.', '', Colors.green),
  Risk('Hydration Status', 'Blue', 'Not clinically dehydrated', '', Colors.blue),
  Risk('Hydration Status','White', 'Unscored', '0', Colors.white),
  Risk('Temperature', 'Red', 'below 35.5 degrees Celsius (tympanic) OR below 35.0 degrees Celsius axillary', '',Colors.red),
  Risk('Temperature', 'Amber', 'below 36 degrees Celsius', '', Colors.amber),
  Risk('Temperature', 'Green', 'Normal', '', Colors.green),
  Risk('Temperature','Blue','Normal','', Colors.blue),
  Risk('Temperature','White', 'Unscored', '0', Colors.white),
  Risk('Biochemical Abnormalities','Red','Hypophosphataemia, Hypokalaemia, Hyponatraemia, Hypocalcaemia','', Colors.red),
  Risk('Biochemical Abnormalities','Amber','Hypophosphataemia. Hypokalaemia. Hyponatraemia. Hypocalcaemia.','', Colors.amber),
  Risk('Biochemical Abnormalities','Green','Normal Results', '', Colors.green),
  Risk('Biochemical Abnormalities','Blue','Normal Results', '', Colors.blue),
  Risk('Biochemical Abnormalities','White', 'Unscored', '0', Colors.white),
  Risk('Calorie Intake','Red','Acute food refusal OR estimated calorie intake 400-600kcal per day','', Colors.red),
  Risk('Calorie Intake','Amber','Severe restriction (less than 50% of required intake). Vomiting. Purging with laxatives','', Colors.amber),
  Risk('Calorie Intake','Green','Moderate restriction. Bingeing.','', Colors.green),
  Risk('Calorie Intake','Blue','Mild Restriction. No Bingeing','', Colors.blue),
  Risk('Calorie Intake','White', 'Unscored', '0', Colors.white),
  Risk('Engagement With Management Plan','Red','Violent when parents try to limit behaviour or encourage food/fluid intake. Parental violence in relation to feeding (hitting, force feeding)','', Colors.red),
  Risk('Engagement With Management Plan','Amber','Poor insight into eating problems. Lacks motivation to tackle eating problems. Resistance to changes required to gain weight. Parents unable to implement meal plan advice given by health care providers','', Colors.amber),
  Risk('Engagement With Management Plan','Green','Some insight into eating problems. Some motivation to tackle eating problems, ambivalent towards changes required to gain weight but not actively resisting.','', Colors.green),
  Risk('Engagement With Management Plan','Blue','Some insight into eating problems. Motivated to tackle eating problems, ambivalence towards changes required to gain weight not apparent in behaviour','', Colors.blue),
  Risk('Engagement With Management Plan','White', 'Unscored', '0', Colors.white),
  Risk('Activity and Exercise','Red','High levels of uncontrolled exercise (2hrs per day)','',Colors.red),
  Risk('Activity and Exercise','Amber','Moderate levels of uncontrolled exercise (>1 hr per day)','', Colors.amber),
  Risk('Activity and Exercise','Green','Mild levels of uncontrolled exercise (less than 1 hr per day).','', Colors.green),
  Risk('Activity and Exercise','Blue','No uncontrolled exercise','', Colors.blue),
  Risk('Activity and Exercise','White', 'Unscored', '0', Colors.white),
  Risk('Self Harm and Suicide','Red','Self poisoning. Suicidal ideas with moderate-high risk of completed suicide','', Colors.red),
  Risk('Self Harm and Suicide','Amber','Cutting or similar behaviours. Suicidal ideas with low risk of completed suicide','', Colors.amber),
  Risk('Self Harm and Suicide','Green','No self harm/suicide.','', Colors.green),
  Risk('Self Harm and Suicide','Blue','No self harm/suicide','', Colors.blue),
  Risk('Self Harm and Suicide','White', 'Unscored', '0', Colors.white),
  Risk('Muscular Weakness','Red','Sit Up, Squat, Stand test: Unable to get up at all from squatting (score 0). Unable to sit up at all from lying flat (score 0)','',Colors.red),
  Risk('Muscular Weakness','Amber','Sit Up, Squat, Stand test: Unable to get up from squatting without using upper limbs (score 1) OR Unable to sit up from lying flat without using upper limbs (score 1)','', Colors.amber),
  Risk('Muscular Weakness','Green','Sit Up, Squat, Stand test - Unable to get up without noticeable difficulty (score 2) OR Unable to sit up from lying flat without noticeable difficulty (score 2)','', Colors.green),
  Risk('Muscular Weakness','Blue','Sit Up, Squat, Stand test. Stands up from squat without any difficulty (score 3) OR Sits up from lying flat without any difficulty (score 3)','', Colors.blue),
  Risk('Muscular Weakness','White', 'Unscored', '0', Colors.white),
  Risk('Other Mental Health Diagnoses','Red','Confusion and delirium<','', Colors.red),
  Risk('Other Mental Health Diagnoses','Amber','Other major psychiatric co-diagnosis eg OCD, psychosis, depression','', Colors.amber),
  Risk('Other Mental Health Diagnoses','Green','Poor attention and concentration','', Colors.green),
  Risk('Other Mental Health Diagnoses','Blue','No other issues','', Colors.blue),
  Risk('Other Mental Health Diagnoses','White', 'Unscored', '0', Colors.white),
  Risk('Other', 'red', 'Acute Pancreatitis. Gastric or oesophageal rupture.', '', Colors.red),
  Risk('Other','Amber','Mallory Weiss Tear. Gastro-oesophageal reflux. Gastritis. Pressure sores','', Colors.amber),
  Risk('Other','Green','No other issues','', Colors.green),
  Risk('Other','Blue','No other issues','', Colors.blue),
  Risk('Other','White', 'Unscored', '0', Colors.white)
];

//final marsipanData = [
//  {
//    'category': 'Body Mass',
//    'colour': 'Red',
//    'description': 'Percentage Median BMI <70 [Approximates to below 0.4th BMI centile] OR Recent loss of weight of 1kg or more/week for two consecutive weeks',
//    'grade': ''
//  },
//  {
//    'category': 'Body Mass',
//    'colour': 'Amber',
//    'description': 'Percentage Median BMI 70-80% [Approximates to between 2nd and 0.4th BMI centile] OR Recent loss of weight of 500g-999g/week for two consecutive weeks',
//    'grade': ''
//  },
//  {
//    'category': 'Body Mass',
//    'colour': 'Green',
//    'description': 'Percentage Median BMI 80-85% [Approximates to between 9th and 2nd BMI centile] OR Recent weight loss of up to 500g/week for two consecutive weeks',
//    'grade': ''
//  },
//  {
//    'category': 'Body Mass',
//    'colour': 'Blue',
//    'description': 'Percentage Median BMI>85% [Approximates to above 9th BMI centile] OR No weight loss over past two weeks',
//    'grade': ''
//  },
//  {
//    'category': 'Cardiovascular Health',
//    'colour': 'Red',
//    'description': 'Heart rate (awake) <40 bpm. History of Recurrent Syncope. Marked orthostatic changes (fall in systolic blood pressure of 20mmHg or more, or below 0.4th-2nd centiles for age, or increase in heart rate up to 30bpm)',
//    'grade': ''
//  },
//  {
//    'category': 'Cardiovascular Health',
//    'colour': 'Amber',
//    'description': 'Heart rate (awake) 40-50bpm. Sitting Blood Pressure: Systolic below 0.4th centile (84-98mmHg depending on age and sex). Diastolic: below 0.4th centile (35-40 mmHg depending on age and sex). Moderate orthostatic cardiovascular changes (fall in systolic blood pressure of 15mmHg or more, or diastolic blood pressure fall of 10mmHg or more within 3 mins standing, or increase in heart rate up to 30bpm). Occasional syncope',
//    'grade': ''
//  },
//  {
//    'category': 'Cardiovascular Health',
//    'colour': 'Green',
//    'description': 'Heart rate (awake) 50-60bpm. Sitting Blood Pressure: Systolic below 2nd centile (88 - 105mmHg depending on age and sex), Diastolic below 2nd centile (40 - 45mmHg depending on age and sex). Pre-syncopal symptoms but no orthostatic cardiovascular changes. Cool peripheries.<br>Prolonged peripheral capillary refill time (normal central capillary refill time)',
//    'grade': ''
//  },
//  {
//    'category': 'Cardiovascular Health',
//    'colour': 'Blue',
//    'description': 'Heart rate (awake) >60bpm. Normal sitting blood pressure for age and sex with reference to centile charts. Normal orthostatic cardiovascular changes. Normal heart rhythm',
//    'grade': ''
//  },
//  {
//    'category': 'ECG Abnormalities',
//    'colour': 'Red',
//    'description': 'Irregular heart rhythm (does not include sinus arrhythmia). QTc >450 ms with evidence of bradyarrhythmia or tachyarrhythmia (excludes sinus bradycardia and sinus arrhythmia). ECG evidence of biochemical abnormality',
//    'grade': ''
//  },
//  {
//    'category': 'ECG Abnormalities',
//    'colour': 'Amber',
//    'description': 'QTc >450ms',
//    'grade': ''
//  },
//  {
//    'category': 'ECG Abnormalities',
//    'colour': 'Green',
//    'description': 'QTc < 450ms AND taking medication known to prolong QTc interval. Family history of prolonged QTc or deafness',
//    'grade': ''
//  },
//  {
//    'category': 'ECG Abnormalities',
//    'colour': 'Blue',
//    'description': 'QTc < 450ms',
//    'grade': ''
//  },
//  {
//    'category': 'Hydration Status',
//    'colour': 'Red',
//    'description': 'Severe dehydration (10%): Reduced urine output, Dry mouth, Decreased skin turgor, sunken eyes, Tachypnoea, Tachycardia',
//    'grade': ''
//  },
//  {
//    'category': 'Hydration Status',
//    'colour': 'Amber',
//    'description': 'Moderate dehydration (5-10%). Reduced urine output. Dry mouth. Normal skin turgor. Some tachypnoea. Some tachycardia. Peripheral oedema',
//    'grade': ''
//  },
//  {
//    'category': 'Hydration Status',
//    'colour': 'Green',
//    'description': 'Mild (less than 5%). May have dry mouth or not clinically dehydrated but with concerns about risk of dehydration with negative fluid balance.',
//    'grade': ''
//  },
//  {
//    'category': 'Hydration Status',
//    'colour': 'Blue',
//    'description': 'Not clinically dehydrated',
//    'grade': ''
//  },
//  {
//    'category': 'Temperature',
//    'colour': 'Red',
//    'description': '", "below 35.5 degrees Celsius (tympanic) OR below 35.0 degrees Celsius axillary',
//    'grade': ''
//  },
//  {
//    'category': 'Temperature',
//    'colour': 'Amber',
//    'description': 'below 36 degrees Celsius',
//    'grade': ''
//  },
//  {
//    'category': 'Temperature',
//    'colour': 'Green',
//    'description': 'Normal',
//    'grade': ''
//  },
//  {
//    'category': 'Temperature',
//    'colour': 'Blue',
//    'description': 'Normal',
//    'grade': ''
//  },
//  {
//    'category': 'Biochemical Abnormalities',
//    'colour': 'Red',
//    'description': 'Hypophosphataemia, Hypokalaemia, Hyponatraemia, Hypocalcaemia',
//    'grade': ''
//  },
//  {
//    'category': 'Biochemical Abnormalities',
//    'colour': 'Amber',
//    'description': 'Hypophosphataemia. Hypokalaemia. Hyponatraemia. Hypocalcaemia.',
//    'grade': ''
//  },
//  {
//    'category': 'Biochemical Abnormalities',
//    'colour': 'Green',
//    'description': 'Normal Results',
//    'grade': ''
//  },
//  {
//    'category': 'Biochemical Abnormalities',
//    'colour': 'Blue',
//    'description': '", "Normal Results',
//    'grade': ''
//  },
//  {
//    'category': 'Calorie Intake',
//    'colour': 'Red',
//    'description': 'Acute food refusal OR estimated calorie intake 400-600kcal per day',
//    'grade': ''
//  },
//  {
//    'category': 'Calorie Intake',
//    'colour': 'Amber',
//    'description': 'Severe restriction (less than 50% of required intake). Vomiting. Purging with laxatives',
//    'grade': ''
//  },
//  {
//    'category': 'Calorie Intake',
//    'colour': 'Green',
//    'description': 'Moderate restriction. Bingeing.',
//    'grade': ''
//  },
//  {
//    'category': 'Calorie Intake',
//    'colour': 'Blue',
//    'description': 'Mild Restriction. No Bingeing',
//    'grade': ''
//  },
//  {
//    'category': 'Engagement With Management Plan',
//    'colour': 'Red',
//    'description': 'Violent when parents try to limit behaviour or encourage food/fluid intake. Parental violence in relation to feeding (hitting, force feeding)',
//    'grade': ''
//  },
//  {
//    'category': 'Engagement With Management Plan',
//    'colour': 'Amber',
//    'description': 'Poor insight into eating problems. Lacks motivation to tackle eating problems. Resistance to changes required to gain weight. Parents unable to implement meal plan advice given by health care providers',
//    'grade': ''
//  },
//  {
//    'category': 'Engagement With Management Plan',
//    'colour': 'Green',
//    'description': 'Some insight into eating problems. Some motivation to tackle eating problems, ambivalent towards changes required to gain weight but not actively resisting.',
//    'grade': ''
//  },
//  {
//    'category': 'Engagement With Management Plan',
//    'colour': 'Blue',
//    'description': 'Some insight into eating problems. Motivated to tackle eating problems, ambivalence towards changes required to gain weight not apparent in behaviour',
//    'grade': ''
//  },
//  {
//    'category': 'Activity and Exercise',
//    'colour': 'Red',
//    'description': 'High levels of uncontrolled exercise (2hrs per day)',
//    'grade': ''
//  },
//  {
//    'category': 'Activity and Exercise',
//    'colour': 'Amber',
//    'description': 'Moderate levels of uncontrolled exercise (>1 hr per day)',
//    'grade': ''
//  },
//  {
//    'category': 'Activity and Exercise',
//    'colour': 'Green',
//    'description': 'Mild levels of uncontrolled exercise (less than 1 hr per day).',
//    'grade': ''
//  },
//  {
//    'category': 'Activity and Exercise',
//    'colour': 'Blue',
//    'description': 'No uncontrolled exercise',
//    'grade': ''
//  },
//  {
//    'category': 'Self Harm and Suicide',
//    'colour': 'Red',
//    'description': 'Self poisoning. Suicidal ideas with moderate-high risk of completed suicide',
//    'grade': ''
//  },
//  {
//    'category': 'Self Harm and Suicide',
//    'colour': 'Amber',
//    'description': 'Cutting or similar behaviours. Suicidal ideas with low risk of completed suicide',
//    'grade': ''
//  },
//  {
//    'category': 'Self Harm and Suicide',
//    'colour': 'Green',
//    'description': 'No self harm/suicide.',
//    'grade': ''
//  },
//  {
//    'category': 'Self Harm and Suicide',
//    'colour': 'Blue',
//    'description': 'No self harm/suicide',
//    'grade': ''
//  },
//  {
//    'category': 'Muscular Weakness',
//    'colour': 'Red',
//    'description': ', "Sit Up, Squat, Stand test: Unable to get up at all from squatting (score 0). Unable to sit up at all from lying flat (score 0)',
//    'grade': ''
//  },
//  {
//    'category': 'Muscular Weakness',
//    'colour': 'Amber',
//    'description': 'Sit Up, Squat, Stand test: Unable to get up from squatting without using upper limbs (score 1) OR Unable to sit up from lying flat without using upper limbs (score 1)',
//    'grade': ''
//  },
//  {
//    'category': 'Muscular Weakness',
//    'colour': 'Green',
//    'description': '", "Sit Up, Squat, Stand test - Unable to get up without noticeable difficulty (score 2) OR Unable to sit up from lying flat without noticeable difficulty (score 2)',
//    'grade': ''
//  },
//  {
//    'category': 'Muscular Weakness',
//    'colour': 'Blue',
//    'description': 'Sit Up, Squat, Stand test. Stands up from squat without any difficulty (score 3) OR Sits up from lying flat without any difficulty (score 3)',
//    'grade': ''
//  },
//  {
//    'category': 'Other Mental Health Diagnoses',
//    'colour': 'Red',
//    'description': 'Confusion and delirium<',
//    'grade': ''
//  },
//  {
//    'category': 'Other Mental Health Diagnoses',
//    'colour': 'Amber',
//    'description': 'Other major psychiatric co-diagnosis eg OCD, psychosis, depression',
//    'grade': ''
//  },
//  {
//    'category': 'Other Mental Health Diagnoses',
//    'colour': 'Green',
//    'description': 'Poor attention and concentration',
//    'grade': ''
//  },
//  {
//    'category': 'Other Mental Health Diagnoses',
//    'colour': 'Blue',
//    'description': 'No other issues',
//    'grade': ''
//  },
//  {
//    'category': 'Other',
//    'colour': 'Red',
//    'description': 'Acute Pancreatitis</h3><h3>Gastric or oesophageal rupture.',
//    'grade': ''
//  },
//  {
//    'category': 'Other',
//    'colour': 'Amber',
//    'description': 'Mallory Weiss Tear. Gastro-oesophageal reflux. Gastritis. Pressure sores',
//    'grade': ''
//  },
//  {
//    'category': 'Other',
//    'colour': 'Green',
//    'description': 'No other issues',
//    'grade': ''
//  },
//  {
//    'category': 'Other',
//    'colour': 'Blue',
//    'description': 'No other issues',
//    'grade': ''
//  }
//];
//
//final marsipanRiskCategories = [
//  {
//    'category': "Body Mass",
//    'icon': Icon(LineAwesomeIcons.balance_scale)
//  },
//  {
//    'category': "Cardiovascular Health",
//    'icon': Icon(LineAwesomeIcons.heart)
//  },
//  {
//    'category': "ECG Abnormalities",
//    'icon': Icon(LineAwesomeIcons.heartbeat)
//  },
//  {
//    'category': "Hydration Status",
//    'icon': Icon(LineAwesomeIcons.tint)
//  },
//  {
//    'category': "Temperature",
//    'icon': Icon(Icons.ac_unit)
//  },
//  {
//    'category': "Biochemical Abnormalities",
//    'icon': Icon(LineAwesomeIcons.ambulance)
//  },
//  {
//    'category': "Calorie Intake",
//    'icon': Icon(LineAwesomeIcons.battery_half)
//  },
//  {
//    'category': "Engagement With Management Plan",
//    'icon': Icon(LineAwesomeIcons.comments)
//  },
//  {
//    'category': "Activity and Exercise",
//    'icon': Icon(LineAwesomeIcons.bicycle)
//  },
//  {
//    'category': "Self Harm and Suicide",
//    'icon': Icon(LineAwesomeIcons.frown_o)
//  },
//  {
//    'category': "Muscular Weakness",
//    'icon': Icon(LineAwesomeIcons.hand_grab_o)
//  },
//  {
//    'category': "Other Mental Health Diagnoses",
//    'icon': Icon(LineAwesomeIcons.hand_peace_o)
//  },
//  {
//    'category':   "Other",
//    'icon': Icon(LineAwesomeIcons.stethoscope)
//  }
//];