//
//  Class1.h
//  test_KVO
//
//  Created by Krzysztof Satola on 19.04.2013.
//  Copyright (c) 2013 API-SOFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Class1 : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong) NSMutableArray *phoneNumbers;

- (void)addPhoneNumber:(NSString *)pn;
- (void)modifyOldPhoneNumber:(NSString *)oldNumber withNew:(NSString *)newNumber;

@end
