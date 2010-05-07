//
//  UIActivityButtonView.h
//  UIActivityButtonView
//
//  Created by Oliver Sigge on 07.05.10.
//  Copyright 2010 DEETUNE. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIActivityButtonView : UIView {
	UIActivityIndicatorView *activityIndicatorView;
	UIImageView *backgroundImageView;
	UIImage *backgroundImage;
}

@property(nonatomic, retain) UIActivityIndicatorView *activityIndicatorView;
@property(nonatomic, retain) UIImageView *backgroundImageView;
@property(nonatomic, retain) UIImage *backgroundImage;

- (void)startLoadingFromController:(UIViewController*)controller withSelector:(SEL)selector;
- (void)endLoadingFromController:(UIViewController*)controller withSelector:(SEL)selector;

@end
