//
//  ZPLeftTableViewCell.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/19.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPLeftTableViewCell.h"
#import "ZPLeftItem.h"
@interface ZPLeftTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *namel;
@property (weak, nonatomic) IBOutlet UIView *lineV;

@end
@implementation ZPLeftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   self.lineV.hidden=YES;
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    
}


-(void)setLeftItem:(ZPLeftItem *)leftItem
{
    _leftItem=leftItem;

    self.namel.text=leftItem.name;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
    self.namel.textColor=selected?[UIColor redColor]:[UIColor blackColor];
    self.lineV.hidden=!selected;
   }



@end
