# WikiPo


> WikiPo is an application which provides to the user the ability to search information on places that are located around to him. The user can search places around him easily, and can get the information directly from wikipedia.


<p align="center">
  <a href='https://play.google.com/store/apps/details?id=com.technion.android.wikiplaces.wiki_places'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png' width="250" height="100"/></a>
</p>


<p align="center">
    <img src="/images/screenshots/places_page.png" alt="drawing" width="200"/> <img src="/images/screenshots/map_page.png" alt="drawing" width="200"/> <img src="/images/screenshots/favorites_page.png" alt="drawing" width="200"/> <img src="/images/screenshots/change_radius.png" alt="drawing" width="200"/>
</p>


<p align="center">
    <img src="/images/lab_icon.jpeg"/>
</p>


## Introduction:
* This project was done in the TDK - Technion Data & Knowledge Lab of the CS faculty By Tzahi Levi and Raz Levi under the supervision of Dr. Oren Mishali.
* This project's final product is an app for presenting information about places.
* [App Poster.](https://github.com/TechnionTDK/wiki-places-app/blob/docs/poster.pdf)


## Prerequisite:
* The app is based on [another project](https://github.com/TechnionTDK/wikipedia-places) that implements the backend for this app.


## Core Features


* [ ] Search for places around you and far from you easily.
* [ ] Watch the title, abstract, and image of the places (from wikipedia).
* [ ] Open the full wikipedia page in the app as a web view.
* [ ] See all the places around you and far from on a map.
* [ ] Change the radius you want to search around.
* [ ] Get arrival instruction for each place.
* [ ] Save favorites values.
* [ ] Choose between dark and light mode.
* [ ] Watch a Walkthrough for better using.
* [ ] Invite a friend to use the app.
* [ ] Rate the app.


## Documentation
### App structure:
* lib/pages- all the views and models of the pages in the app.
* lib/widgets- all the widgets that are used in the pages of the app.
* lib/controllers- the controllers of the app.
* lib/global- global files for global function, variables, and typedefs in the app.
* lib/metrics- the controllers of the metrics (Google Analytics, crashlytics, and sentry).
* lib/localization- all the resources of the app and the locale controller.


### The app is using the following packages:
* get- using [GetX](https://github.com/jonataslaw/getx) for the app's state management, route manager, http communication, theme manager, localization, and other utils (such as snackbars, dialogs, etc).
* firebase_analytics, firebase_crashlytics, sentry_flutter- using the Google analytics for collecting the user's data of usages, and crashlytics and sentry for monitoring crashes and exceptions.
* google_maps_flutter- using for presenting the map. an api key is required.
* shared_preferences- using for controlling the favorites list, theme, and map banner. they are all saved on the user's device.
* cross_connectivity- using for checking the user connectivity. if the user is not connected to the internet, the app is navigated to an error page.
* sorted_list- using as a data structure for maintaining a sorted places list according to the distance.
* geolocator- using for calculating the distance between a favorite place and the user's current place.
* webview_flutter- using for presenting the Wikipedia full article as a web view.
* flutter_typeahead- using for the autocomplete in the search place text field.
* expandable- using for expanding the place card in the list page.
* convex_bottom_bar- using for the bottom navigation logic and ui.
* introduction_screen- using for the walkthrough.
* rating_dialog- using for the rate us feature (ui).
* mailer- using for sending an email after user is rating the app (the recipients list can be found in sendReviewsRecipients in lib/global/constants.dart. file).
* share_plus- using for the invite a friend feature.
* flutter_native_splash- using for the initial splash screen.


### Comments:
* The theme of the app (light and dark mode) are controlled in the theme_controller in lib/controllers/theme_controller.dart file.
* The app supports localization, but currently this is not in used since the place's data is arrived in Hebrew from the server. If you want to use the English, uncomment the resourcesEn in lib/localization/resources/resources.dart file(marked as TODO). For adding new language, add a translation as new file in the resources directory and include it in the lib/localization/resources/resources.dart file. You can use the languages_drop_down widget for changing the language.
* The branches develop, master, and all the branches started in release/ are protected- it means that you can't push commits without a pull request. For modify the rules (protected branches name) you can visit the branches section under the Settings label (in GitHub website).
* Only the code owners can approve pull requests in this repository- you can't merge pull request without at least one approval. The code owners is declared in docs/CODEOWNERS file- you can edit this file for adding new code owners (add @gitNickname).


## Disclaimer


>Google Play and the Google Play logo are trademarks of Google LLC.