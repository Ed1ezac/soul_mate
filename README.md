## Soulmate Dating App
 This is a mobile app that lets single people browse other single people to potentially date and eventually start a relationship. The app behaves like the frontend and needs a backend (server) to handle storage and process requests such as feed and Chat. 

## Project Status
<p align="center">
<img src="https://img.shields.io/badge/development-active-blue" alt="development status"/>
</p>

## Technology Used
This system was made using the Flutter framework, a cross-platform framework based on the dart language for mobile, desktop and web development. But this project explicitly targets mobile platforms (iOS & Android). Made with these technologies:

|Technology       |Description   |
|:---------------:|:------------:|
| <a href="https://flutter.dev" target="_blank"><img src="https://www.vectorlogo.zone/logos/flutterio/flutterio-icon.svg" width="120" height="120"></a> | Flutter Framework v2.x |


## Requirements
If you intend to make additions to this project you need to meet the following (Minimum requirements):
- Flutter v2.10.0 
- Dart v2.16.0

## Architecture & Directories
This project's directory structure follows the Flutter framework directory structure. All the important code however lives in the `lib/` directory. To stay organized the directory includes `models`, `pages`, `utils` and the `widgets` folders to hold their respective files.

## Local Configuration
- Make sure you have minimum requirements
- Download and unzip the project 
- If you have Visual Studio Code IDE you can use its built-in command processor by clicking `Terminal`->`New Terminal` on the top ribbon menu
- Otherwise fire up your console app *(e.g command prompt on windows)* and navigate to the project folder 
- Install the necessary packages by running `pub get`
- Connect your device, make sure you have installed USB drivers which enable debugging for the smartphone
- To run the app press `ctrl + F5` on windows, `command + F5` on mac
- Wait for the build to complete and voila! the app should appear on your phone


## Testing
The app does not define any custom tests yet. However you'll find the default widget test setup in the `test` directory to get started.
Depending on which aspect of the app you are interested in testing, you can find useful information on the different types of testing available namely `unit test`, `widget test` and `intergration test` by:

Visiting the [Flutter documentation on testing](https://docs.flutter.dev/cookbook/testing) to learn more.

## Support & Contribution
Contributions are welcome. Please contact me to give me a heads-up and to agree on code standard and conventions. I  value readable and consice code practices that uses the language and platform specific conventions.

## Evolution
This app is on the development phase and aims to reach minimum reproducible prototype with few core features very soon. It will eventually add other supporting features later.
**Core Features**
- [x] Potential dates feed
- [ ] Basic chat and messaging
- [ ] Profile with small Image gallery

**Supporting Features**
- [ ] Profile with video intros
- [ ] In app Calls
- [ ] Support for Billing

## License
This project is under the [GNU Affero General Public License v3.0](https://choosealicense.com/licenses/agpl-3.0/)

