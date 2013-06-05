//
//  ViewController.h
//  test_KVO
//
//  Created by Krzysztof Satola on 19.04.2013.
//  Copyright (c) 2013 API-SOFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Class1.h"
#import "Class2.h"

@interface Class3 : UIViewController

@property (nonatomic, strong) Class1 *c1;
@property (nonatomic, strong) Class2 *c2;

@end
