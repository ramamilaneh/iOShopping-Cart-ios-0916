//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Rama Milaneh on 2/17/17.
//  Copyright © 2017 FIS. All rights reserved.
//

#import "FISShoppingCart.h"
#import "FISItem.h"

@implementation FISShoppingCart

-(NSInteger)calculateTotalPriceInCents {
    
    if ([self items].count == 0) {
        return 0;
    }else{
        NSInteger sum = 0;
        for (NSUInteger i = 0; i<[self items].count; i++) {
            sum = sum + [self.items[i] priceInCents];
        }
        return sum;
    }
}

-(void)addItem:(FISItem *)item {
    
    [self.items addObject:item];
}

-(void)removeItem:(FISItem *)item {
    
    for (NSUInteger i = 0; i<self.items.count; i++) {
        if (self.items[i] == item) {
            [self.items removeObjectAtIndex:i];
            break;
        }
    }
}

-(void)removeAllItemsLikeItem:(FISItem *)item {
    
    for (NSUInteger i = 0; i<self.items.count; i++) {
        if (self.items[i] == item) {
            [self.items removeObjectAtIndex:i];
        }
    }
}

-(void)sortItemsByNameAsc {
    
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:true];
    NSArray *sortedItems = [self.items sortedArrayUsingDescriptors:@[sortAsc]];
    self.items = [NSMutableArray arrayWithArray:sortedItems];
    
}
-(void)sortItemsByNameDesc {
    
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    NSArray *sortedItems = [self.items sortedArrayUsingDescriptors:@[sortAsc]];
    self.items = [NSMutableArray arrayWithArray:sortedItems];
    
}

-(void)sortItemsByPriceInCentsAsc {
    
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:true];
    NSArray *sortedItems = [self.items sortedArrayUsingDescriptors:@[sortAsc]];
    self.items = [NSMutableArray arrayWithArray:sortedItems];
}

-(void)sortItemsByPriceInCentsDesc {
    
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:false];
    NSArray *sortedItems = [self.items sortedArrayUsingDescriptors:@[sortAsc]];
    self.items = [NSMutableArray arrayWithArray:sortedItems];
    
}

-(NSArray *)allItemsWithName:(NSString *)name {
    
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name LIKE %@", name];
    NSArray *filteredArray = [self.items filteredArrayUsingPredicate:namePredicate];
    return filteredArray;
}

-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price {
    
    NSPredicate *pricePredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %lu", price];
    NSArray *filteredArray = [self.items filteredArrayUsingPredicate:pricePredicate];
    return filteredArray;
}

-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price {
    
    NSPredicate *pricePredicate = [NSPredicate predicateWithFormat:@"priceInCents <= %lu", price];
    NSArray *filteredArray = [self.items filteredArrayUsingPredicate:pricePredicate];
    return filteredArray;
}

@end
