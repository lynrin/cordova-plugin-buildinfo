/*
The MIT License (MIT)

Copyright (c) 2016 Mikihiro Hayashi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

var exec = require('cordova/exec');
var channel = require('cordova/channel');

module.exports = {
	packageName: '',
	displayName: '',
	name: '',
	version: '',
	versionCode: 0,
	debug: false,
	buildType: '',
	flavor: ''
};

channel.onCordovaReady.subscribe(function () {
	// module.exports.init();
	var args = [];

	// Android Only
	// defined buildInfoBuildConfigClassName variable
	// BuildConfig class name.
	// ex: <script>var buildInfoBuildConfigClassName = 'org.apache.cordova.sample.BuildConfig';</script>
	if ('undefined' !== typeof buildInfoBuildConfigClassName) {
		args.push(buildInfoBuildConfigClassName);
	}

	exec(
		function (res) {
			if (!res) {
				return;
			}

			(res.packageName) && (module.exports.packageName = res.packageName);
			(res.displayName) && (module.exports.displayName = res.displayName);
			(res.name)        && (module.exports.name        = res.name);
			(res.version)     && (module.exports.version     = res.version);
			(res.versionCode) && (module.exports.versionCode = res.versionCode);
			(res.debug)       && (module.exports.debug       = res.debug);
			(res.buildType)   && (module.exports.buildType   = res.buildType);
			(res.flavor)      && (module.exports.flavor      = res.flavor);
			// for (var i in res) {
			// 	module.exports[i] = res[i];
			// }
		},
		function (msg) {
			console.error('BuildInfo init fail');
			console.error(msg);
		},
		'BuildInfo',
		'init',
		args
	);
})
