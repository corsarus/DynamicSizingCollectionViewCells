//
//  CCRCollectionViewResizableCellCollectionViewCell.m
//  DynamicSizingCollectionViewCells
//
//  Created by Catalin (iMac) on 06/02/2015.
//  Copyright (c) 2015 corsarus. All rights reserved.
//

#import "CCRCollectionViewCell.h"


@interface CCRCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end


@implementation CCRCollectionViewCell

#pragma mark - Properties

- (void)setText:(NSString *)text
{
    _text = [text copy];
    
    self.label.text = _text;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    
    // The cell width is half the screen width minus the gap between the cells
    // The gap should be slightly larger than the minium space between cells set for the flow layout to prevent layout and scrolling issues
    CGFloat cellWidth = (screenWidth - 10) / 2;
    [self.label addConstraint:[NSLayoutConstraint constraintWithItem:self.label
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationLessThanOrEqual
                                                              toItem:nil
                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                          multiplier:1.0
                                                            constant:cellWidth]];
}


@end

