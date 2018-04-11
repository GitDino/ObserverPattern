//
//  SubscriptionServiceCenter.h
//  ObserverPatternDemo
//
//  Created by 魏欣宇 on 2018/4/11.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubscriptionServiceCenterProtocol.h"

@interface SubscriptionServiceCenter : NSObject

#pragma mark - 维护订阅信息

/**
 创建订阅号

 @param subscription_number 订阅号码
 */
+ (void)createSubscriptionNumber:(NSString *) subscription_number;

/**
 移除订阅号

 @param subscription_number 订阅号码
 */
+ (void)removeSubscriptionNumber:(NSString *) subscription_number;

#pragma mark - 维护客户信息

/**
 添加客户到具体的订阅号当中

 @param customer 客户
 @param subscription_number 订阅号码
 */
+ (void)addCustomer:(id<SubscriptionServiceCenterProtocol>) customer withSubscriptionNumber:(NSString *) subscription_number;

/**
 从具体的订阅号当中移除客户

 @param customer 客户
 @param subscription_number 订阅号码
 */
+ (void)removeCustomer:(id<SubscriptionServiceCenterProtocol>) customer withSubscriptionNumber:(NSString *) subscription_number;

#pragma mark - 发送消息

/**
 发送消息到具体的订阅号当中

 @param message 消息
 @param subscription_number 订阅号码
 */
+ (void)sendMessage:(id) message toSubscriptionNumber:(NSString *) subscription_number;

@end
