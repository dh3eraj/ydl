## Running the App with Flavors and Modes

### Development:
```sh
flutter run -t lib/flavor/main_development.dart --flavor development --debug
```
```sh
flutter run -t lib/flavor/main_development.dart --flavor development --profile  
```
```sh
flutter run -t lib/flavor/main_development.dart --flavor development --release  
```
### Staging:
```sh
flutter run -t lib/flavor/main_staging.dart --flavor staging --debug
```
```sh
flutter run -t lib/flavor/main_staging.dart --flavor staging --profile
```
```sh
flutter run -t lib/flavor/main_staging.dart --flavor staging --release  
```
### Production:
```sh
flutter run -t lib/flavor/main_release.dart --flavor production --debug
```
```sh
flutter run -t lib/flavor/main_release.dart --flavor production --profile
```
```sh
flutter run -t lib/flavor/main_release.dart --flavor production --release  
```
