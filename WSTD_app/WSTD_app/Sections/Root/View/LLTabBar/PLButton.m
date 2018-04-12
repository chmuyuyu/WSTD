//
//  PLButton.m
//  YiKuaiYunGou
//
//  Created by 彭亮 on 16/3/12.
//  Copyright © 2016年 PengLiang. All rights reserved.
//

#import "PLButton.h"
CGFloat defaultHeight = 80;
CGFloat defaultWidth  = 80;
@interface PLButton()

@end
@implementation PLButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self config];
    }
    
    return self;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self config];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self config];
    }
    
    return self;
}

- (void)config {
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)setImageHeight:(CGFloat)imageHeight
{
    defaultHeight = imageHeight;
}
- (void)setImageWidth:(CGFloat)imageWidth
{
    defaultHeight = imageWidth;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    CGSize titleSize = self.titleLabel.frame.size;
    
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    if (imageSize.width != 0 && imageSize.height != 0) {
    //    CGFloat imageViewCenterY = CGRectGetHeight(self.frame) - 3 - titleSize.height - imageSize.height / 2 - 5;
   //     self.imageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, imageViewCenterY);
        CGFloat imageViewCenterY = (CGRectGetHeight(self.frame)/2-titleSize.height/2);
        self.imageView.center = CGPointMake(CGRectGetWidth(self.frame)/2,imageViewCenterY);
    //    self.imageView.image = [self scaleToSize:self.imageView.image size:CGSizeMake( _imageWidth, _imageHeight)];
      //  self.imageView.frame = CGRectMake(self.imageView.frame.origin.x, self.imageView.frame.origin.y, _imageWidth, _imageHeight);
     //   NSLog(@"执行");
    } else {
        CGPoint imageViewCenter = self.imageView.center;
        imageViewCenter.x = CGRectGetWidth(self.frame) / 2;
        imageViewCenter.y = (CGRectGetHeight(self.frame) - titleSize.height) / 2;
        self.imageView.center = imageViewCenter;
  //      NSLog(@"执行1");
    }
   // CGPoint labelCenter = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) - 3 - titleSize.height / 2);
    CGPoint labelCenter = CGPointMake(CGRectGetWidth(self.frame) / 2,  CGRectGetHeight(self.imageView.frame)+ self.imageView.frame.origin.y+20);

    self.titleLabel.center = labelCenter;
    
    // 还有一种实现方式是设置 Edge Insets，Xcode 7.0.1 好像有点不开心，在 IB 里面更改一下属性的时候，经常崩溃。。。
    /* 位置还有一点不准确，推荐用上面的代码来设置
     
     [self.titleLabel sizeToFit];
     CGSize titleSize = self.titleLabel.frame.size;
     CGSize imageSize = [self imageForState:UIControlStateNormal].size;
     NSInteger titleTopInset = CGRectGetHeight(self.frame) - 3 - titleSize.height;
     CGFloat titleRightInset = (CGRectGetWidth(self.frame) - titleSize.width) / 2 + titleSize.width;
     [self setTitleEdgeInsets:UIEdgeInsetsMake(titleTopInset, 0, 3, titleRightInset)];
     CGFloat imageViewLeftRightInset = (CGRectGetWidth(self.frame) - imageSize.width) / 2;
     [self setImageEdgeInsets:UIEdgeInsetsMake(CGRectGetHeight(self.frame) - 3 - 5 - titleSize.height - imageSize.height, imageViewLeftRightInset, 3 + 5 + titleSize.height, imageViewLeftRightInset)];
     
     */
}


//图片缩放到指定大小尺寸

 - (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
         UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
        [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
       UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
      UIGraphicsEndImageContext();
     // 返回新的改变大小后的图片
     return scaledImage;
}

/**
 *  复写系统的高量实现，禁止按钮高亮
 *  此函数里不用写任何代码
 */
- (void)setHighlighted:(BOOL)highlighted{
    // do not anything  
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
