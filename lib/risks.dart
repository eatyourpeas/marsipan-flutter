import 'dart:core';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Risk {
  final String category;
  final String colour;
  List<String> over18descriptions = [];
  List<String> under18descriptions = [];
  List<String> over18references = [];
  List<String> under18references = [];
  List<String> over18guidance = [];
  List<String> under18guidance = [];
  final String grade;
  final Color selectedColour;
  final Color selectedPaleColour;

  Risk(
      this.category,
      this.colour,
      this.over18descriptions,
      this.under18descriptions,
      this.over18references,
      this.under18references,
      this.over18guidance,
      this.under18guidance,
      this.grade,
      this.selectedColour,
      this.selectedPaleColour);
}

class RiskCategory {
  final String category;
  final IconData icon;
  final Risk red;
  final Risk amber;
  final Risk green;
  final Risk unscored;

  RiskCategory(this.category, this.icon, this.red, this.amber, this.green,
      this.unscored);
}

final riskCategoryNames = [
  'Weight loss',
  'BMI and weight',
  'HR (awake)',
  'Cardiovascular health',
  'Hydration status',
  'Temperature',
  'Muscular function: SUSS test',
  'Muscular function: hand grip strength',
  'Muscular function: MUAC',
  'Other clinical state',
  'ECG abnormalities',
  'Biochemical abnormalities',
  'Haematology',
  'Disordered eating behaviours',
  'Engagement with management plan',
  'Activity and exercise',
  'Purging behaviours',
  'Self harm and suicide'
];

List<Risk> scoredCategories = [
  marsipanRisks[3],
  marsipanRisks[7],
  marsipanRisks[11],
  marsipanRisks[15],
  marsipanRisks[19],
  marsipanRisks[23],
  marsipanRisks[27],
  marsipanRisks[31],
  marsipanRisks[35],
  marsipanRisks[39],
  marsipanRisks[43],
  marsipanRisks[47],
  marsipanRisks[51],
  marsipanRisks[55],
  marsipanRisks[59],
  marsipanRisks[63],
  marsipanRisks[67],
  marsipanRisks[71]
];

