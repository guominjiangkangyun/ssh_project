//
//  HomeTopScrollView.m
//  Elephant
//
//  Created by YZQ on 15/9/9.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "HomeTopScrollView.h"
#import "UIColor+YBColor.h"
#import "HomeRootScrollView.h"
@implementation HomeTopScrollView

+(HomeTopScrollView *)shareInstance{

    static HomeTopScrollView *_instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{

        _instance=[[self alloc] initWithFrame:CGRectMake(0, IOS7_STATUS_BAR_HEGHT+NAVIGATIONBAR_HEIGHT, SCREEN_WIDTH, TOP_SCROLLVIEW_HEIGHT)];
        [_instance setBackgroundColor:[UIColor lightGrayColor]];
        
        
    });
    return _instance;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.backgroundColor = [UIColor lightTextColor];
        self.pagingEnabled = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        userSelectedChannelID = 100;
        self.scrollViewSelectedChannelID = 100;
        
        self.titleXs = [NSMutableArray array];
        self.titleBtns = [NSMutableArray array];
    }
    return self;
}

- (void)initHeadButtons{

    float pointX = 0.0, sizeWidth = SCREEN_WIDTH/3;
    NSInteger headBtnNum = [self.titles count];
    
    for (int i = 0; i < headBtnNum; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *title = [self.titles objectAtIndex:i];
        
        [button setTag:i+100];
        
        if (i == 0) {
            
            button.selected = YES;
        }
        
        [button setTitle:title forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        
        [button setTitleColor:[UIColor  colorFromHexRGB:@"868686"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorFromHexRGB:@"868686"] forState:UIControlStateSelected];
       
        [button addTarget:self action:@selector(headBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        button.frame = CGRectMake(pointX, 0, sizeWidth, TOP_SCROLLVIEW_HEIGHT);
        
        [self.titleXs addObject:@(pointX)];
        pointX += sizeWidth;
        [self.titleBtns addObject:@(button.frame.size.width)];
        [self addSubview:button];
        
    }
    
    self.contentSize = CGSizeMake(pointX, 30);
    
    shadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(BUTTONGAP, 0, [[_titleBtns objectAtIndex:0] floatValue], TOP_SCROLLVIEW_HEIGHT)];
    [shadowImageView setImage:[UIImage imageNamed:@"red_line_and_shadow.png"]];
    [self addSubview:shadowImageView];
 
}


- (void)headBtnClick:(UIButton *)sender{
    
    [self resetScrollViewContentX:sender];
    
    if (sender.tag != userSelectedChannelID) {
        
        UIButton *buttonLst = (UIButton *)[self viewWithTag:userSelectedChannelID];
        buttonLst.selected = NO;
        userSelectedChannelID = sender.tag;
        
        
    }
    
    if (!sender.selected) {
        
        sender.selected = YES;
        
        [UIView animateWithDuration:0.25 animations:^{
            
            [shadowImageView setFrame:CGRectMake(sender.frame.origin.x, 0, [[self.titleBtns objectAtIndex:BUTTONID] floatValue], TOP_SCROLLVIEW_HEIGHT)];
            
        } completion:^(BOOL finished) {
            if (finished) {
                
                [[HomeRootScrollView shareInstance] setContentOffset:CGPointMake(BUTTONID*SCREEN_WIDTH, 0) animated:YES];
                
                self.scrollViewSelectedChannelID = sender.tag;
            }
        }];
        
    }
}


- (void)setButtonUnSelected{

    UIButton *buttonLst = (UIButton *)[self viewWithTag:self.scrollViewSelectedChannelID];
    
    buttonLst.selected = NO;
    
}

- (void)setButtonSelected{

    UIButton *button = (UIButton *)[self viewWithTag:self.scrollViewSelectedChannelID];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [shadowImageView setFrame:CGRectMake(button.frame.origin.x, 0, [[self.titleBtns objectAtIndex:button.tag-100] floatValue], TOP_SCROLLVIEW_HEIGHT)];
        
    } completion:^(BOOL finished) {
        if (finished) {
            if (!button.selected) {
                button.selected = YES;
                userSelectedChannelID = button.tag;
            }
        }
    }];
    
}




- (void)resetScrollViewContentX:(UIButton *)sender{

    float originX = [[_titleXs objectAtIndex:BUTTONID] floatValue];
    
    if (sender.frame.origin.x - self.contentOffset.x < 5) {
        [self setContentOffset:CGPointMake(originX,0)  animated:YES];
    }
    
    

}

- (void)setScrollViewContentX{
    
    
    float originX = [[_titleXs objectAtIndex:BUTTONSELECTEDID] floatValue];
    
    if (originX - self.contentOffset.x < 5) {
        [self setContentOffset:CGPointMake(originX,0)  animated:YES];
    }
    


    
}

@end



















