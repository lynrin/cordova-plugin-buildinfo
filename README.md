[![Build Status](https://travis-ci.org/lynrin/cordova-plugin-buildinfo.svg?branch=master)](https://travis-ci.org/lynrin/cordova-plugin-buildinfo)
[![Code Climate](https://codeclimate.com/github/lynrin/cordova-plugin-buildinfo/badges/gpa.svg)](https://codeclimate.com/github/lynrin/cordova-plugin-buildinfo)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

# cordova-plugin-buildinfo

This plugin defines a global BuildInfo object.

BuildInfo object is available at the time the deviceready event fires.

```js
document.addEventListener("deviceready", onDeviceReady, false);

function onDeviceReady() {
	console.log('BuildInfo.packageName    =' + BuildInfo.packageName);
	console.log('BuildInfo.basePackageName=' + BuildInfo.basePackageName);
	console.log('BuildInfo.displayName    =' + BuildInfo.displayName);
	console.log('BuildInfo.name           =' + BuildInfo.name);
	console.log('BuildInfo.version        =' + BuildInfo.version);
	console.log('BuildInfo.versionCode    =' + BuildInfo.versionCode);
	console.log('BuildInfo.debug          =' + BuildInfo.debug);
	console.log('BuildInfo.buildTime      =' + BuildInfo.buildTime);
	console.log('BuildInfo.buildType      =' + BuildInfo.buildType);
	console.log('BuildInfo.flavor         =' + BuildInfo.flavor);
}
```

## Installation

```sh
cordova plugin add cordova-plugin-buildinfo
```

## Supported Platforms

* Android
* iOS
* Windows

## Properties

- `BuildInfo.packageName`
- `BuildInfo.basePackageName`
- `BuildInfo.displayName`
- `BuildInfo.name`
- `BuildInfo.version`
- `BuildInfo.versionCode`
- `BuildInfo.debug`
- `BuildInfo.buildTime`
- `BuildInfo.buildType`
- `BuildInfo.flavor`
- `BuildInfo.windows`
  - `logo`
  - `version`


### BuildInfo.packageName

Get the packageName of Application ID.

|Platform|Value|Type|
|--------|-----|----|
|Android|Package Name|String|
|iOS|Bundle Identifier|String|
|Windows|Identity name|String|


### BuildInfo.basePackageName

Android only.

Get the packageName of BuildConfig class.

If you use the configure of "build types" or "product flavors", because you can specify a different package name is the id attribute of the widget element of config.xml, is the property to get the package name that BuildConfig class belongs.
(ought be the same as the id attribute of the widget element of config.xml)


|Platform|Value|Type|
|--------|-----|----|
|Android|Package name of BuildConfig class|String|
|iOS|Bundle Identifier(equals BuildInfo.packageName)|String|
|Windows|Identity name(equals BuildInfo.packageName)|String|


### BuildInfo.displayName

Get the displayName.

|Platform|Value|Type|
|--------|-----|----|
|Android|Application Label|String|
|iOS|CFBundleDisplayName|String|
|Windows|Display a package name|String|

### BuildInfo.name

Get the name.

|Platform|Value|Type|
|--------|-----|----|
|Android|Application Label(equal BuildInfo.displayName)|String|
|iOS|CFBundleName|String|
|Windows|Windows Store display name|String|


### BuildInfo.version

Get the version.

|Platform|Value|Type|
|--------|-----|----|
|Android|BuildConfig.VERSION_NAME|String|
|iOS|CFBundleShortVersionString|String|
|Windows|Major . Minor . Build|String|


### BuildInfo.versionCode

Get the version code.

|Platform|Value|Type|
|--------|-----|----|
|Android|BuildConfig.VERSION_CODE|int|
|iOS|CFBundleVersion|string|
|Windows|Major . Minor . Build . Revision|String|


### BuildInfo.debug

Get the debug flag.

|Platform|Value|Type|
|--------|-----|----|
|Android|BuildConfig.DEBUG|Boolean
|iOS|defined "DEBUG" is true|Boolean|
|Windows|isDevelopmentMode is true|Boolean|


### BuildInfo.buildTime

Get the build date and time in the same format new Date().toJSON() returns.

Attention: There is no information about the timezones saved.
- iOS: The iOS date is written in developer local time but interpreted in UTC
- Android: The Android date is written in developer's local time and interpret in user's local time

|Platform|Value|Type|
|--------|-----|----|
|Android|Datetime of last build folder modification|String|
|iOS|Combination of \_\_DATE\_\_ and \_\_TIME\_\_ |String|


### BuildInfo.buildType

Android , Windows Only.

Get the build type.

|Platform|Value|Type|
|--------|-----|----|
|Android|BuildConfig.BUILD_TYPE|String|
|iOS|empty string|String|
|Windows|"release" or "debug"|String|


### BuildInfo.flavor

Android Only.

Get the flavor.

|Platform|Value|Type|
|--------|-----|----|
|Android|BuildConfig.FLAVOR|String|
|iOS|empty string|String|
|Windows|empty string|String|

### BuildInfo.windows

Windows Only.

Get the windows extra information.

|Platform|Value|Type|
|--------|-----|----|
|Android|undefined|undefined|
|iOS|undefined|undefined|
|Windows|Object|Object|

|Property name|Value|Type|
|-------------|-----|----|
|architecture|Windows.ApplicationModel.Package.current.id.architecture|integer|
|description|Windows.ApplicationModel.Package.current.description|String|
|displayName|Windows.ApplicationModel.Package.current.displayName|String|
|familyName|Windows.ApplicationModel.Package.current.id.familyName|String|
|fullName|Windows.ApplicationModel.Package.current.id.fullName|String|
|logo|Object|Object|
|publisher|Windows.ApplicationModel.Package.current.id.publisher|String|
|publisherId|Windows.ApplicationModel.Package.current.id.publisherId|String|
|publisherDisplayName|Windows.ApplicationModel.Package.current.publisherDisplayName|String|
|resourceId|Windows.ApplicationModel.Package.current.id.resourceId|String|
|version|Windows.ApplicationModel.Package.current.id.version|Object|

#### BuildInfo.windows.logo

|Property name|Value|Type|
|-------------|-----|----|
|absoluteCannonicalUri|Windows.ApplicationModel.Package.logo.absoluteCanonicalUri|String|
|absoluteUri|Windows.ApplicationModel.Package.logo.absoluteUri|String|
|displayIri|Windows.ApplicationModel.Package.logo.displayIri|String|
|displayUri|Windows.ApplicationModel.Package.logo.displayUri|String|
|path|Windows.ApplicationModel.Package.logo.path|String|
|rawUri|Windows.ApplicationModel.Package.logo.rawUri|String|

#### BuildInfo.windows.version

|Property name|Value|Type|
|-------------|-----|----|
|major|Windows.ApplicationModel.Package.current.id.version.major|integer|
|minor|Windows.ApplicationModel.Package.current.id.version.minor|integer|
|build|Windows.ApplicationModel.Package.current.id.version.build|integer|
|revision|Windows.ApplicationModel.Package.current.id.version.revision|integer|