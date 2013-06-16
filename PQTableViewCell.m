//
//  PQTableViewCell.m
//  PQTableViewCell
//
//  Created by Paolo Arduin on 05/15/13.
//  Copyright (c) 2013 Paolo Arduin. All rights reserved.
//
//  Based on ABTableViewCell by Loren Brichter.
//

#import "ESTableViewCell.h"

@interface ESTableViewCellView : UIView
@end

@implementation ESTableViewCellView

- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		self.contentMode = UIViewContentModeRedraw;
        self.opaque = YES;
	}
	
	return self;
}

- (void)drawRect:(CGRect)rect {
	[(ESTableViewCell *)self.superview drawCellView:rect];
}

@end

@interface ESTableViewCell ()
@property (strong, readwrite) UIView *cellView;
@end

@implementation ESTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		self.cellView = [[ESTableViewCellView alloc] initWithFrame:CGRectZero];
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
    [self.backgroundView removeFromSuperview];
    [self.selectedBackgroundView removeFromSuperview];
    self.imageView.hidden = YES;
    [self.imageView removeFromSuperview];
}

- (void)drawCellView:(CGRect)rect {
	// subclasses should implement this
}

@end
