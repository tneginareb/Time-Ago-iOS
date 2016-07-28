//
//  ParsimiDates.h
//  DateDifference
//
//  Created by Gent Berani on 9/30/15.
//  Copyright © 2015 GentBerani. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CalculationType) {
    CalculateFromMiliseconds,
    CalculateFromDate
};
@interface DateModel : NSObject{
    @private CalculationType calculationType;
    @private long miliseconds;
    @private NSString*dateString;
    @private NSDateFormatter*dateFormatter;
}
- (instancetype)initWithMiliseconds:(long)miliseconds;
- (instancetype)initWithDate:(NSString*)stringDate andDateFormat:(NSDateFormatter*)inDateFormatter;
- (NSString *) getDifferenceFromCurrentTime;

@end