List<RiskCategory> marsipanCategories = [
  RiskCategory(
    'Weight loss',
    FontAwesomeIcons.scaleUnbalanced,
    marsipanRisks[0],
    marsipanRisks[1],
    marsipanRisks[2],
    marsipanRisks[3],
  ),
  RiskCategory('BMI and weight', FontAwesomeIcons.scaleBalanced,
      marsipanRisks[4], marsipanRisks[5], marsipanRisks[6], marsipanRisks[7]),
  RiskCategory('HR (awake)', FontAwesomeIcons.heart, marsipanRisks[8],
      marsipanRisks[9], marsipanRisks[10], marsipanRisks[11]),
  RiskCategory(
      'Cardiovascular health',
      FontAwesomeIcons.heart,
      marsipanRisks[12],
      marsipanRisks[13],
      marsipanRisks[14],
      marsipanRisks[15]),
  RiskCategory('Hydration status', FontAwesomeIcons.droplet, marsipanRisks[16],
      marsipanRisks[17], marsipanRisks[18], marsipanRisks[19]),
  RiskCategory('Temperature', Icons.ac_unit, marsipanRisks[20],
      marsipanRisks[21], marsipanRisks[22], marsipanRisks[23]),
  RiskCategory(
      'Muscular function: SUSS test',
      FontAwesomeIcons.personArrowUpFromLine,
      marsipanRisks[24],
      marsipanRisks[25],
      marsipanRisks[26],
      marsipanRisks[27]),
  RiskCategory(
      'Muscular function: hand grip strength',
      FontAwesomeIcons.handFist,
      marsipanRisks[28],
      marsipanRisks[29],
      marsipanRisks[30],
      marsipanRisks[31]),
  RiskCategory(
      'Muscular function: MUAC',
      FontAwesomeIcons.tape,
      marsipanRisks[32],
      marsipanRisks[33],
      marsipanRisks[34],
      marsipanRisks[35]),
  RiskCategory(
      'Other clinical state',
      FontAwesomeIcons.houseMedicalCircleExclamation,
      marsipanRisks[36],
      marsipanRisks[37],
      marsipanRisks[38],
      marsipanRisks[39]),
  RiskCategory(
      'ECG abnormalities',
      FontAwesomeIcons.heartCircleBolt,
      marsipanRisks[40],
      marsipanRisks[41],
      marsipanRisks[42],
      marsipanRisks[43]),
  RiskCategory(
      'Biochemical abnormalities',
      FontAwesomeIcons.syringe,
      marsipanRisks[44],
      marsipanRisks[45],
      marsipanRisks[46],
      marsipanRisks[47]),
  RiskCategory('Haematology', FontAwesomeIcons.droplet, marsipanRisks[48],
      marsipanRisks[49], marsipanRisks[50], marsipanRisks[51]),
  RiskCategory(
      'Disordered eating behaviours',
      FontAwesomeIcons.utensils,
      marsipanRisks[52],
      marsipanRisks[53],
      marsipanRisks[54],
      marsipanRisks[55]),
  RiskCategory(
      'Engagement with management plan',
      FontAwesomeIcons.handshakeSimple,
      marsipanRisks[56],
      marsipanRisks[57],
      marsipanRisks[58],
      marsipanRisks[59]),
  RiskCategory(
      'Activity and exercise',
      FontAwesomeIcons.personRunning,
      marsipanRisks[60],
      marsipanRisks[61],
      marsipanRisks[62],
      marsipanRisks[63]),
  RiskCategory(
      'Purging behaviours',
      FontAwesomeIcons.faceFrown,
      marsipanRisks[64],
      marsipanRisks[65],
      marsipanRisks[66],
      marsipanRisks[67]),
  RiskCategory(
      'Self harm and suicide',
      FontAwesomeIcons.faceSadTear,
      marsipanRisks[68],
      marsipanRisks[69],
      marsipanRisks[70],
      marsipanRisks[71]),
];

