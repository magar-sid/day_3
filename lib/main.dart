import 'package:day_6/shared.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Abc());
}

class Abc extends StatelessWidget {
  const Abc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => CVForm(),
        '/sharedPreferences': (context) =>
            SharedPreferencesList(), // Add this route
      },
    );
  }
}

class CVForm extends StatefulWidget {
  const CVForm({super.key});

  @override
  _CVFormState createState() => _CVFormState();
}

class _CVFormState extends State<CVForm> {
  final _formKey = GlobalKey<FormState>();

  // Personal Details Controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();

  // Work Experience Controllers
  final TextEditingController _companyNameController = TextEditingController();
  DateTime? _workStartDate;
  DateTime? _workEndDate;

  // Education Controllers
  final TextEditingController _organizationNameController =
      TextEditingController();
  final TextEditingController _achievementsController = TextEditingController();
  String? _educationLevel;
  DateTime? _educationStartDate;
  DateTime? _educationEndDate;

  // Skills
  final List<String> _selectedSkills = [];
  final List<String> _allSkills = [
    'Flutter',
    'Dart',
    'Java',
    'Python',
    'JavaScript'
  ];

  // Gender
  String? _gender;

  // Date Picker Function
  Future<void> _selectDate(
      BuildContext context, bool isStartDate, bool isEducation) async {
    final DateTime initialDate = isStartDate ? DateTime(2000) : DateTime(2023);
    final DateTime firstDate = DateTime(2000);
    final DateTime lastDate = DateTime(2023);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      setState(() {
        if (isEducation) {
          if (isStartDate) {
            _educationStartDate = picked;
          } else {
            _educationEndDate = picked;
          }
        } else {
          if (isStartDate) {
            _workStartDate = picked;
          } else {
            _workEndDate = picked;
          }
        }
      });
    }
  }

  // Other Projects Section
  bool _hasOtherProjects = false;
  final List<TextEditingController> _projectTitleControllers = [];
  final List<TextEditingController> _projectDescriptionControllers = [];
  final List<DateTime?> _projectStartDates = [];
  final List<DateTime?> _projectEndDates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User CV Form'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Personal Details Section
              Text(
                'Personal Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _middleNameController,
                decoration: InputDecoration(labelText: 'Middle Name'),
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Only digits are allowed';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Gender Selection
              Text('Gender:'),
              Row(
                children: [
                  Radio<String>(
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  Text('Male'),
                  Radio<String>(
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  Text('Female'),
                  Radio<String>(
                    value: 'Other',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  Text('Other'),
                ],
              ),
              SizedBox(height: 20),

              // Skills Section
              Text(
                'Skills',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                children: _allSkills.map((skill) {
                  return ChoiceChip(
                    label: Text(skill),
                    selected: _selectedSkills.contains(skill),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedSkills.add(skill);
                        } else {
                          _selectedSkills.remove(skill);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),

              // Job Title Field
              TextFormField(
                controller: _summaryController,
                decoration: InputDecoration(labelText: 'Job Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a job title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Summary Field (placed below Job Title)
              TextFormField(
                controller: _summaryController,
                decoration: InputDecoration(labelText: 'Summary'),
                maxLines: 3,
              ),
              SizedBox(height: 20),

              // Work Experience Section
              Text(
                'Work Experience',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _companyNameController,
                decoration: InputDecoration(labelText: 'Company Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the company name';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Start Date',
                        hintText: _workStartDate == null
                            ? 'Select start date'
                            : _workStartDate.toString().split(' ')[0],
                      ),
                      validator: (value) {
                        if (_workStartDate == null) {
                          return 'Please select a start date';
                        }
                        return null;
                      },
                      onTap: () => _selectDate(context, true, false),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, true, false),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'End Date',
                        hintText: _workEndDate == null
                            ? 'Select end date'
                            : _workEndDate.toString().split(' ')[0],
                      ),
                      validator: (value) {
                        if (_workEndDate == null) {
                          return 'Please select an end date';
                        }
                        return null;
                      },
                      onTap: () => _selectDate(context, false, false),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, false, false),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Education Section
              Text(
                'Education',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _organizationNameController,
                decoration: InputDecoration(labelText: 'Organization Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the organization name';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Education Level'),
                value: _educationLevel,
                onChanged: (value) {
                  setState(() {
                    _educationLevel = value;
                  });
                },
                items: ['SEE', '+2', 'Bachelor', 'Master', 'PhD']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Start Date',
                        hintText: _educationStartDate == null
                            ? 'Select start date'
                            : _educationStartDate.toString().split(' ')[0],
                      ),
                      validator: (value) {
                        if (_educationStartDate == null) {
                          return 'Please select a start date';
                        }
                        return null;
                      },
                      onTap: () => _selectDate(context, true, true),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, true, true),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'End Date',
                        hintText: _educationEndDate == null
                            ? 'Select end date'
                            : _educationEndDate.toString().split(' ')[0],
                      ),
                      validator: (value) {
                        if (_educationEndDate == null) {
                          return 'Please select an end date';
                        }
                        return null;
                      },
                      onTap: () => _selectDate(context, false, true),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, false, true),
                  ),
                ],
              ),
              TextFormField(
                controller: _achievementsController,
                decoration:
                    InputDecoration(labelText: 'Achievements (Optional)'),
              ),
              SizedBox(height: 20),

              // Other Projects Section
              SwitchListTile(
                title: Text('Other Projects'),
                value: _hasOtherProjects,
                onChanged: (bool value) {
                  setState(() {
                    _hasOtherProjects = value;
                    if (!value) {
                      _projectTitleControllers.clear();
                      _projectDescriptionControllers.clear();
                      _projectStartDates.clear();
                      _projectEndDates.clear();
                    }
                  });
                },
              ),
              if (_hasOtherProjects) ...[
                for (int i = 0; i < _projectTitleControllers.length; i++) ...[
                  TextFormField(
                    controller: _projectTitleControllers[i],
                    decoration: InputDecoration(labelText: 'Project Title'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a project title';
                      } else if (value.length > 10) {
                        return 'Project title should be at most 10 characters';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _projectDescriptionControllers[i],
                    decoration: InputDecoration(labelText: 'Description'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      } else if (value.length > 100) {
                        return 'Description should be at most 100 characters';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Start Date',
                            hintText: _projectStartDates[i] == null
                                ? 'Select start date'
                                : _projectStartDates[i]
                                    .toString()
                                    .split(' ')[0],
                          ),
                          validator: (value) {
                            if (_projectStartDates[i] == null) {
                              return 'Please select a start date';
                            }
                            return null;
                          },
                          onTap: () {
                            _selectDate(context, true, true);
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          _selectDate(context, true, true);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'End Date',
                            hintText: _projectEndDates[i] == null
                                ? 'Select end date'
                                : _projectEndDates[i].toString().split(' ')[0],
                          ),
                          validator: (value) {
                            if (_projectEndDates[i] == null) {
                              return 'Please select an end date';
                            }
                            return null;
                          },
                          onTap: () {
                            _selectDate(context, false, true);
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          _selectDate(context, false, true);
                        },
                      ),
                    ],
                  ),
                ],
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _projectTitleControllers.add(TextEditingController());
                      _projectDescriptionControllers
                          .add(TextEditingController());
                      _projectStartDates.add(null);
                      _projectEndDates.add(null);
                    });
                  },
                  child: Text('Add Another Project'),
                ),
              ],

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sharedPreferences');
                },
                child: Text('Go to Shared Preferences List'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
