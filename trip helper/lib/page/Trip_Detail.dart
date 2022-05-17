import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfirstapp/main.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:myfirstapp/models/Detail.dart';

class Main_detail extends StatefulWidget {
  @override
  State<Main_detail> createState() => _Main_detail();
}

class _Main_detail extends State<Main_detail> {
  TextEditingController _countryController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  DateTimeRange? _selectedDateRange;

  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
      builder: (BuildContext context, Widget? child) {
        return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.lightBlue,
                surface: Colors.lightBlue,
                onPrimary: Colors.black,
              ),
            ),
            child: child!);
      },
    );
    if (result != null) {
      print(result.start.toString());
      setState(() {
        _selectedDateRange = result;
        _dateController.text =
            '${_selectedDateRange?.start.toString().split(' ')[0]}-'
            '${_selectedDateRange?.end.toString().split(' ')[0]}';
      });
    }
  }

  void _store(BuildContext context) {
    final String? country = _countryController.text;
    final String? date = _dateController.text;
    if (country != null && date != null) {
      final twoInfo = Detail(country, date);
      Navigator.pop(context, twoInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => _store(context),
            child: Text("Confirm", style: TextStyle(color: Colors.black)),
          ),
        ],
        title: const Text('Trip Detail'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              controller: _countryController,
              decoration: InputDecoration(
                labelText: 'Select your destination',
                suffixIcon: TextButton.icon(
                  onPressed: () {
                    showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        onSelect: (Country country) {
                          _countryController.text =
                              '${country.displayName.split('(')[0]}';
                          print('Select country: ${country.displayName}');
                        },
                        countryListTheme: CountryListThemeData(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                          // Styles the search field.
                          inputDecoration: InputDecoration(
                            labelText: 'Search',
                            hintText: 'Start typing to search',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFF8C98A8).withOpacity(0.2),
                              ),
                            ),
                          ),
                        ));
                  },
                  icon: Icon(
                    Icons.search,
                    size: 24.0,
                  ),
                  label: Text('Search'),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Select your trip duration!',
                suffixIcon: TextButton.icon(
                  onPressed: _show,
                  icon: Icon(
                    Icons.date_range,
                    size: 24.0,
                  ),
                  label: Text('Select'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
