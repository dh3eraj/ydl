plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.ydl_users"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.ydl"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

     buildTypes {
      getByName("debug") {
        signingConfig = signingConfigs.getByName("debug")

      }
      getByName("release") {
            signingConfig = signingConfigs.getByName("debug")
      }
    }
    flavorDimensions += "default"
    productFlavors {
        create("development") {
            dimension = "default"
            resValue(
                type = "string",
                name = "app_name",
                value = "YDL DEV")            
            applicationIdSuffix = ".dev"
        }
        create("production") {
            dimension = "default"
            resValue(
                type = "string",
                name = "app_name",
                value = "YDL PROD")
            applicationIdSuffix = ".prod"
        }
    }
}

flutter {
    source = "../.."
}
