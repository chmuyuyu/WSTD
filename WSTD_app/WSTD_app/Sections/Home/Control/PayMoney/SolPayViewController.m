//
//  SolPayViewController.m
//  WSTD_app
//
//  Created by 宝视达 on 2018/3/28.
//  Copyright © 2018年 baoshida. All rights reserved.
//

#import "SolPayViewController.h"
#import "Payfor_phone.h"
@interface SolPayViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UIButton *outBtn;
@property(nonatomic,strong)NSString *string;
@property(nonatomic,strong)UIImageView *wechatImageView;

@end

@implementation SolPayViewController
{
    NSArray *arr;
    NSArray *arr2;
    NSArray *arr3;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self getData];
    [self creatUI];
}
-(void)getData{
     arr=@[@"50元",
                    @"100元",
                    @"200元",
                    @"300元",
                    @"500元"];
    arr2 =@[@"售价：45.5",
                     @"售价：90",
                     @"售价：180",
                     @"售价：270",
                     @"售价：450"];
    arr3 =@[@"4550",
            @"9000",
            @"18000",
            @"27000",
            @"45000"];
}
-(void)creatUI{
  
    for (int i=0; i<arr.count; i++) {
     
        Payfor_phone *btn = [[Payfor_phone alloc]init];
        btn.tag =  1000+i;
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(chooseMoneybtn:) forControlEvents:UIControlEventTouchUpInside];
        if (i<3) {
          [ btn setFrame:CGRectMake(kScreenWidth/4*i+kScreenWidth/16*(i+1), kScreenHeight/20+kScaleHeight(120), kScreenWidth/4, kScaleWidth(50))];
        }
    else{
          [btn setFrame:CGRectMake(kScreenWidth/4*(i-3)+kScreenWidth/16*(i-2), kScreenHeight/20+kScaleHeight(190), kScreenWidth/4, kScaleWidth(50))];
    
        }
        [btn SetwithString:arr[i] withString2:arr2[i]];//必须放在下面因为前面btn的frame为空

    }
    

    UILabel *lab =[[UILabel alloc]initWithFrame:CGRectMake(10, kScaleHeight(80), kScreenWidth-60, 20)];
    lab.text=@"温馨提示:";
    lab.font=[UIFont boldSystemFontOfSize:20];
    lab.textAlignment = NSTextAlignmentLeft;
    lab.tintColor = [UIColor blackColor];

    [self.view addSubview:lab];

    UILabel *lab2 =[[UILabel alloc]initWithFrame:CGRectMake(0, kScaleHeight(100), kScreenWidth, 40)];
    lab2.text=@"请务必在支付备注中，输入充值手机号码!\n到账时间为48小时以内。";
    lab2.font=[UIFont systemFontOfSize:14];
    lab2.numberOfLines=0;
    lab2.tintColor = [UIColor blackColor];
    lab2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lab2];
    
   
}
- (void)click:(UITapGestureRecognizer *)gesture{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt:18612333123"]];

}
-(void)chooseMoneybtn:(UIButton *)btn{
    if (btn==_outBtn) {
        
    }else{
        
        [_outBtn setBackgroundColor:[UIColor whiteColor]];
        [_outBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         _outBtn=btn;
        [btn setBackgroundColor:kRGB(238, 83, 84)];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    for (int i=0; i<arr2.count; i++) {
        _string = [NSString stringWithFormat:@"%@%@",@"https://spay3.swiftpass.cn/spay/merchant/scanQr?qrId=a7a37f94-c979-43ca-b392-8cb31d6b50ae&fixMoney=", arr3[btn.tag-1000]];
    }
    
    [self erweima];

}



-(void)erweima{
    // 1. 实例化二维码滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2. 恢复滤镜的默认属性
    [filter setDefaults];
    // 3. 将字符串转换成NSData
    NSData *data = [_string dataUsingEncoding:4];
    NSLog(@"%@",_string);
    // 4. 通过KVO设置滤镜inputMessage数据
    [filter setValue:data forKey:@"inputMessage"];
    
    // 5. 获得滤镜输出的图像
    CIImage *outputImage = [filter outputImage];
    
    // 6. 将CIImage转换成UIImage，并放大显示 (此时获取到的二维码比较模糊,所以需要用下面的createNonInterpolatedUIImageFormCIImage方法重绘二维码)
    //    UIImage *codeImage = [UIImage imageWithCIImage:outputImage scale:1.0 orientation:UIImageOrientationUp];
    
    _wechatImageView = [[UIImageView alloc] initWithFrame:CGRectMake(75, kScreenHeight/20+kScaleHeight(250), kScreenWidth - 150, kScreenWidth - 150)];
    UILabel *lab3 =[[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight/20+kScaleHeight(260)+kScreenWidth-150, kScreenWidth, 40)];
    lab3.text=@"客服电话:13823385791 (点击呼叫)";
    lab3.numberOfLines = 0;//
    lab3.userInteractionEnabled = YES;
    lab3.font=[UIFont systemFontOfSize:14];
    lab3.textAlignment = NSTextAlignmentCenter;
    lab3.tintColor = [UIColor blackColor];
    [self.view addSubview:lab3];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    
    [lab3  addGestureRecognizer:tap];
    _wechatImageView.image = [self createNonInterpolatedUIImageFormCIImage:outputImage withSize:200];//重绘二维码,使其显示清晰
    [self.view addSubview:_wechatImageView];

}
/**
 * 根据CIImage生成指定大小的UIImage
 *
 * @param image CIImage
 * @param size 图片宽度
 */
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}


@end
