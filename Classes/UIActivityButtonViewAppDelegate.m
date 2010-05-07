//
//  UIActivityButtonViewAppDelegate.m
//  UIActivityButtonView
//
//  Created by Oliver Sigge on 07.05.10.
//  Copyright DEETUNE 2010. All rights reserved.
//

#import "UIActivityButtonViewAppDelegate.h"
#import "RootViewController.h"


@implementation UIActivityButtonViewAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

