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

#import "CDVBuildInfo.h"
#import <Cordova/CDV.h>

@implementation CDVBuildInfo

/* init */
- (void)init:(CDVInvokedUrlCommand*)command
{
	NSBundle* bundle = [NSBundle mainBundle];
	NSDictionary* info = [bundle infoDictionary];
#ifdef DEBUG
	NSNumber* debug = [NSNumber numberWithBool:YES];
#else
	NSNumber* debug = [NSNumber numberWithBool:NO];
#endif

	NSDictionary* result = @{
							 @"packageName"    : [bundle bundleIdentifier],
							 @"basePackageName": [bundle bundleIdentifier],
							 @"displayName"    : [info objectForKey:@"CFBundleDisplayName"],
							 @"name"           : [info objectForKey:@"CFBundleName"],
							 @"version"        : [info objectForKey:@"CFBundleShortVersionString"],
							 @"versionCode"    : [info objectForKey:@"CFBundleVersion"],
							 @"debug"          : debug,
							 @"buildType"      : @"", // Android Only
							 @"flavor"         : @""  // Android Only
						};

	if ([debug boolValue]) {
		NSLog(@"BuildInfo packageName    : \"%@\"", [result objectForKey:@"packageName"]);
		NSLog(@"BuildInfo basePackageName: \"%@\"", [result objectForKey:@"basePackageName"]);
		NSLog(@"BuildInfo displayName    : \"%@\"", [result objectForKey:@"displayName"]);
		NSLog(@"BuildInfo name           : \"%@\"", [result objectForKey:@"name"]);
		NSLog(@"BuildInfo version        : \"%@\"", [result objectForKey:@"version"]);
		NSLog(@"BuildInfo versionCode    : \"%@\"", [result objectForKey:@"versionCode"]);
		NSLog(@"BuildInfo debug          : %@"    , [[result objectForKey:@"debug"] boolValue] ? @"YES" : @"NO");
		NSLog(@"BuildInfo buildType      : \"%@\"", [result objectForKey:@"buildType"]);
		NSLog(@"BuildInfo flavor         : \"%@\"", [result objectForKey:@"flavor"]);
	}

	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:result];

	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
