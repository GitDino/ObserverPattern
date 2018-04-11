//
//  SubscriptionServiceCenter.m
//  ObserverPatternDemo
//
//  Created by 魏欣宇 on 2018/4/11.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "SubscriptionServiceCenter.h"

static NSMutableDictionary *subscription_dict = nil;

@implementation SubscriptionServiceCenter

#pragma mark - Life Cycle
+ (void)initialize
{
    if (self == [SubscriptionServiceCenter class])
    {
        subscription_dict = [NSMutableDictionary dictionary];
    }
}

#pragma mark - Private Cycle
+ (NSHashTable *)existSubscriptionNumber:(NSString *) subscription_number
{
    return [subscription_dict objectForKey:subscription_number];
}

#pragma mark - 维护订阅信息
+ (void)createSubscriptionNumber:(NSString *) subscription_number
{
    NSParameterAssert(subscription_number);
    
    NSHashTable *hash_table = [self existSubscriptionNumber:subscription_number];
    if (hash_table == nil)
    {
        hash_table = [NSHashTable weakObjectsHashTable];
        [subscription_dict setObject:hash_table forKey:subscription_number];
    }
}

+ (void)removeSubscriptionNumber:(NSString *) subscription_number
{
    NSParameterAssert(subscription_number);
    
    NSHashTable *hash_table = [self existSubscriptionNumber:subscription_number];
    if (hash_table)
    {
        [subscription_dict removeObjectForKey:subscription_number];
    }
}

#pragma mark - 维护客户信息
+ (void)addCustomer:(id<SubscriptionServiceCenterProtocol>) customer withSubscriptionNumber:(NSString *) subscription_number
{
    NSParameterAssert(subscription_number);
    
    NSHashTable *hash_table = [self existSubscriptionNumber:subscription_number];
    [hash_table addObject:customer];
}

+ (void)removeCustomer:(id<SubscriptionServiceCenterProtocol>) customer withSubscriptionNumber:(NSString *) subscription_number
{
    NSParameterAssert(subscription_number);
    
    NSHashTable *hash_table = [self existSubscriptionNumber:subscription_number];
    [hash_table removeObject:customer];
}

#pragma mark - 发送消息
+ (void)sendMessage:(id) message toSubscriptionNumber:(NSString *) subscription_number
{
    NSParameterAssert(subscription_number);
    
    NSHashTable *hash_table = [self existSubscriptionNumber:subscription_number];
    if (hash_table)
    {
        NSEnumerator *enumerator = [hash_table objectEnumerator];
        id<SubscriptionServiceCenterProtocol> object = nil;
        while (object = [enumerator nextObject])
        {
            if ([object respondsToSelector:@selector(subscriptionMessage:subscriptionNumber:)])
            {
                [object subscriptionMessage:message subscriptionNumber:subscription_number];
            }
        }
    }
}

@end
