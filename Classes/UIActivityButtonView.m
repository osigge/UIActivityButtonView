//
//  UIActivityButtonView.m
//  UIActivityButtonView
//
//  Created by Oliver Sigge on 07.05.10.
//  Copyright 2010 DEETUNE. All rights reserved.
//

#import "UIActivityButtonView.h"


@implementation UIActivityButtonView

#define kStandardRect CGRectMake(7, 4.5, 20.0, 20.0)
#define kMinimizedRect CGRectMake(17.0, 14.5, 0.0, 0.0)
#define kStrokeColor [[UIColor colorWithRed:0.282 green:0.416 blue:0.604 alpha:1.0] CGColor]

@synthesize activityIndicatorView, backgroundImageView, backgroundImage;


/**
 * Add activityIndicatorView and backgroundImageView.
 * With backgroundImageView you can add an background image for the indicator
 */
- (id)initWithFrame:(CGRect)frame{
    if ((self = [super initWithFrame:frame])) {
		self.opaque = NO;
		self.backgroundColor = [UIColor clearColor];
        self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:kStandardRect];
		[self.activityIndicatorView startAnimating];
		self.backgroundImageView = [[UIImageView alloc] initWithFrame:frame];
		[self addSubview:self.activityIndicatorView];
		[self addSubview:self.backgroundImageView];
		[self sendSubviewToBack:self.backgroundImageView];
    }
    return self;
}

- (void)setBackgroundColor:(UIColor *)newBGColor {
	
}


/**
 * Draw rounded corners
 */
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, kStrokeColor);
    CGContextSetFillColorWithColor(context, kStrokeColor);
    
    CGRect rrect = self.bounds;
    
    CGFloat radius = 5.0;
    CGFloat width = CGRectGetWidth(rrect);
    CGFloat height = CGRectGetHeight(rrect);
    
    // Make sure corner radius isn't larger than half the shorter side
    if (radius > width/2.0)
        radius = width/2.0;
    if (radius > height/2.0)
        radius = height/2.0;    
    
    CGFloat minx = CGRectGetMinX(rrect);
    CGFloat midx = CGRectGetMidX(rrect);
    CGFloat maxx = CGRectGetMaxX(rrect);
    CGFloat miny = CGRectGetMinY(rrect);
    CGFloat midy = CGRectGetMidY(rrect);
    CGFloat maxy = CGRectGetMaxY(rrect);
    CGContextMoveToPoint(context, minx, midy);
    CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
    CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)setBackgroundImage:(UIImage *)image{
	self.backgroundImageView.image = image;
}

- (void)startLoadingFromController:(UIViewController*)controller withSelector:(SEL)selector{
	self.activityIndicatorView.frame = kMinimizedRect;
	[UIView beginAnimations:@"zoomIn" context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:controller];
	[UIView setAnimationWillStartSelector:selector];
	self.activityIndicatorView.frame = kStandardRect;
	[UIView commitAnimations];
}


- (void)endLoadingFromController:(UIViewController*)controller withSelector:(SEL)selector{
	self.activityIndicatorView.frame = kStandardRect;
	[UIView beginAnimations:@"zoomOut" context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:controller];
	[UIView setAnimationDidStopSelector:selector];
	self.activityIndicatorView.frame = kMinimizedRect;
	[UIView commitAnimations];
}

- (void)dealloc {
	[self.activityIndicatorView release];
	[self.backgroundImage release];
    [super dealloc];
}


@end
