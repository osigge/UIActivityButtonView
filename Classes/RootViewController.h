//
//  RootViewController.h
//  UIActivityButtonView
//
//  Created by Oliver Sigge on 07.05.10.
//  Copyright DEETUNE 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIActivityButtonView;

@interface RootViewController : UITableViewController {
	UIActivityButtonView *activityButtonView;
	UIBarButtonItem *refreshButtonItem;
}

@property(nonatomic, retain) IBOutlet UIBarButtonItem *refreshButtonItem;

- (IBAction)refreshItems;

@end
