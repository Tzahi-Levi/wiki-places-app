// ================= Hebrew Resources =================
import 'package:wiki_places/global/config.dart';

final Map<String, String> resourcesHe = {
  // General
  'strLanguageName': 'עברית',
  'strLanguageCode': 'he',
  'strAppName': ProjectConfig.projectName,
  'strKm': 'ק״מ',
  'strError': 'שגיאה',
  'strClose': 'סגור',
  'strSearch': 'חיפוש',
  'strNewSearch': 'חיפוש חדש',
  'strLocationPermissionDenied': 'הפעולה עושה שימוש בהרשאות המיקום, יש לאפשר לאפליקציה לגשת למיקום דרך הגדרות המכשיר.',
  'strTryAgain': 'שגיאה התרחשה בעת הפעולה, יש לנסות שנית מאוחר יותר',
  'strLoadMore': 'טעינת עוד',
  'strCurrentLocation': 'ממיקומך הנוכחי',
  'strWhatISee': 'מה אני רואה?',

  // Navigation
  'strMapPageName': 'מפה',
  'strPlacesPageName': 'רשימה',
  'strFavoritesPageName': 'מועדפים',
  'strSettingsName': 'הגדרות',

  // Map
  'strYourChosenPlace': 'מיקומך הנוכחי',
  'strSearchOnMap': 'לחצו לחיצה ארוכה כדי לשנות את המיקום סביבו מתבצע החיפוש.',

  // Places
  'strSearchSuccessfully': 'חיפוש ערכים במרחק @radius @scale מ@place בוצע בהצלחה!',
  'strCurrentPlaceDetails': 'ערכים במרחק @radius @scale מ@place',
  'strWikipediaValuesInRadius': '@number ערכים (@radius @scale)',
  'strWikipediaValueInRadius': 'ערך יחיד (@radius @scale)',
  'strEmptyWikipediaValueInRadius': 'אין ערכים (@radius @scale)',
  'strReadMore': 'לערך המלא',
  'strRadiusMustBePositive': 'המרחק חייב להיות מספר חיובי',
  'strCantIncreaseRadius':'לא ניתן להגדיל את המרחק מעבר ל-@maxRadius ק״מ',
  'strNoPlacesAvailable': "אין ערכים זמינים.\n על מנת לחפש ערכים, לחצו על כפתור החיפוש.",
  'strEmptyPlaceName': "על מנת לבצע חיפוש, בחרו מיקום",
  'strPlaceNotExist': "המיקום המבוקש לא נמצא, נסו לחפש מיקום אחר",

  // Favorites
  'strFavorites': 'מועדפים-',
  'strFavoritesNumber': '@number ערכים מועדפים',
  'strFavoriteNumber': 'ערך מועדף יחיד',
  'strEmptyFavoriteNumber': 'אין ערכים מועדפים',
  'strNoSelectedFavorites': 'לא נבחרו מועדפים.\n לחצו על ה-@ ברשימת הערכים על מנת להוסיף ערך לרשימת המועדפים.',

  // Search Place Page
  'strChangeRadius': 'חיפוש במרחק',
  'strSearchPlaceAround': 'הגדרות החיפוש',
  'strCurrentPlace': 'המיקום הנוכחי',
  'strOtherPlace': 'מיקום אחר',
  'strChooseOtherPlace': 'בחירת מיקום אחר',

  // Filters
  'strCleanAllFilters': 'נקה הכל',
  'strEmptyFilter': 'ציינו את שם המסנן על מנת להוסיפו.',
  'strAddFilter': 'הוסיפו מסנן',
  'strResetFilters': 'איפוס מסננים',

  // Settings
  'strSettings': 'הגדרות',
  'strDarkMode': 'מצב כהה',
  'strInviteFriend': 'הזמינו חבר',
  'strInviteFriendSubject': 'נסו את אפלקציית ויקי-פה',
  'strInviteFriendContent': 'רוצים להכיר מקומות מעניינים סביבכם? מעוניינים להעשיר כל טיול במידע חדש ומרתק? נסו את אפליקציית ויקי-פה המאפשרת לצפות בערכי ויקיפדיה הנמצאים סביבכם, או סביב מקומות המעניינים אתכם. \n@googlePlayUrl',
  'strRateUs': 'דרגו אותנו',
  'strRateUsExplanation': 'בחרו בכוכב כדי לדרג אותנו. אם תרצו, ניתן להוסיף פירוט נוסף.',
  'strSubmit': 'שלחו',
  'strCommentHint': 'כתבו את דעתכם כאן (אופציונלי)',
  'strVersion': 'גרסה',

  // Walkthrough
  'strWatchWalkthrough': 'צפו בהדרכה',
  'strSkip': 'סגירה',
  'strNext': 'הבא',
  'strFinish': 'סיום',
  'strWelcomeTitle': 'ברוכים הבאים לויקי-פה!',
  'strWelcomeDescription': 'אוהבים ידע? הגעתם למקום הנכון! גלו ערכי ויקיפדיה הנמצאים בקרבתכם, או בקרבת מקומות המעניינים אתכם.',
  'strWalkthroughMainPageTitle': 'המסך הראשי',
  'strWalkthroughMainPageDescription': 'צפייה בערכים שהתקבלו כרשימה. לחצו על ערך כדי לקרוא אודותיו. רוצים לדעת עוד? ניתן לגשת לערך המלא.',
  'strWalkthroughSearchPageTitle': 'הגדרות החיפוש',
  'strWalkthroughSearchPageDescription': 'הגדרת חיפוש חדש. ניתן לחפש סביב המיקום הנוכחי או סביב מיקום אחר, לדוגמא: "הכותל המערבי".',
  'strWalkthroughMapPageTitle': 'המפה',
  'strWalkthroughMapPageDescription': 'צפייה בערכים על גבי מפה. לחצו על סמל אדום כדי לצפות בערך. רוצים לחפש במיקום אחר? לחצו לחיצה ארוכה על נקודה במפה!',
  'strWalkthroughFavoritesPageTitle': 'המועדפים',
  'strWalkthroughFavoritesPageDescription': 'ניתן לשמור ערכים מועדפים לצפייה בהמשך.',

  // Errors
  'strSendReport': 'לדיווח על בעיה',
  'strReportRecorded': 'הדיווח התקבל בהצלחה, תודה!',

  // About The App
  'strLegalese': "כל החבילות והאייקונים בשימוש שייכים לבעליהם",
  'strCredit': 'האפליקציה ויקי-פה פותחה על ידי רז לוי וצחי לוי במסגרת קורס לתואר ראשון בפקולטה למדעי המחשב בטכניון. הקורס ניתן במעבדה למידע וידע (TD&K) בהנחיית ד"ר אורן משלי.',
  'strLostConnectionImage': "תמונת בעיה ברשת",
  'strErrorPageConnection': "תמונת שגיאה",
  'strLocationPermissionPage': "תמונת אין הרשאות מיקום",
  'strBackgroundImage': "תמונת רקע",
  'strSplashImage': "תמונת פתיחה",
  'strAboutTheApp': "אודות האפליקציה",
};
