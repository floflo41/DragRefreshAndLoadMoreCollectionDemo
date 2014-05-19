//
//  Cell.h
//  CollectionViewExample
//
//  Created by Paul Dakessian on 9/6/12.
//  Copyright (c) 2012 Paul Dakessian, CapTech Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UICollectionViewCell

@property (retain, nonatomic) UILabel* label;
@property (retain, nonatomic) UIButton *button;
@property (retain,nonatomic) UIImageView *imageView;

@end

