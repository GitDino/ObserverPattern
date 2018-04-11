//
//  DOCustomer.m
//  ObserverPatternDemo
//
//  Created by 魏欣宇 on 2018/4/11.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOCustomer.h"

@implementation DOCustomer

#pragma mark - SubscriptionServiceCenterProtocol协议方法
- (void)subscriptionMessage:(id)message subscriptionNumber:(NSString *)subscription_number
{
    NSLog(@"Customer : %@\n%@--%@", [self class], message, subscription_number);
}

@end
