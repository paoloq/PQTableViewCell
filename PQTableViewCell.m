//
//  PQTableViewCell.m
//  PQTableViewCell
//
//  Created by Paolo Arduin on 05/15/13.
//  Copyright (c) 2013 Paolo Arduin. All rights reserved.
//
//  Based on ABTableViewCell by Loren Brichter.
//

#import "PQTableViewCell.h"

@interface PQTableViewCellView : UIView
@end

@implementation PQTableViewCellView

- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		self.contentMode = UIViewContentModeRedraw;
        self.opaque = YES;
	}
	
	return self;
}

- (void)drawRect:(CGRect)rect {
	[(PQTableViewCell *)self.superview drawCellView:rect];
}

@end

@interface PQTableViewCell ()
@property (strong, readwrite) UIView *cellView;
@end

@implementation PQTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		self.cellView = [[PQTableViewCellView alloc] initWithFrame:CGRectZero];
		[self addSubview:self.cellView];
    }
	
    return self;
}

- (void)setFrame:(CGRect)frame {
	[super setFrame:frame];
    
    self.cellView.frame = self.bounds;
    [self setNeedsDisplay];
}

- (void)setNeedsDisplay {
	[super setNeedsDisplay];
	[self.cellView setNeedsDisplay];
}

- (void)setNeedsDisplayInRect:(CGRect)rect {
	[super setNeedsDisplayInRect:rect];
	[self.cellView setNeedsDisplayInRect:rect];
}

- (void)layoutSubviews {
	[super layoutSubviews];
    
    self.contentView.hidden = YES;
	[self.contentView removeFromSuperview];
    self.textLabel.hidden = YES;
    [self.textLabel removeFromSuperview];
    self.detailTextLabel.hidden = YES;
    [self.detailTextLabel removeFromSuperview];
    self.backgroundView.hidden = YES;
    [self.backgroundView removeFromSuperview];
    self.selectedBackgroundView.hidden = YES;
    [self.selectedBackgroundView removeFromSuperview];
    self.imageView.hidden = YES;
    [self.imageView removeFromSuperview];
}

- (void)drawCellView:(CGRect)rect {
	// subclasses should implement this
}

@end
