//
//  HDUserDefaults.h
//  JIUNetworkingDemo
//
//  Created by jiuzhiyong on 2020/4/2.
//  Copyright © 2020 JIUZhiYong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JZYUserDefaults : NSObject


+ (void)saveCachValue:(NSString *)valueString andCachKey:(NSString *)keyString;
+ (NSString *)getCachKey:(NSString *)keyString;

+ (void)saveCachBoolValue:(BOOL)valueBool andCachKey:(NSString *)keyString;
+ (BOOL)getCachBoolKey:(NSString *)keyString;

+ (void)saveCachArray:(NSArray *)bankArray andCachBankKay:(NSString *)bankKey;
+ (NSArray *)getCachArray:(NSString *)bankKey;


+ (void)saveCachDictionary:(NSDictionary *)contentDictionary andCachBankKay:(NSString *)bankKey;
+ (NSDictionary *)getCachDictionary:(NSString *)bankKey;

+ (void)removeSaveCachKey:(NSString *)keyString;


@end

NS_ASSUME_NONNULL_END
