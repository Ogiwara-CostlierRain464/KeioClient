//
//  ClassTableViewCell.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/04.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import "ClassTableViewCell.h"

@interface ClassTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *subject;
@property ClassColumn *classColumn;

@end

@implementation ClassTableViewCell

@synthesize classColumn;
@synthesize date;
@synthesize subject;

- (void)setData:(ClassColumn *)classColumn{
    self.classColumn = classColumn;
    
    //TODO date.text =  classColumn.date.description;
    subject.text = classColumn.subject;
}


@end
