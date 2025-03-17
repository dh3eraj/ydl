## Running the App with Flavors and Modes

### Development:
```sh
flutter run -t lib/flavor/main_development.dart --flavor development --debug  
flutter run -t lib/flavor/main_development.dart --flavor development --profile  
flutter run -t lib/flavor/main_development.dart --flavor development --release  

flutter run -t lib/flavor/main_staging.dart --flavor staging --debug  
flutter run -t lib/flavor/main_staging.dart --flavor staging --profile  
flutter run -t lib/flavor/main_staging.dart --flavor staging --release  

flutter run -t lib/flavor/main_release.dart --flavor production --debug  
flutter run -t lib/flavor/main_release.dart --flavor production --profile  
flutter run -t lib/flavor/main_release.dart --flavor production --release  
