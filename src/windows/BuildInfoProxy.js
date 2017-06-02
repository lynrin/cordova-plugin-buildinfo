BuildInfoProxy = {
    init: function (successCallback, errorCallback, args) {
        var res = {};
        var packId = Windows.ApplicationModel.Package.current.id;
        res.packageName = packId.name;
        res.basePackageName = packId.name;
        res.displayName = Windows.ApplicationModel.Package.current.displayName;
        res.name = Windows.ApplicationModel.Package.current.displayName;
        var version = packId.version;
        res.version = [version.major, version.minor, version.build].join('.');
        res.versionCode = packId.version.build;
        res.debug = Windows.ApplicationModel.Package.current.isDevelopmentMode;
        res.buildType = (res.debug) ? "debug" : "release";
        successCallback(res);
    }
};
cordova.commandProxy.add("BuildInfo", BuildInfoProxy);