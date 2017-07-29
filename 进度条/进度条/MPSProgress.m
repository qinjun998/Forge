//
//  MPSProgress.m
//  jinduDemo
//
//  Created by Chenyun on 14/12/8.
//  Copyright (c) 2014年 geek-zoo. All rights reserved.
//http://www.code4app.com/thread-5088-1-1.html
//https://github.com/chenyun120/progressView

#import "MPSProgress.h"
//#import "AMProgressView.h"


@interface MPSProgress ()
{
	float _viewWidth;
	float _viewHeight;
	int _count;
	float _num;
//	UIImageView * _imageView;
}

@property(nonatomic,strong) UIImageView * imageView;

@end

@implementation MPSProgress

-(UIImageView *)imageView{
    if(!_imageView){
        [_imageView removeFromSuperview];
        _imageView = [[UIImageView alloc] initWithImage:self.image];
        
    }
    return _imageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];

	if ( self )
	{
        self.backgroundColor = [UIColor clearColor];
        _viewWidth  = frame.size.width;
        _viewHeight = frame.size.height;
        _count = 0;
	}

	return self;
}


- (void)setProgress:(float)progress
{	
//	if ( !self.bgBottom){
//		// 设置底层背景
//		self.bgBottom = [[UIView alloc] initWithFrame:CGRectMake( self.image ? 10 : _viewWidth * 0.1, _viewHeight * 0.8, self.image ? _viewWidth - 20 : _viewWidth * 0.8, 2)];
//		self.bgBottom.backgroundColor = [UIColor grayColor];
//		self.bgBottom.layer.masksToBounds = YES;
//		self.bgBottom.layer.cornerRadius = 2;
//
//		[self addSubview:self.bgBottom];
//	}
    
    if ( !self.bgBottom){
        // 设置底层背景
        UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, _viewHeight * 0.8, _viewWidth - 20, 10)];
        bgImageView.image = [UIImage imageNamed:@"redStrip"];
        self.bgBottom = bgImageView;
        self.bgBottom.layer.masksToBounds = YES;
        self.bgBottom.layer.cornerRadius = 2;
        
        [self addSubview:self.bgBottom];
    }

	if ( !self.bgTop )
	{
		// 设置上层背景
		self.bgTop = [[UIView alloc]initWithFrame:CGRectMake(self.image ? 10 : _viewWidth * 0.1, _viewHeight * 0.8, 0, 2)];
		self.bgTop.backgroundColor = [UIColor colorWithRed:1.0 green:0.54 blue:0.19 alpha:1.0];
		self.bgTop.layer.masksToBounds = YES;
		self.bgTop.layer.cornerRadius = 2;

		[self addSubview:self.bgTop];
		
	}

	if (self.image)
	{
//        [_imageView removeFromSuperview];
//		_imageView = [[UIImageView alloc] initWithImage:self.image];
		self.frame = CGRectMake(10, _viewHeight * 0.40, 10, 18);  //三角
		[self addSubview:self.imageView];
	}

	if ( !self.progressNum )
	{
		// 设置百分比
		float imageWidth = 4;

		if ( self.image )
		{
			imageWidth += _imageView.frame.size.width;
		}

		self.progressNum = [[UILabel alloc] initWithFrame:CGRectMake(imageWidth, _viewHeight * 0.45, 45, 20)];
		self.progressNum.backgroundColor = [UIColor orangeColor];//1001
		self.progressNum.textColor = [UIColor whiteColor];
		self.progressNum.textAlignment = NSTextAlignmentCenter;
		self.progressNum.font = [UIFont systemFontOfSize:16];
		[self addSubview:self.progressNum];
	}

	_num = progress * 100;
	float maxWidth = self.bgBottom.frame.size.width;

	int currentProgress = progress * maxWidth;
	float propressPointX = progress * maxWidth;

	// 进度条
	CGRect bgTopFrame = self.bgTop.frame;
	bgTopFrame.size.width = currentProgress;
//    bgTopFrame.size.height = 10;  //1001
    self.bgTop.backgroundColor = [UIColor clearColor];

	// 进度的百分比
	CGRect progressNumFrame = self.progressNum.frame;
	if ( _num != 0 )
	progressNumFrame.origin.x = propressPointX + 8 ;

	// 设置进度数值
	int currentNum = _num;
	self.progressNum.text = [NSString stringWithFormat:@"%d%%",currentNum];

	self.bgTop.frame = bgTopFrame;
	self.progressNum.frame = progressNumFrame;
	if ( self.image )
	{
		CGRect imageFrame = self.progressNum.frame;
		imageFrame.origin.x -= 14;
		
		CGRect imageFrameT = _imageView.frame;
		imageFrameT.origin.x = imageFrame.origin.x;
		_imageView.frame = imageFrameT;
	}

//	[UIView animateWithDuration:1.0f
//						  delay:0
//						options:UIViewAnimationOptionCurveEaseIn
//					 animations:^{
//							self.bgTop.frame = bgTopFrame;
//							self.progressNum.frame = progressNumFrame;
//							if ( self.image )
//							{
//								CGRect imageFrame = self.progressNum.frame;
//								imageFrame.origin.x -= 14;
//
//								CGRect imageFrameT = _imageView.frame;
//								imageFrameT.origin.x = imageFrame.origin.x;
//
//								_imageView.frame = imageFrameT;
//							}
//						}
//					 completion:nil];

//	[self startCount];
}

- (void)startCount
{
	if ( _count <= _num )
	{
		self.progressNum.text = [NSString stringWithFormat:@"%d%%",_count];

		_count++;

		[NSTimer scheduledTimerWithTimeInterval:0.1f
										 target:self
									   selector:@selector(startCount)
									   userInfo:nil
										repeats:YES];
	}
}

@end
