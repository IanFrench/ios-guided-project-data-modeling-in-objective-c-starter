//
//  FirstResponder.h
//  Quakes-Objc
//
//  Created by Ian French on 9/21/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstResponder : NSObject

@property (nonatomic, copy) NSString *name;
/* Setter:
 - (void) setName: (NSSTring *)aName;

 Getter
 - (NSString *)name;

 instance variable () in the class's @interface)
 NSString *_name;


 */

@end

