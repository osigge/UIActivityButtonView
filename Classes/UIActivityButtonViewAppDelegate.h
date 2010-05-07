//
//  UIActivityButtonViewAppDelegate.h
//  UIActivityButtonView
//
//  Created by Oliver Sigge on 07.05.10.
//  Copyright DEETUNE 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActivityButtonViewAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

