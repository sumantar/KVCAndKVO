//
//  ViewController.m
//  test_KVO
//
//  Created by Krzysztof Satola on 19.04.2013.
//  Copyright (c) 2013 API-SOFT. All rights reserved.
//

#import "Class3.h"

@interface Class3 ()

@end

@implementation Class3


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self testKVO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testKVO
{
    // Create objects
    self.c1 = [[Class1 alloc] init];
    self.c2 = [Class2 new]; // the same as alloc and then init
    
    // Register for KVO, only new value of the firstName property will be sent to c2
    [self.c1 addObserver:self.c2 forKeyPath:@"firstName" options:0 context:nil];
    
    // Change the value in a KVO compliant way (using a setter method)
    // As a result, the observerValueForKeyPath:ofObject:change:context: message will be sent to c2
    self.c1.firstName = @"John";
    self.c1.firstName = @"David";
    
    // Register for KVO, new and old values of the lastName property will be sent to c2
    [self.c1 addObserver:self.c2 forKeyPath:@"lastName" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
    
    // Trigger another change
    //use self.c1.lastName = @"Brown";
    // or [self.c1 setLastName:@"Brown"];
    // or
    [self.c1 setValue:@"Brown" forKey:@"lastName"];
    [self.c1 setLastName:@"Dow"];
    
    // Register for KVO, new and old values of objects within the phoneNumbers property will be sent to c2
    [self.c1 addObserver:self.c2 forKeyPath:@"phoneNumbers" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    // Trigger the KVO notification
    [self.c1 addPhoneNumber:@"1-123-456-789"];
    [self.c1 addPhoneNumber:@"2-123-456-789"];
    [self.c1 addPhoneNumber:@"3-123-456-789"];
    
    NSLog(@"c1.phoneNumbers ->%@", self.c1.phoneNumbers);
    
    [self.c1 modifyOldPhoneNumber:@"2-123-456-789" withNew:@"4-123-456-789"];
    
    NSLog(@"c1.phoneNumbers ->%@", self.c1.phoneNumbers);
}

- (void)dealloc
{
    [self.c1 removeObserver:self.c2 forKeyPath:@"firstName"];
    [self.c1 removeObserver:self.c2 forKeyPath:@"lastName"];
    [self.c1 removeObserver:self.c2 forKeyPath:@"phoneNumbers"];
}

@end
