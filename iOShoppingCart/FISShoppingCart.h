//
//  FISShoppingCart.h
//  iOShoppingCart
//
//  Created by Rama Milaneh on 2/17/17.
//  Copyright © 2017 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISItem.h"

@interface FISShoppingCart : NSObject

@property (nonatomic) NSMutableArray *items;

-(NSInteger)calculateTotalPriceInCents;
-(void)addItem:(FISItem *)item;
-(void)removeItem:(FISItem *)item;
-(void)removeAllItemsLikeItem:(FISItem *)item;
-(void)sortItemsByNameAsc;
-(void)sortItemsByNameDesc;
-(void)sortItemsByPriceInCentsAsc;
-(void)sortItemsByPriceInCentsDesc;
-(NSArray *)allItemsWithName:(NSString *)name;
-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price;
-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price;

@end
