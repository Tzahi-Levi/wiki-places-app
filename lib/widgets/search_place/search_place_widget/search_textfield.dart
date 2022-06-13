// ================= Search TextField Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:wiki_places/global/client_requests.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/types.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key, required this.placeNameController, this.isEnabled = true}) : super(key: key);
  final TextEditingController placeNameController;
  final bool isEnabled;

  void _resetText() {
    placeNameController.text = "";
  }

  Future<List<Suggestion>> _getSuggestions(String pattern) async {
    return await ClientRequests.instance.getSuggestions(pattern: pattern);
  }

  void _onSuggestionSelected(Suggestion suggestion) {
    placeNameController.text = suggestion.name;
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      suggestionsBoxDecoration: SuggestionsBoxDecoration( borderRadius: BorderRadius.circular(20), color: Get.theme.canvasColor),
      hideOnLoading: true,
      textFieldConfiguration: TextFieldConfiguration(
        style: Get.textTheme.headline6,
        controller: placeNameController,
        onTap: _resetText,
        enabled: isEnabled,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: 'strChooseOtherPlace'.tr,
        ),
      ),
      minCharsForSuggestions: 1,
      hideOnEmpty: true,
      noItemsFoundBuilder: (context) => Container(),
      suggestionsCallback: _getSuggestions,
      onSuggestionSelected: _onSuggestionSelected,
      itemBuilder: (BuildContext context, Suggestion suggestion) {
        return ListTile(
          leading: suggestion.icon.isEmpty ? const Icon(GlobalConstants.placeIcon) : Image.network(suggestion.icon),
          title: Text(suggestion.name),
        );
      },
    );
  }
}
