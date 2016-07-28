//
//  ParsimiDates.m
//  DateDifference
//
//  Created by Gent Berani on 9/30/15.
//  Copyright © 2015 GentBerani. All rights reserved.
//

#import "DateModel.h"

@implementation DateModel

-(instancetype)initWithMiliseconds:(long)inMiliseconds{
    self = [super self];
    if(!self)
        return nil;
    calculationType = CalculateFromMiliseconds;
    self->miliseconds = inMiliseconds;
    return self;
}
-(instancetype)initWithDate:(NSString*)stringDate andDateFormat:(NSDateFormatter*)inDateFormatter{
    self = [super self];
    if(!self)
        return nil;
    calculationType     = CalculateFromDate;
    self->dateString    = stringDate;
    self->dateFormatter = inDateFormatter;
    return self;
}
- (NSString *) getDifferenceFromCurrentTime{
    
    NSDate *createdDate;
    NSString *formattedDateString;
    if(calculationType == CalculateFromDate){
        createdDate = [dateFormatter dateFromString: dateString];
        formattedDateString = [dateFormatter stringFromDate:createdDate];
    }else{
        if(miliseconds == 0)
            return @"";
        NSString *timeLength =[NSString stringWithFormat:@"%lu",miliseconds];
        NSUInteger length = [timeLength length];
        if(length == 13){
            miliseconds = miliseconds / 1000;
        }
        createdDate = [NSDate dateWithTimeIntervalSince1970:miliseconds];
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
        [dateFormatter setTimeZone:timeZone];
        formattedDateString = [dateFormatter stringFromDate:createdDate];
    }
    
    
    
    if([self todaysIsLess:formattedDateString]){
        return @"";
    }
    
    
    NSString *timeLeft;
    NSDate *currentDate =[NSDate date];
    NSInteger seconds = [currentDate timeIntervalSinceDate:createdDate];
    
    NSInteger days = (int) (floor(seconds / (3600 * 24)));
    if(days) seconds -= days * 3600 * 24;
    
    NSInteger hours = (int) (floor(seconds / 3600));
    if(hours) seconds -= hours * 3600;
    
    NSInteger minutes = (int) (floor(seconds / 60));
    if(minutes) seconds -= minutes * 60;
    
    if(days) {
        timeLeft = [NSString stringWithFormat:@"%ld Days", (long)days*-1];
    }
    else if(hours) { timeLeft = [NSString stringWithFormat: @"%ld H", (long)hours*-1];
    }
    else if(minutes) { timeLeft = [NSString stringWithFormat: @"%ld M", (long)minutes*-1];
    }
    else if(seconds)
        timeLeft = [NSString stringWithFormat: @"%lds", (long)seconds*-1];
    //NSLog(@"Days: %lu <>  Hours: %lu <> Minutes: %lu  <> Seconds: %lu",days,hours,minutes,seconds);
    
    NSString *result = [[NSString alloc]init];
    
    if (days == 0) {
        if (hours == 0) {
            if (minutes == 0) {
                if (seconds < 0) {
                    return @"0s";
                } else {
                    if (seconds < 59) {
                        return @"now";
                    }
                }
            } else {
                if(minutes==1)
                    return  [NSString stringWithFormat:@"%lu minute ago",minutes];
                return  [NSString stringWithFormat:@"%lu minutes ago",minutes];
            }
        } else {
            if(hours==1)
                return  [NSString stringWithFormat:@"%lu hour ago",hours];
            return  [NSString stringWithFormat:@"%lu hours ago",hours];
        }
        
    } else {
        if (days <= 29 && days>0) {
            if(days==1)
                return  [NSString stringWithFormat: @"%lu day ago",days];
            return  [NSString stringWithFormat: @"%lu days ago",days];
        }
        if (days > 29 && days <= 58) {
            return  @"1 month ago";
        }
        if (days > 58 && days <= 87) {
            return  @"2 months ago";
        }
        if (days > 87 && days <= 116) {
            return  @"3 months ago";
        }
        if (days > 116 && days <= 145) {
            return  @"4 months ago";
        }
        if (days > 145 && days <= 174) {
            return  @"5 months ago";
        }
        if (days > 174 && days <= 203) {
            return  @"6 months ago";
        }
        if (days > 203 && days <= 232) {
            return  @"7 months ago";
        }
        if (days > 232 && days <= 261) {
            return  @"8 months ago";
        }
        if (days > 261 && days <= 290) {
            return  @"9 months ago";
        }
        if (days > 290 && days <= 319) {
            return  @"10 months ago";
        }
        if (days > 319 && days <= 348) {
            return  @"11 months ago";
        }
        if (days > 348 && days <= 360) {
            return  @"12 months ago";
        }
        
        if (days > 360 && days <= 720) {
            return  @"1 year ago";
        }
        
        if (days > 720) {
            NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
            [formatter1 setDateFormat:@"MM/dd/yyyy"];
            NSString *fdisplay = [formatter1 stringFromDate:createdDate];
            return fdisplay;
        }
        
    }
    
    return result;
    
}

- (BOOL) todaysIsLess: (NSString *)dateToCompare{
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter1 setTimeZone:timeZone];
    NSDate *today = [NSDate date];
    NSDate *newDate = [dateFormatter1 dateFromString:dateToCompare]; // your date
    NSComparisonResult result;
    
    result = [today compare:newDate]; // comparing two dates
    
    if(result==NSOrderedAscending)//today is less
        return true;
    return false;
}


@end
