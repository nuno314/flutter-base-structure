## Supported Null safety

### Project architecture (Clean Architecture Approach)
##### 1. Presentation - Domain - Data - Models.
##### 2. Presentation layer consist of
    * Widgets
    * Riverpod

##### 3. Domain layer (Business logic layer)
    * Entities (or models that UI needs)
    * Usecases (user stories)

##### 4. Data layer (Data access layer)
    * source
        * remotes (API)
        * locals (Database)
    * Repositories
    * models
### DI pattern
`Dependency Injection` is a great design pattern that allows us to eliminate rigid dependencies between elements and it makes the application more flexible, easy to expand scales and maintain.
In the project we use Plugin `get_it` and `injectable` to implement DI and we have also defined classes so you can easily implement `DI` in the `DI layer`.

### Routes
The project has predefined Named routes RouteDefine + manifest
##### 1. RouteDefine
     * All routes must extend this class.
     * When extending, you will have to override func "initRoute", here you will define your routes.
     * A feature may have multiple routes with different input arguments.
     * Make sure that the ID of each route in your project is unique.
##### 2. manifest - `lib/manifest.dart`
     *  To add a route to the project you just need to declare in the func "generateRoute". Each route will be provided with a func "build", you must call it in the func "generateRoute" of "manifest" to register.
### Network.
     * Project can use retrofit to work with the alternative network for http.
     * Retrofit is pre-installed in the "ApiModule.dart". You can customize it here
     * All interceptors are defined in the /configuration/lib/network/interceptor/* class
     * To work with Certificate, please refer to the "/configuration/lib/network/http_overrides.dart" class, with the default the project accept badCertificate


You can run the app using the commands

```
## development: flutter run -t lib/main.dart --debug --flavor dev

## staging: flutter run -t lib/main.dart --debug --flavor prod
```

##### Build App
You can build the app using the commands

for Android

```
## development: flutter build apk -t lib/main.dart --flavor dev

## staging: flutter build apk -t lib/main.dart --flavor prod
```

for IOS

```
## development flutter build ios -t lib/main.dart --flavor dev

## staging: flutter build ios -t lib/main.dart --flavor prod
```

### resources
      * All resources (images, fonts, videos, ...) must be placed in the assets class
      * Before using them, please declare the path in utility class and the suffix of the class to be type_provide (image_provide.dart)

### Getting started
Get dependencies and generate necessary files.
for Android

```
## ./pub_gen

```

for IOS

```
## sh pub_gen
```

