// ================= English Resources =================
import 'package:wiki_places/global/config.dart';

final Map<String, String> resourcesEn = {
  // General
  'strLanguageName': 'English',
  'strAppName': ProjectConfig.projectName,
  'strFirstLetterAscii': "65",
  'strLastLetterAscii': "122",
  'strKm': 'Km',
  'strError': 'Error',
  'strClose': 'Close',
  'strSearch': 'Search',
  'strLocationPermissionDenied': 'This feature has to use location permission, please allow it in the device settings.',
  'strTryAgain': 'Error has been occurred, please try again later',
  'strLoadMore': 'Load More',
  'strUndo': 'Undo',
  'strCurrentLocation': 'Distance from current location',

  // Navigation
  'strMapPageName': 'Map',
  'strPlacesPageName': 'List',
  'strFavoritesPageName': 'Favorites',

  // Map
  'strYourChosenPlace': 'Your chosen place',
  'strSearchOnMap': 'You can get more articles on another place by long press on the other place',

  // Places
  'strSearchPlace': 'Search Places',
  'strSearchSuccessfully': 'Searching for places in radius @radius @scale from @place was done successfully!',
  'strCurrentPlaceDetails': 'Places in radius @radius @scale from @place',
  'strWikipediaValuesInRadius': '@number Articles (@radius @scale)',
  'strReadMore': 'Read more',
  'strRadiusMustBePositive': 'The radius must be a positive number',
  'strCantIncreaseRadius': "The radius can't be increased above @maxRadius km",
  'strNoPlacesAvailable': "There are not articles available. For searching articles, please click on the search button.",
  'strEmptyPlaceName': "For searching places, please choose a place name",
  'strPlaceNotExist': "The chosen place is not found, please try to search another place",

  // Favorites
  'strFavorites': 'Favorites-',
  'strFavoritesNumber': '@number Favorite Articles',
  'strFavoriteNumber': 'One Favorite Article',
  'strEmptyFavoriteNumber': 'No Favorite Articles',
  'strNoSelectedFavorites': 'There are not favorite places. For adding places to the favorites, click on @ in the places page.',

  // Search Place Page
  'strChangeRadius': 'Search in distance',
  'strSearchPlaceAround': 'Search Settings',
  'strPlace': 'Place:',
  'strCurrentPlace': 'Current Place',
  'strOtherPlace': 'Other Place',
  'strChooseOtherPlace': 'Choose Other Place',

  // Filters
  'strCleanAllFilters': 'Clean All',
  'strEmptyFilter': 'Choose filter name for adding a filter',
  'strFilters': 'Filters:',
  'strAddFilter': 'Add filter',
  'strResetFilters': 'Reset filters',

  // About The App
  'strLegalese': "All packages and icons used are properties of their respective owners",
  'strLostConnectionImage': "Lost Connection Image",
  'strErrorPageConnection': "Error Image",
  'strBackgroundImage': "Background Image",
  'strAboutTheApp': "About the app",
};
