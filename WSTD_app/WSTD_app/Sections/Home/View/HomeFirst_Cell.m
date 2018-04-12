//
//  HomeFirst_Cell.m
//  WSTD_app
//
//  Created by 宝视达 on 2018/3/26.
//  Copyright © 2018年 baoshida. All rights reserved.
//

#import "HomeFirst_Cell.h"
#import "JXLayoutButton.h"
@implementation HomeFirst_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {

    CGFloat margin = 0;
    self.userInteractionEnabled = YES;
    [self addButton: [self generateButtonWithStyle:JXLayoutButtonStyleUpImageDownTitle withNameString:@"手机充值" withImgString:@"phone_i"]
          withFrame:CGRectMake(margin, margin, kScreenWidth/3, kScreenWidth/3) withSEL:@selector(Pay_iphone)];
   
    
      [self addButton: [self generateButtonWithStyle:JXLayoutButtonStyleUpImageDownTitle withNameString:@"办理信用卡" withImgString:@"setCard"]
          withFrame:CGRectMake(margin+kScreenWidth/3, margin, kScreenWidth/3, kScreenWidth/3)withSEL:@selector(CallIDCard)];
    
  


}

- (JXLayoutButton *)generateButtonWithStyle:(JXLayoutButtonStyle)style withNameString:(NSString *)NameString  withImgString:(NSString*)ImgString{
    JXLayoutButton *button = [JXLayoutButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:ImgString] forState:UIControlStateNormal];
    [button setTitle:NameString forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    button.layoutStyle = style;
    
    return button;
}
- (void)addButton:(JXLayoutButton *)button withFrame:(CGRect)frame withSEL:(SEL )str{
    button.frame = frame;
    [button addTarget:self action:str forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button];
}
-(void)Pay_iphone{
    if (self.pay_iphone) {
        self.pay_iphone();
    }
}
-(void)CallIDCard{
    if (self.callidCard) {
        self.callidCard();
    }
}
@end
