//
//  ViewController.m
//  DateDifference
//
//  Created by Gent Berani on 9/30/15.
//  Copyright © 2015 GentBerani. All rights reserved.
//

#import "ViewController.h"
#import "DateModel.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Input in Miliseconds or Seconds
    long createdDateMiliseconds = 1453503600000;
    DateModel*dateModel = [[DateModel alloc] initWithMiliseconds:createdDateMiliseconds];
    NSLog(@"\n1) Input in Miliseconds or Seconds \nThis event created %@ ",[dateModel getDifferenceFromCurrentTime]);
    
    
    //Input in Date Format
    NSString*createDate = @"07/29/2016 00:31:00";//your custom date
    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy HH:mm:ss"];//your custom formatter
    DateModel*dateModel1 = [[DateModel alloc] initWithDate:createDate andDateFormat:dateFormatter];
    NSLog(@"\n2) Input in Date Format\nThis event created %@ ",[dateModel1 getDifferenceFromCurrentTime]);
    
}

@end
