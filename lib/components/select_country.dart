import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchfield/searchfield.dart';

selectCountry(BuildContext context, String? selectedItem, List<String> list,
    dynamic Function(String)? onSubmit) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.65,
    padding: const EdgeInsets.fromLTRB(20.0, 10, 0, 10),
    child: SearchField(
      autoCorrect: true,
      hint: 'Select Country',
      searchInputDecoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
      ),
      suggestionStyle: GoogleFonts.getFont(
        "Ubuntu",
        color: Colors.black,
        fontSize: 15,
      ),
      itemHeight: 30,
      maxSuggestionsInViewPort: 8,
      suggestionItemDecoration: const BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(10),
      ),
      onSubmit: onSubmit,
      suggestions: list.map((e) => SearchFieldListItem(e)).toList(),
    ),
  );
}
// (value) {
// setState(() {
// selectedCountry = value;
// debugPrint(selectedCountry);
// });
// },
