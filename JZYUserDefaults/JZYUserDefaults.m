//
//  HDUserDefaults.m
//  JIUNetworkingDemo
//
//  Created by jiuzhiyong on 2020/4/2.
//  Copyright © 2020 JIUZhiYong. All rights reserved.
//

#import "JZYUserDefaults.h"

@implementation JZYUserDefaults

+ (void)saveCachValue:(NSString *)valueString andCachKey:(NSString *)keyString {
    NSUserDefaults *saveSetting = [NSUserDefaults standardUserDefaults];
    [saveSetting setObject:valueString forKey:keyString];
    [saveSetting synchronize];
}

+ (NSString *)getCachKey:(NSString *)keyString {
    NSUserDefaults *getSetting = [NSUserDefaults standardUserDefaults];
    return [NSString stringWithFormat:@"%@",[getSetting objectForKey:keyString]];
}

+ (void)saveCachBoolValue:(BOOL)valueBool andCachKey:(NSString *)keyString {
    NSUserDefaults *saveSetting = [NSUserDefaults standardUserDefaults];
    [saveSetting setBool:valueBool forKey:keyString];
    [saveSetting synchronize];
}

+ (BOOL)getCachBoolKey:(NSString *)keyString {
    NSUserDefaults *getSetting = [NSUserDefaults standardUserDefaults];
    return [getSetting boolForKey:keyString];
}

+ (void)saveCachArray:(NSArray *)bankArray andCachBankKay:(NSString *)bankKey {
    NSUserDefaults *saveSetting = [NSUserDefaults standardUserDefaults];
    [saveSetting setObject:bankArray forKey:bankKey];
    [saveSetting synchronize];
}

+ (NSArray *)getCachArray:(NSString *)bankKey {
    NSUserDefaults *getSetting = [NSUserDefaults standardUserDefaults];
    return [getSetting objectForKey:bankKey];
}

+ (void)saveCachDictionary:(NSDictionary *)contentDictionary andCachBankKay:(NSString *)bankKey {
    
    NSUserDefaults *saveSetting = [NSUserDefaults standardUserDefaults];
    [saveSetting setObject:(NSDictionary *)[JZYUserDefaults deleteAllNullValue:contentDictionary] forKey:bankKey];
    [saveSetting synchronize];
}

+ (NSDictionary *)getCachDictionary:(NSString *)bankKey {
    NSUserDefaults *getSetting = [NSUserDefaults standardUserDefaults];
    NSDictionary *myDictionary = [getSetting dictionaryForKey:bankKey];
    return myDictionary;
}

+ (void)removeSaveCachKey:(NSString *)keyString {
    NSUserDefaults *getSetting = [NSUserDefaults standardUserDefaults];
    [getSetting removeObjectForKey:keyString];
    [getSetting synchronize];
}

+ (NSDictionary *)deleteAllNullValue:(NSDictionary *)dict{
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc]init];
    for (NSString *keyStr in dict.allKeys) {
        
        if([[dict objectForKey:keyStr] isKindOfClass:[NSArray class]]){
            NSArray *contentArray = (NSArray *)[dict objectForKey:keyStr];
            if(contentArray.count <= 0){
                [mutableDic setObject:@[] forKey:keyStr];
            }
            else{
                [mutableDic setObject:[dict objectForKey:keyStr] forKey:keyStr];
            }
        } else {
            if([[dict objectForKey:keyStr] isEqual:[NSNull class]]){
                [mutableDic setObject:@"" forKey:keyStr];
            } else if ([[dict objectForKey:keyStr] isEqual:@"<null>"]){
                [mutableDic setObject:@"" forKey:keyStr];
            }
            else{
                [mutableDic setObject:[dict objectForKey:keyStr] forKey:keyStr];
            }
        }
    }
    return mutableDic;
}
@end
