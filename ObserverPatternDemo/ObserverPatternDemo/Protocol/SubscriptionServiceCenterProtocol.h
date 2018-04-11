//
//  SubscriptionServiceCenterProtocol.h
//  ObserverPatternDemo
//
//  Created by 魏欣宇 on 2018/4/11.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SubscriptionServiceCenterProtocol <NSObject>

- (void)subscriptionMessage:(id) message subscriptionNumber:(NSString *) subscription_number;

@end
