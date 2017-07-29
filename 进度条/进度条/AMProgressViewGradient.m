

#import "AMProgressViewGradient.h"

@interface AMProgressViewGradient ()
@property (nonatomic) BOOL vertical;
@property (nonatomic, strong) NSArray *gradientColors;
@end

@implementation AMProgressViewGradient

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame andGradientColors:[NSArray arrayWithObject:[UIColor redColor]] andVertical:NO];
}

- (id)initWithFrame:(CGRect)frame andGradientColors:(NSArray *)gradientColors andVertical:(BOOL)vertical
{
    self = [super initWithFrame:frame];
    if (self) {
        self.vertical = vertical;
        self.gradientColors = gradientColors;
        if ([self.gradientColors count] == 1) {
            self.backgroundColor = (UIColor *)[self.gradientColors objectAtIndex:0];
        }
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    if ([self.gradientColors count] == 1) return;
        
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();

    int numComponents = 4;
    CGFloat colors[[self.gradientColors count] * numComponents];
    const CGFloat *components[[self.gradientColors count]];
    for (int i = 0; i < [self.gradientColors count]; i++) {
        components[i] = CGColorGetComponents(((UIColor *)[self.gradientColors objectAtIndex:i]).CGColor);
        for (int j = 0; j < numComponents; j++) {
            colors[i * numComponents + j] = components[i][j];
        }
    }
    CGGradientRef gradient = CGGradientCreateWithColorComponents (colorSpace, colors, NULL, [self.gradientColors count]);

    CGPoint startPoint;
    CGPoint endPoint;
    if (self.vertical) {
        startPoint = CGPointMake(0, rect.size.height);
        endPoint = CGPointMake(rect.origin.x, 0);
    } else {
        startPoint = CGPointMake(rect.origin.x, 0);
        endPoint = CGPointMake(rect.size.width, 0);
    }
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
}

@end
