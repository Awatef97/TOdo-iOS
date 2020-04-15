//
//  AddPortocol.h
//  TodoProject
//
//  Created by Mostafa Samir on 12/17/19.
//  Copyright © 2019 Mostafa Samir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tasks.h"
NS_ASSUME_NONNULL_BEGIN

@protocol AddPortocol <NSObject>
-(void)AddTask: (Tasks *)t;
@end

NS_ASSUME_NONNULL_END
