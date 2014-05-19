//
//  Cell.m
//  CollectionViewExample
//
//  Created by Paul Dakessian on 9/6/12.
//  Copyright (c) 2012 Paul Dakessian, CapTech Consulting. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        // self.imageView.textAlignment = NSTextAlignmentCenter;
        // self.imageView.textColor = [UIColor blackColor];
        // self.imageView.font = [UIFont boldSystemFontOfSize:35.0];
        self.imageView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.imageView];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont boldSystemFontOfSize:35.0];
        self.label.backgroundColor = [UIColor clearColor];
        
    //    [self.contentView addSubview:self.label];
        
        
        
        /*self.button = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.button.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.button.titleLabel.textColor = [UIColor blackColor];
        self.button.titleLabel.font = [UIFont boldSystemFontOfSize:35.0];
        self.button.backgroundColor = [UIColor whiteColor];
        [self.button addTarget:self action:@selector(showDetail:) forControlEvents:UIControlEventTouchUpInside];

        [self.contentView addSubview:self.button];;*/
    }
    return self;
}

-(IBAction)showDetail:(id)sender {
}

@end
