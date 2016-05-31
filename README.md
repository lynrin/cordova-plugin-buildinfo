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

## Properties

- `BuildInfo.packageName`
- `BuildInfo.basePackageName`
- `BuildInfo.displayName`
- `BuildInfo.name`
- `BuildInfo.version`
- `BuildInfo.versionCode`
- `BuildInfo.debug`
- `BuildInfo.buildType`
- `BuildInfo.flavor`

### BuildInfo.packageName

Get the packageName of Application ID.

|Platform|Value|Type|
|--------|-----|----|
|Android|Package Name|String|
|iOS|Bundle Identifier|String|


### BuildInfo.basePackageName

Android only.

Get the packageName of BuildConfig class.

If you use the configure of "build types" or "product flavors", because you can specify a different package name is the id attribute of the widget element of config.xml, is the property to get the package name that BuildConfig class belongs.
(ought be the same as the id attribute of the widget element of config.xml)


|Platform|Value|Type|
|--------|-----|----|
|Android|Package name of BuildConfig class|String|
|iOS|Bundle Identifier(equals BuildInfo.packageName)|String|


### BuildInfo.displayName

Get the displayName.

|Platform|Value|Type|
|--------|-----|----|
|Android|Application Label|String|
|iOS|CFBundleDisplayName|String|

### BuildInfo.name

Get the name.

|Platform|Value|Type|
|--------|-----|----|
|Android|Application Label(equal BuildInfo.displayName)|String|
|iOS|CFBundleName|String|


### BuildInfo.version

Get the version.

|Platform|Value|Type|
|--------|-----|----|
|Android|BuildConfig.VERSION_NAME|String|
|iOS|CFBundleShortVersionString|String|


### BuildInfo.versionCode

Get the version code.

|Platform|Value|Type|
|--------|-----|----|
|Android|BuildConfig.VERSION_CODE|int|
|iOS|CFBundleVersion|string|


### BuildInfo.debug

Get the debug flag.

|Platform|Value|Type|
|--------|-----|----|
|Android|BuildConfig.DEBUG|Boolean
|iOS|defined "DEBUG" is true|Boolean|


### BuildInfo.buildType

Android Only.

Get the build type.

|Platform|Value|Type|
|--------|-----|----|
|Android|BuildConfig.BUILD_TYPE|String|
|iOS|empty string|String|


### BuildInfo.flavor

Android Only.

Get the flavor.

|Platform|Value|Type|
|--------|-----|----|
|Android|BuildConfig.FLAVOR|String|
|iOS|empty string|String|
