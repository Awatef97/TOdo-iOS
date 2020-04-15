//
//  ViewController.m
//  TodoProject
//
//  Created by Mostafa Samir on 12/14/19.
//  Copyright © 2019 Mostafa Samir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated{
    _namelbl.text=_TaskName;
    _descriptionlbl.text=_desc;
    _statuslbl.text=_status;
    _prioritylbl.text=_priority;
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}


@end
