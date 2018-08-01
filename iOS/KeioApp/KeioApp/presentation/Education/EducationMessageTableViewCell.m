//
//  EducationMessageTableViewCell.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/02.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import "EducationMessageTableViewCell.h"
#import "EducationMessage.h"

@interface EducationMessageTableViewCell ()

@property EducationMessage *message;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *introduction;

@end

@implementation EducationMessageTableViewCell

@synthesize message;
@synthesize title;
@synthesize introduction;

- (void)setData:(EducationMessage *)message{
    self.message = message;
    
    title.text = message.title;
    introduction.text = message.detail;
}

@end
