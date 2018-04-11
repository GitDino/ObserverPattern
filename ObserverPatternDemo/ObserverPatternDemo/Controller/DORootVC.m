//
//  DORootVC.m
//  ObserverPatternDemo
//
//  Created by 魏欣宇 on 2018/4/11.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DORootVC.h"
#import "SubscriptionServiceCenter.h"

#import "DOCustomer.h"

static NSString *SCIENCE = @"SCIENCE";
@interface DORootVC ()<SubscriptionServiceCenterProtocol>

@property (nonatomic, strong) DOCustomer *customer;

@end

@implementation DORootVC

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"观察者模式";
    self.view.backgroundColor = [UIColor redColor];
    
    //创建自定义用户
    self.customer = [[DOCustomer alloc] init];
    
    //创建订阅号
    [SubscriptionServiceCenter createSubscriptionNumber:SCIENCE];
    
    //添加第一个订阅的用户到指定的刊物，self：DORootVC
    [SubscriptionServiceCenter addCustomer:self withSubscriptionNumber:SCIENCE];
    
    //添加第二个订阅的用户到指定的刊物，self.customer：DOCustomer对象
    [SubscriptionServiceCenter addCustomer:self.customer withSubscriptionNumber:SCIENCE];
    
    //发行机构发送消息
    [SubscriptionServiceCenter sendMessage:@"V1.0" toSubscriptionNumber:SCIENCE];
}

- (void)subscriptionMessage:(id)message subscriptionNumber:(NSString *)subscription_number
{
    NSLog(@"DORootVC : %@\n%@--%@", [self class], message, subscription_number);
}

@end
