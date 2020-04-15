//
//  ViewController.h
//  TodoProject
//
//  Created by Mostafa Samir on 12/14/19.
//  Copyright © 2019 Mostafa Samir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *namelbl;
@property (weak, nonatomic) IBOutlet UILabel *descriptionlbl;
@property (weak, nonatomic) IBOutlet UILabel *statuslbl;
@property (weak, nonatomic) IBOutlet UILabel *prioritylbl;

@property NSString *TaskName;
@property NSString *desc;
@property NSString *status;
@property NSString *priority;
@end