List<Risk> marsipanRisks = [
  // 'Weight loss'
  Risk(
      'Weight loss',
      'Red',
      [
        'Physical struggles with staff or parents/carers over nutrition or reduction of exercise',
        'Harm to self',
        'Poor insight or motivation',
        'Fear leading to resistance to weight gain',
        'Staff or parents/carers unable to implement meal plan prescribed',
      ],
      [
        'Physical struggles with staff or parents/carers over nutrition or reduction of exercise',
        'Harm to self',
        'Poor insight or motivation',
        'Fear leading to resistance to weight gain',
        'Staff or parents/carers unable to implement meal plan prescribed',
      ],
      [
        'Patients losing weight at higher BMI should be strategies to determine risk.'
      ],
      [
        'Patients losing weight at higher BMI should be strategies to determine risk.'
      ],
      [],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk(
      'Weight loss',
      'Amber',
      [
        'Recent loss of weight of 500–999g/week for 2 consecutive weeks in an undernourished patient',
      ],
      [
        'Recent loss of weight of 500–999g/week for 2 consecutive weeks in an undernourished patient',
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.amber,
      Colors.amber.shade100),
  Risk(
      'Weight loss',
      'Green',
      [
        'Recent weight loss of <500g/week or fluctuating weight',
      ],
      [
        'Recent weight loss of <500g/week or fluctuating weight',
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.green,
      Colors.green.shade100),
  Risk('Weight loss', 'White', ['Unscored'], ['Unscored'], [], [], [], [], '0',
      Colors.white, Colors.white),

  // 'BMI and weight'
  Risk(
      'BMI and weight',
      'Red',
      ['BMI <13'],
      ['m%BMI35 <70%'],
      [
        'Patients losing weight at higher BMI should be strategies to determine risk.'
      ],
      [
        'Patients losing weight at higher BMI should be strategies to determine risk.'
      ],
      [],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk('BMI and weight', 'Amber', ['BMI 13–14.9'], ['m%BMI 70– 80%'], [], [],
      [], [], '', Colors.amber, Colors.amber.shade100),
  Risk(
      'BMI and weight',
      'Green',
      ['BMI >15'],
      ['m%BMI >80%'],
      [],
      [
        'Note these do not denote a healthy weight but framework may better reflect risk.'
      ],
      [],
      [],
      '',
      Colors.green,
      Colors.green.shade100),
  Risk('BMI and weight', 'White', ['Unscored'], ['Unscored'], [], [], [], [],
      '0', Colors.white, Colors.white),

  // 'HR (awake)'
  Risk('HR (awake)', 'Red', ['<40'], ['<40'], [], [], [], [], '', Colors.red,
      Colors.red.shade100),
  Risk('HR (awake)', 'Amber', ['40-50'], ['40-50'], [], [], [], [], '',
      Colors.amber, Colors.amber.shade100),
  Risk('HR (awake)', 'Green', ['>50'], ['>50'], [], [], [], [], '',
      Colors.green, Colors.green.shade100),
  Risk('HR (awake)', 'White', ['Unscored'], ['Unscored'], [], [], [], [], '0',
      Colors.white, Colors.white),

  // 'Cardiovascular health'
  Risk(
      'Cardiovascular health',
      'Red',
      [
        'systolic BP less than 90mmHg, associated with recurrent syncope and postural drop in systolic BP of >20mmHg or increase in HR of over 30bpm'
      ],
      [
        'systolic BP below 0.4th centile for age, associated with recurrent syncope and postural drop in systolic BP of >20mmHg or increase in HR of over 30bpm (35bpm in <16 years)'
      ],
      [],
      [],
      ['https://pubmed.ncbi.nlm.nih.gov/24067349/'],
      ['https://www.nhlbi.nih.gov/files/docs/guidelines/child_tbl.pdf'],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk(
      'Cardiovascular health',
      'Amber',
      [
        'Standing systolic BP <0.4th centile associated with occasional syncope',
        'postural drop in systolic BP of >15mmHg or increase in HR of up to 30bpm (35bpm in <16 years)'
      ],
      [
        'Standing systolic BP <90mmHg if 18+ associated with occasional syncope; postural drop in systolic BP of >15mmHg or increase in HR of up to 30bpm (35bpm in <16 years)'
      ],
      [],
      [],
      ['https://pubmed.ncbi.nlm.nih.gov/24067349/'],
      ['https://www.nhlbi.nih.gov/files/docs/guidelines/child_tbl.pdf'],
      '',
      Colors.amber,
      Colors.amber.shade100),
  Risk(
      'Cardiovascular health',
      'Green',
      [
        'Normal standing systolic BP for age and gender with reference to centile charts',
        'Normal orthostatic cardiovascular changes'
      ],
      [
        'Normal standing systolic BP',
        'Normal orthostatic cardiovascular changes'
      ],
      [],
      [],
      ['https://pubmed.ncbi.nlm.nih.gov/24067349/'],
      ['https://www.nhlbi.nih.gov/files/docs/guidelines/child_tbl.pdf'],
      '',
      Colors.green,
      Colors.green.shade100),
  Risk('Cardiovascular health', 'White', ['Unscored'], ['Unscored'], [], [], [],
      [], '0', Colors.white, Colors.white),

  // 'Hydration status'
  Risk(
      'Hydration status',
      'Red',
      [
        'Fluid refusal',
        'Severe dehydration (10%): reduced urine output, dry mouth, postural BP drop (see Cardiovascular health) decreased skin turgor, sunken eyes, tachypnoea, tachycardia'
      ],
      [
        'Fluid refusal',
        'Severe dehydration (10%): reduced urine output, dry mouth, postural BP drop (see Cardiovascular health) decreased skin turgor, sunken eyes, tachypnoea, tachycardia'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk(
      'Hydration status',
      'Amber',
      [
        'Severe fluid restriction',
        'Moderate dehydration (5–10%): reduced urine output, dry mouth, postural BP drop (see above), normal skin turgor, some tachypnoea, some tachycardia, peripheral oedema'
      ],
      [
        'Severe fluid restriction',
        'Moderate dehydration (5–10%): reduced urine output, dry mouth, postural BP drop (see above), normal skin turgor, some tachypnoea, some tachycardia, peripheral oedema'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.amber,
      Colors.amber.shade100),
  Risk(
      'Hydration status',
      'Green',
      [
        'Minimal fluid restriction.',
        'No more than mild dehydration (<5%): may have dry mouth or concerns about risk of dehydration with negative fluid balance'
      ],
      [
        'Minimal fluid restriction.',
        'No more than mild dehydration (<5%): may have dry mouth or concerns about risk of dehydration with negative fluid balance'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.green,
      Colors.green.shade100),
  Risk('Hydration status', 'White', ['Unscored'], ['Unscored'], [], [], [], [],
      '0', Colors.white, Colors.white),

  // 'Temperature'
  Risk(
      'Temperature',
      'Red',
      ['<35.5°C tympanic or 35.0°C axillary'],
      ['<35.5°C tympanic or 35.0°C axillary'],
      [],
      [],
      [],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk('Temperature', 'Amber', ['<36°C'], ['<36°C'], [], [], [], [], '',
      Colors.amber, Colors.amber.shade100),
  Risk('Temperature', 'Green', ['>36°C'], ['>36°C'], [], [], [], [], '',
      Colors.green, Colors.green.shade100),
  Risk('Temperature', 'White', ['Unscored'], ['Unscored'], [], [], [], [], '0',
      Colors.white, Colors.white),

  // 'Muscular function: SUSS Test'
  Risk(
      'Muscular function: SUSS Test',
      'Red',
      [
        'Unable to sit up from lying flat, or to get up from squat at all or only by using upper limbs to help (Score 0 or 1)'
      ],
      [
        'Unable to sit up from lying flat, or to get up from squat at all or only by using upper limbs to help (Score 0 or 1)'
      ],
      ['SUSS Test = Sit Up-Stand–Squat'],
      ['SUSS Test = Sit Up-Stand–Squat'],
      [],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk(
      'Muscular function: SUSS Test',
      'Amber',
      [
        'Unable to sit up or stand from squat without noticeable difficulty (Score 2)'
      ],
      [
        'Unable to sit up or stand from squat without noticeable difficulty (Score 2)'
      ],
      ['No muscle function test has been researched in patients <18 years.'],
      ['SUSS Test = Sit Up-Stand–Squat'],
      ['SUSS Test = Sit Up-Stand–Squat'],
      [],
      '',
      Colors.amber,
      Colors.amber.shade100),
  Risk(
      'Muscular function: SUSS Test',
      'Green',
      [
        'Able to sit up from lying flat and stand from squat with no difficulty (Score 3)'
      ],
      [
        'Able to sit up from lying flat and stand from squat with no difficulty (Score 3)'
      ],
      ['SUSS Test = Sit Up-Stand–Squat'],
      ['SUSS Test = Sit Up-Stand–Squat'],
      [],
      [],
      '',
      Colors.green,
      Colors.green.shade100),
  Risk('Muscular function: SUSS Test', 'White', ['Unscored'], ['Unscored'], [],
      [], [], [], '0', Colors.white, Colors.white),

  // 'Muscular function: hand grip strength'
  Risk(
      'Muscular function: hand grip strength',
      'Red',
      ['Male <30.5kg, Female <17.5kg (3rd percentile)'],
      ['No muscle function test has been researched in patients <18 years.'],
      [],
      [],
      ['https://pubmed.ncbi.nlm.nih.gov/19129352/'],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk(
      'Muscular function: hand grip strength',
      'Amber',
      ['Male <38kg, Female <23kg (5th percentile)'],
      ['No muscle function test has been researched in patients <18 years.'],
      [],
      [],
      ['https://pubmed.ncbi.nlm.nih.gov/19129352/'],
      [],
      '',
      Colors.amber,
      Colors.amber.shade100),
  Risk(
      'Muscular function: hand grip strength',
      'Green',
      ['Male >38kg, Female >23kg'],
      ['No muscle function test has been researched in patients <18 years.'],
      [],
      [],
      ['https://pubmed.ncbi.nlm.nih.gov/19129352/'],
      [],
      '',
      Colors.green,
      Colors.green.shade100),
  Risk('Muscular function: hand grip strength', 'White', ['Unscored'],
      ['Unscored'], [], [], [], [], '0', Colors.white, Colors.white),

  // 'Muscular function: MUAC'
  Risk(
      'Muscular function: MUAC',
      'Red',
      ['<18cm (approx. BMI<13)'],
      ['MUAC has not been evaluated in children and young people'],
      [],
      [],
      ['https://pubmed.ncbi.nlm.nih.gov/12765671/'],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk(
      'Muscular function: MUAC',
      'Amber',
      ['18–20cm (approx. BMI<15.5)'],
      ['MUAC has not been evaluated in children and young people'],
      [],
      [],
      ['https://pubmed.ncbi.nlm.nih.gov/12765671/'],
      [],
      '',
      Colors.amber,
      Colors.amber.shade100),
  Risk(
      'Muscular function: MUAC',
      'Green',
      ['>20cm (approx. BMI >15.5)'],
      ['MUAC has not been evaluated in children and young people'],
      [],
      [],
      ['https://pubmed.ncbi.nlm.nih.gov/12765671/'],
      [],
      '',
      Colors.green,
      Colors.green.shade100),
  Risk('Muscular function: MUAC', 'White', ['Unscored'], ['Unscored'], [], [],
      [], [], '0', Colors.white, Colors.white),

  // 'Other clinical state'
  Risk(
      'Other clinical state',
      'Red',
      [
        'Life-threatening medical condition, e.g. severe haematemesis, acute confusion, severe cognitive slowing, diabetic ketoacidosis, upper gastrointestinal perforation, significant alcohol consumption'
      ],
      [
        'Life-threatening medical condition, e.g. severe haematemesis, acute confusion, severe cognitive slowing, diabetic ketoacidosis, upper gastrointestinal perforation, significant alcohol consumption'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk(
      'Other clinical state',
      'Amber',
      [
        'Non-life-threatening physical compromise, e.g. mild haematemesis, pressure sores'
      ],
      [
        'Non-life-threatening physical compromise, e.g. mild haematemesis, pressure sores'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.amber,
      Colors.amber.shade100),
  Risk(
      'Other clinical state',
      'Green',
      [
        'Evidence of physical compromise, e.g. poor cognitive flexibility, poor concentration'
      ],
      [
        'Evidence of physical compromise, e.g. poor cognitive flexibility, poor concentration'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.green,
      Colors.green.shade100),
  Risk('Other clinical state', 'White', ['Unscored'], ['Unscored'], [], [], [],
      [], '0', Colors.white, Colors.white),

  // 'ECG abnormalities'
  Risk(
      'ECG abnormalities',
      'Red',
      [
        'QTc >450ms (females), 430ms (males)',
        'And any other significant ECG abnormality'
      ],
      [
        'QTc >460ms (female), 450ms (male)',
        'And any other significant ECG abnormality'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk(
      'ECG abnormalities',
      'Amber',
      [
        'QTc >450ms (females), >430ms (males).',
        'And no other ECG anomaly',
        'Taking medication known to prolong QTc interval'
      ],
      [
        'QTc >460ms (female), 450ms (male)',
        'And no other ECG anomaly',
        'Taking medication known to prolong QTc interval'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.amber,
      Colors.amber.shade100),
  Risk(
      'ECG abnormalities',
      'Green',
      ['QTc <450ms (females), <430ms (males)'],
      ['QTc <460ms (female), 450ms (male)'],
      [],
      [],
      [],
      [],
      '',
      Colors.green,
      Colors.green.shade100),
  Risk('ECG abnormalities', 'White', ['Unscored'], ['Unscored'], [], [], [], [],
      '0', Colors.white, Colors.white),

  // 'Biochemical abnormalities'
  Risk(
      'Biochemical abnormalities',
      'Red',
      [
        'Hypophosphataemia and falling phosphate',
        'Hypokalaemia (<2.5mmol/L)',
        'Hypoalbuminaemia  Hypoglycaemia',
        '3mmol/L)',
        'Hyponatraemia',
        'Hypocalcaemia',
        'Transaminases >3x normal range',
        'Inpatients with diabetes mellitus: HbA1C >10% (86mmol/mol)'
      ],
      [
        'Hypophosphataemia and falling phosphate',
        'Hypokalaemia (<2.5mmol/L)',
        'Hypoalbuminaemia  Hypoglycaemia',
        '3mmol/L)',
        'Hyponatraemia',
        'Hypocalcaemia',
        'Transaminases >3x normal range',
        'Inpatients with diabetes mellitus: HbA1C >10% (86mmol/mol)'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk('Biochemical abnormalities', 'Amber', [], [], [], [], [], [], '',
      Colors.amber, Colors.amber.shade100),
  Risk('Biochemical abnormalities', 'Green', [], [], [], [], [], [], '',
      Colors.green, Colors.green.shade100),
  Risk('Biochemical abnormalities', 'White', ['Unscored'], ['Unscored'], [], [],
      [], [], '0', Colors.white, Colors.white),

  // 'Haematology'
  Risk('Haematology', 'Red', ['Low white cell count', 'Haemoglobin <10g/L'], [],
      [], [], [], [], '', Colors.red, Colors.red.shade100),
  Risk('Haematology', 'Amber', [], [], [], [], [], [], '', Colors.amber,
      Colors.amber.shade100),
  Risk('Haematology', 'Green', [], [], [], [], [], [], '', Colors.green,
      Colors.green.shade100),
  Risk('Haematology', 'White', ['Unscored'], ['Unscored'], [], [], [], [], '0',
      Colors.white, Colors.white),

  // 'Disordered eating behaviours'
  Risk(
      'Disordered eating behaviours',
      'Red',
      [
        'Acute food refusal or estimated calorie intake <500kcal/day for 2+ days'
      ],
      [],
      [],
      [],
      [],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk('Disordered eating behaviours', 'Amber', [], [], [], [], [], [], '',
      Colors.amber, Colors.amber.shade100),
  Risk('Disordered eating behaviours', 'Green', [], [], [], [], [], [], '',
      Colors.green, Colors.green.shade100),
  Risk('Disordered eating behaviours', 'White', ['Unscored'], ['Unscored'], [],
      [], [], [], '0', Colors.white, Colors.white),

  // 'Engagement with management plan'
  Risk(
      'Engagement with management plan',
      'Red',
      [
        'Physical struggles with staff or parents/carers over nutrition or reduction of exercise',
        'Harm to self',
        'Poor insight or motivation',
        'Fear leading to resistance to weight gain',
        'Staff or parents/carers unable to implement meal plan prescribed'
      ],
      [
        'Physical struggles with staff or parents/carers over nutrition or reduction of exercise',
        'Harm to self',
        'Poor insight or motivation',
        'Fear leading to resistance to weight gain',
        'Staff or parents/carers unable to implement meal plan prescribed'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk(
      'Engagement with management plan',
      'Amber',
      [
        'Poor insight or motivation',
        'Resistance to weight gain',
        'Staff or parents/carers unable to implement meal plan prescribed',
        'Some insight and motivation to tackle eating problems',
        'Fear leading to some ambivalence but not actively resisting'
      ],
      [
        'Poor insight or motivation',
        'Resistance to weight gain',
        'Staff or parents/carers unable to implement meal plan prescribed',
        'Some insight and motivation to tackle eating problems',
        'Fear leading to some ambivalence but not actively resisting'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.amber,
      Colors.amber.shade100),
  Risk(
      'Engagement with management plan',
      'Green',
      [
        'Some insight and motivation to tackle eating problems',
        'May be ambivalent but not actively resisting'
      ],
      [
        'Some insight and motivation to tackle eating problems',
        'May be ambivalent but not actively resisting'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.green,
      Colors.green.shade100),
  Risk('Engagement with management plan', 'White', ['Unscored'], ['Unscored'],
      [], [], [], [], '0', Colors.white, Colors.white),

  // 'Activity and exercise'
  Risk(
      'Activity and exercise',
      'Red',
      [
        'High levels of dysfunctional exercise in the context of malnutrition (>2h/day)'
      ],
      [
        'High levels of dysfunctional exercise in the context of malnutrition (>2h/day)'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk(
      'Activity and exercise',
      'Amber',
      [
        'Moderate levels of dysfunctional exercise in the context of malnutrition (>1h/day)'
      ],
      [
        'Moderate levels of dysfunctional exercise in the context of malnutrition (>1h/day)'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.amber,
      Colors.amber.shade100),
  Risk(
      'Activity and exercise',
      'Green',
      [
        'Mild levels of or no dysfunctional exercise in the context of malnutrition (<1h/day)'
      ],
      [
        'Mild levels of or no dysfunctional exercise in the context of malnutrition (<1h/day)'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.green,
      Colors.green.shade100),
  Risk('Activity and exercise', 'White', ['Unscored'], ['Unscored'], [], [], [],
      [], '0', Colors.white, Colors.white),

  // 'Purging behaviours'
  Risk(
      'Purging behaviours',
      'Red',
      ['Multiple daily episodes of vomiting and/or laxative abuse'],
      ['Multiple daily episodes of vomiting and/or laxative abuse'],
      [],
      [],
      [],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk(
      'Purging behaviours',
      'Amber',
      ['Regular (=>3x per week) vomiting and/or laxative abuse'],
      ['Regular (=>3x per week) vomiting and/or laxative abuse'],
      [],
      [],
      [],
      [],
      '',
      Colors.amber,
      Colors.amber.shade100),
  Risk('Purging behaviours', 'Green', [], [], [], [], [], [], '', Colors.green,
      Colors.green.shade100),
  Risk('Purging behaviours', 'White', ['Unscored'], ['Unscored'], [], [], [],
      [], '0', Colors.white, Colors.white),

  // 'Self harm and suicide'
  Risk(
      'Self harm and suicide',
      'Red',
      [
        'Self-poisoning, suicidal ideas with moderate to high risk of completed suicide'
      ],
      [
        'Self-poisoning, suicidal ideas with moderate to high risk of completed suicide'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.red,
      Colors.red.shade100),
  Risk(
      'Self harm and suicide',
      'Amber',
      [
        'Cutting or similar behaviours, suicidal ideas with low risk of completed suicide'
      ],
      [
        'Cutting or similar behaviours, suicidal ideas with low risk of completed suicide'
      ],
      [],
      [],
      [],
      [],
      '',
      Colors.amber,
      Colors.amber.shade100),
  Risk('Self harm and suicide', 'Green', [], [], [], [], [], [], '',
      Colors.green, Colors.green.shade100),
  Risk('Self harm and suicide', 'White', ['Unscored'], ['Unscored'], [], [], [],
      [], '0', Colors.white, Colors.white),
];
