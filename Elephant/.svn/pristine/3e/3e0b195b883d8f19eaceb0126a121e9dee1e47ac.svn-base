//
//  AppHead.h
//  Elephant
//
//  Created by YZQ on 15/8/26.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#ifndef Elephant_AppHead_h
#define Elephant_AppHead_h

#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#define STORYBOARD(StoryboardName) [UIStoryboard storyboardWithName:StoryboardName bundle:nil]
#define PUSH_VC_ANIMATED(StoryboardName, ViewControllerName) [self.navigationController pushViewController:\
[STORYBOARD(StoryboardName) instantiateViewControllerWithIdentifier:NSStringFromClass([ViewControllerName class])] \
animated:YES]
#define PUSH_VC_ANIMATED_MAIN(ViewControllerName) [self.navigationController pushViewController:\
[STORYBOARD(@"Main") instantiateViewControllerWithIdentifier:NSStringFromClass([ViewControllerName class])] \
animated:YES]


#define DEFAULT_CORNERRADIUS 4.0f   ///< 默认的按钮圆角



#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
#define IOS7_STATUS_BAR_HEGHT (IS_IOS7 ? 20.0f : 0.0f)

//按钮空隙
#define BUTTONGAP 0
//滑条宽度
#define CONTENTSIZEX 320
//按钮id
#define BUTTONID (sender.tag-100)
//滑动id
#define BUTTONSELECTEDID (self.scrollViewSelectedChannelID - 100)

#define NAVIGATIONBAR_HEIGHT 44
#define TABAR_HEIGHT 49





//CORE DATA TABLE NAME
#define TABLE_ACCOUNT @"Account"
#define TABLE_USERMESSAGE @"UserMessage"
#define TABLE_HOMEPOST @"HomePost"
#define TABLE_USERCHATME @"UserChatMe"
#define TABLE_USERPOST @"UserPost"
#define TABLE_USERCOLLECTION @"UserCollection"
#define TABLE_USERREPLY @"UserReply"
#define TABLE_USERCHATME_DICTATR @"UserChatMeDictAttribut"

#define QUERRY_PAGE_SIZE 10
#define QUERRY_PAGE_INDEX 0



#endif
