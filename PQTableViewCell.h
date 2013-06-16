//
//  PQTableViewCell.h
//  PQTableViewCell
//
//  Created by Paolo Arduin on 05/15/13.
//  Copyright (c) 2013 Paolo Arduin. All rights reserved.
//
//  Based on ABTableViewCell by Loren Brichter.
//

#import <UIKit/UIKit.h>

@interface PQTableViewCell : UITableViewCell

@property (strong, readonly) UIView *cellView;

- (void)drawCellView:(CGRect)rect;

@end
