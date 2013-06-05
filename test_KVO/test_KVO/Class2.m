//
//  Class2.m
//  test_KVO
//
//  Created by Krzysztof Satola on 19.04.2013.
//  Copyright (c) 2013 API-SOFT. All rights reserved.
//

#import "Class2.h"

@implementation Class2

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"keyPath %@", keyPath);
    if ([keyPath isEqual:@"firstName"])
    {
        id newValue = [object valueForKeyPath:keyPath];
        NSLog(@"The keyPath %@ changed to %@", keyPath, newValue);
    }
    else if ([keyPath isEqual:@"lastName"])
    {
        id newValue = change[NSKeyValueChangeNewKey];
        id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
        NSLog(@"The keyPath %@ changed from %@ to %@", keyPath, oldValue, newValue);
    }
    else if ([keyPath isEqual:@"phoneNumbers"])
    {
        id newValue = [change objectForKey:NSKeyValueChangeNewKey];
        id oldValue = change[NSKeyValueChangeOldKey];
        NSLog(@"The keyPath %@ changed from %@ to %@", keyPath, oldValue, newValue);
    }
}

@end
