# MaRSiPAN

![alt text](https://github.com/eatyourpeas/marsipan-flutter/blob/main/~/assets/images/marsipan_2019_alpha.png?raw=true)

## Background
Clinical assessment of malnutrition to ascribe risk is hard to do as malnutrition is often a slowly progressive and indolent state, gradually deteriorating from compensating to decompensating. Important factors, apart from BMI, seem to be rate of weight loss, as well as physiological parameters reflecting degree of compensation (particularly cardiovascular).
MaRSIPAN sought to bring what is know and has been published from guidance around the world and put it into a practical framework to guide clinicians to make reasonable and sensible assessments and recommendations. Advice exists for adults and children and hitherto has been in 2 separa documents: [Adult MaRSiPAN](https://www.rcpsych.ac.uk/docs/default-source/improving-care/better-mh-policy/college-reports/college-report-cr189.pdf?sfvrsn=6c2e7ada_2) and [Junior MaRSiPAN](https://www.rcpsych.ac.uk/docs/default-source/improving-care/better-mh-policy/college-reports/college-report-cr168.pdf)

The risk assessment tool for Junior MaRSiPAN is the most mature and has been in active use for several years. There is an iOS app (Swift) and android app, as well as javascript (node) webapp that calculate risks based on this guidance.

In 2019, following a national survey, the faculty of eating disorders decided to join the two documents. This new app not yet live will form the basis of any mobile apps that will act as a 'calculator' for the updated Risk Assessment Tool. Flutter was not a mature framework when first the apps were written, but that has all changed so Dart and Flutter are used for this project going forward. 

The other repositories for the android and ios apps will remain as legacy but will not be maintained once the new MaRSiPAN guidance has been published, it is hoped, in 2021.

## What you get.
1. Risk Assessment Tool: this is a traffic light interface to score risk from malnutrition in eating disorders and guide decision-making in clinical practice
2. %mBMI calculator - this contains UK90 normative growth data (which is licensed to MRC) and compares the absolute BMI of the young person being assessed with the median BMI for age and sex, expressed as a percentage.

## Getting Started

1. Install [Flutter](https://flutter.dev/?gclid=CjwKCAjwmrn5BRB2EiwAZgL9orOhV9LfnZa3VwJ_myl1TidQtNAb8tFEXB6cS5D46wfzScvje3o4MRoCrJgQAvD_BwE&gclsrc=aw.ds)
2. Install Android and XCode with the SDKs
3. Clone the repo
4. ```Flutter run```

## Contribution
Do please post issues or send pull requests if you are interested in contributing to this project. Or contact me on [@eatyourpeas](https://twitter.com/eatyourpeas)
