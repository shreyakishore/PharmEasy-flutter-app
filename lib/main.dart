import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';

void main() => runApp(new MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multiple Selection demo",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
//        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Flutter demo - Multiselect'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _State createState() => _State();
}

class Item {
  const Item(this.name);
  final String name;
}

class _State extends State<MyHomePage> {
  String medicine = "";
  String appropriateMedicine;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final nameTextBox = TextEditingController();
  final ageTextBox = TextEditingController();
  final compulsoryKey = GlobalKey<FormState>();

  String name;

  int age;
  Item selectedGender;
  List<Item> genders = [
    const Item('Female'),
    const Item('Male'),
    const Item('others')
  ];
  @override
  void dispose() {
    nameTextBox.dispose();
    ageTextBox.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen Navigation demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('PharmEasy'),
        ),
        body: Form(
          key: compulsoryKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(
                          left: 40.0,
                        ),
                        child: Container(
                          child: Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blueGrey,
                            ),
                          ),
                        )),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        right: 40.0,
                      ),
                      width: 850,
                      child: new TextFormField(
                        validator: (value) {
                          if (value.isEmpty) return 'Please enter name';
                          return null;
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(
                          left: 40.0,
                        ),
                        child: Container(
                          child: Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blueGrey,
                            ),
                          ),
                        )),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        right: 40.0,
                      ),
                      width: 850,
                      child: new TextFormField(
//                        key: ageKey,
//                    readOnly: true,
                        validator: (value) {
                          if (value.isEmpty) return ('Please enter age');
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(
                          left: 40.0,
                        ),
                        child: Container(
                          child: Text(
                            'Gender',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blueGrey,
                            ),
                          ),
                        )),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        right: 40.0,
                      ),
                      width: 850,
                      child: Center(
                        child: DropdownButton<Item>(
                          hint: Text('Choose Gender'),
                          value: selectedGender,
                          onChanged: (Item Value) {
                            setState(() {
                              selectedGender = Value;
                            });
                          },
                          items: genders.map((Item gender) {
                            return DropdownMenuItem<Item>(
                              value: gender,
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Text(
                                    gender.name,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 15.0,
              ),
              Center(
                child: new Form(
                  key: formKey,
                  autovalidate: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, top: 10, right: 30, bottom: 15),
                        child: new MultiSelect(
                          autovalidate: true,
                          titleText: 'Choose Symptoms',
                          titleTextColor: Colors.blueGrey,
                          validator: (dynamic value) {
                            if (value == null) {
                              return 'Please select one or more symptom(s)';
                            }
                            return null;
                          },
                          errorText: 'Please select one or more symptom(s)',
                          selectedOptionsInfoTextColor: Colors.black,
                          dataSource: [
                            {"Symptom": "Dry cough", "code": "DryCough"},
                            {"Symptom": "Wet cough", "code": "WetCough"},
                            {"Symptom": "Cold (Nose block)", "code": "Cold"},
                            {"Symptom": "Runny Nose", "code": "RunnyNose"},
                            {"Symptom": "Headache", "code": "HeadAche"},
                            {"Symptom": "Fever", "code": "Fever"},
                            {"Symptom": "Body ache", "code": "BodyAche"},
                            {
                              "Symptom": "Stomach bloating",
                              "code": "StomachBloating"
                            },
                            {"Symptom": "Acidity", "code": "Acidity"},
                            {"Symptom": "Diarrhea", "code": "Diarrhea"},
                            {"Symptom": "Constipation", "code": "Constipation"},
                            {"Symptom": "Vomiting", "code": "Vomiting"},
                            {"Symptom": "Eye allergy", "code": "EyeAllergy"},
                            {"Symptom": "Nose itching", "code": "NoseItching"},
                            {"Symptom": "Sneezes", "code": "Sneezes"},
                          ],
                          textField: "Symptom",
                          valueField: "code",
                          filterable: true,
                          required: true,
                          onSaved: (value) {
                            print('The value is $value');
                            medicine = null;
                            print(value.runtimeType);
                            setState(() {
                              medicine = findMedicine(value);
                            });
                            print("Medicine : $medicine");
                          },
                          selectIcon: Icons.arrow_drop_down_circle,
                          saveButtonColor: Theme.of(context).primaryColor,
                          checkBoxColor: Theme.of(context).primaryColorDark,
                          cancelButtonColor:
                              Theme.of(context).primaryColorLight,
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        width: 180,
                        height: 35,
                        child: RaisedButton(
                          child: Text(
                            'Get medicine',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if (compulsoryKey.currentState.validate())
                              _onFormSaved();
                          },
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 0.0,
                ),
                child: Container(
                  child: Text(
                    //medicine head
                    '',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: Text(
                    medicine,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueGrey,
//                    fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onFormSaved() {
    final FormState form = formKey.currentState;
    form.save();
  }

  String findMedicine(List symptomsList) {
    Map<String, int> rankOfMedicine = {
      "Dolo": 0,
      "Cetrizine": 0,
      "Oflox": 0,
      "Excof": 0,
      "Cheston": 0,
      "Dulcolax": 0,
      "Pantoprazole": 0,
      "Bisacodyl": 0,
      "Racecodril": 0,
      "Metoclopromide": 0,
      "Diphenhydramine": 0,
    };
    Map<String, List<String>> medicineAndTheSymptoms = {
      "Dolo": ["BodyAche", "HeadAche", "Fever"],
      "Cetrizine": ["RunnyNose", "EyeAllergy", "NoseItching", "Sneezes"],
      "Oflox": ["Fever"],
      "Excof": ["DryCough"],
      "Cheston": ["RunnyNose"],
      "Dulcolax": ["Nausea", "Vomiting", "Diarrhea"],
      "Pantoprazole": ["Acidity"],
      "Bisacodyl": ["Constipation"],
      "Racecodril": ["Diarrhea"],
      "Metoclopromide": ["Vomiting"],
      "Diphenhydramine": ["WetCough"],
    };
    medicineAndTheSymptoms.forEach((key, value) {
      print("Value :");
      print(value);
      value.removeWhere((element) => !symptomsList.contains(element));
      print(value);
      rankOfMedicine[key] = value.length;
      print("Rank of $key : $rankOfMedicine[key]");
    });
    int maxRank = 0;
    rankOfMedicine.forEach((key, value) {
      if (value > maxRank) {
        maxRank = value;
        appropriateMedicine = key;
      }
    });
    return appropriateMedicine.toUpperCase();
  }
}
