//
//  GoodsIdSearchVcManager.m
//  YDD
//
//  Created by shenliping on 16/1/7.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "GoodsIdSearchVcManager.h"
#import "AFNetworking.h"

@implementation GoodsIdSearchVcManager

+ (void)postJSONWithUrl:(NSString *)aUrl Userid:(NSString *)userid Token:(NSString *)token GoodsId:(NSString *)goodsId success:(void (^)(id))success fail:(void (^)())fail
{
    //组织data
    NSArray *dataArry1 = [NSArray arrayWithObjects:@"id", @"token", @"editor", nil];
    NSArray *dataArry2 = [NSArray arrayWithObjects:goodsId, token, userid, nil];
    NSDictionary *dataDict = [[NSDictionary alloc] initWithObjects:dataArry2 forKeys:dataArry1];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    [manager.requestSerializer setTimeoutInterval:10];
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    [manager POST:aUrl parameters:dataDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail();
    }];
    
}

@end
