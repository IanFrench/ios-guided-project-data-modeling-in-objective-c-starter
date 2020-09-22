
//  FirstResponder.m
//  Quakes-Objc
//
//  Created by Ian French on 9/21/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "FirstResponder.h"

@implementation FirstResponder



@synthesize name = myInternalName;

- (void)setName:(NSString *)aName
{
    // will set
    myInternalName = aName.copy;

    // didset


}

- (NSString *)name
{
    return myInternalName.copy;
}

 @end
