//
//  main.m
//  ArraySorting
//
//  Created by Jeremy Petter on 2015-05-12.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray* array = @[@"eeeeeAAbfdf",
                           @"Everything",
                           @"news to me",
                           @"timepiece",
                           @"egg",
                           @"eggs",
                           @"paper",
                           @"e",
                           @"facebook",
                           @"painting",
                           @"231 thurlow st",
                           @"99 bottles"];
        
        NSComparisonResult (^Alphabetize)(NSString* string1, NSString* string2);
        
        Alphabetize= ^(NSString* string1, NSString* string2){
            
            return [string1 localizedCaseInsensitiveCompare:string2];
        };
        
        NSComparisonResult (^Lengthabetize)(NSString* string1, NSString* string2);
        
        Lengthabetize = ^(NSString* string1, NSString* string2){
            if (string1.length > string2.length){
                return NSOrderedAscending;
            } else if (string1.length < string2.length){
                return NSOrderedDescending;
            }
            return NSOrderedSame;
        };
        
        NSComparisonResult (^Ezitebahpla)(NSString* string1, NSString* string2);
        
        NSString* (^ReverseString)(NSString* string) = ^(NSString* string){
            NSString* gnirts = @"";
            for (int i = (int)string.length-1; i >= 0; i--){
                NSRange range;
                range.location = i;
                range.length = 1;
                NSString* substring = [string substringWithRange:range];
                gnirts = [gnirts stringByAppendingString:substring];
            }
            return gnirts;
        };
        
        Ezitebahpla = ^(NSString* string1, NSString* string2){
            NSString* gnirts1 = ReverseString(string1);
            NSString* gnirts2 = ReverseString(string2);
            
            return [gnirts1 localizedCaseInsensitiveCompare:gnirts2];

        };
        
        NSComparisonResult (^R_E_order)(NSString* string1, NSString* string2);
        
        R_E_order = ^(NSString* string1, NSString* string2){
            int string1Count;
            int string2Count;
            for (int i = 0; i < string1.length-1; i++){
                if ([string1 characterAtIndex:i] == 'e'){
                    string1Count++;
                }
            }
            for (int i = 0; i < string2.length-1; i++){
                if ([string2 characterAtIndex:i] == 'e'){
                    string2Count++;
                }
            }
            
            if (string1Count < string2Count){
                return NSOrderedAscending;
            }
            if (string2Count < string1Count){
                return NSOrderedDescending;
            }
                
            return NSOrderedSame;
        };
        
        
        
        
        NSArray* alphabetized = [array sortedArrayUsingComparator:Alphabetize];
        NSLog(@"\nALPHABETIZED:\n%@", alphabetized);
        
        NSArray* lenghtabetized = [array sortedArrayUsingComparator:Lengthabetize];
        NSLog(@"\nLENGTHABETIZED:\n%@", lenghtabetized);
        
        NSArray* ezitebahpla = [array sortedArrayUsingComparator:Ezitebahpla];
        NSLog(@"\nEZITEBAHPLAD:\n%@", ezitebahpla);
        
        NSArray* r_e_ordered = [array sortedArrayUsingComparator:R_E_order];
        NSLog(@"\nR_E_ORDERED:\n%@", r_e_ordered);
        
//        NSArray* e_liminated = [array sortedArrayUsingComparator:E_liminator];
//        NSLog(@"\nE-LIMINATED:\n%@", e_liminated);
        
    }
    return 0;
}

