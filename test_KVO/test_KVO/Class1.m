//
//  Class1.m
//  test_KVO
//
//  Created by Krzysztof Satola on 19.04.2013.
//  Copyright (c) 2013 API-SOFT. All rights reserved.
//

#import "Class1.h"

@implementation Class1

- (id)init
{
    if (self = [super init])
    {
        _phoneNumbers = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return self;
}

- (void)addPhoneNumber:(NSString *)pn
{
    [[self mutableArrayValueForKey:@"phoneNumbers"] addObject:pn];
}

- (void)modifyOldPhoneNumber:(NSString *)oldNumber withNew:(NSString *)newNumber
{
    NSUInteger i = [self.phoneNumbers indexOfObject:oldNumber];
    if (i != NSNotFound)
    {
        [[self mutableArrayValueForKey:@"phoneNumbers"] replaceObjectAtIndex:i withObject:newNumber];
    }
}

@end
