//
//  ResponseHead.h
//  Elephant
//
//  Created by YZQ on 15/8/27.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#ifndef Elephant_ResponseHead_h
#define Elephant_ResponseHead_h

//user response key

/**
 common keys
 */

#define COMMON_ISSUCCESS @"IsSuccess"
#define COMMON_ERRORCODE @"Code"
#define COMMON_RESULT @"Result"
#define COMMON_ERRORMSG @"Message"


/**
 user infomation
 */
#define USER_CONCERNS @"Concerns"                     //关注数
#define USER_DEPARTMENT @"Department"                 //科室
#define USER_FANS @"Fans"                             //粉丝数
#define USER_GENDER @"Gender"                         //性别
#define USER_HOSPITAL @"Hospital"                     //医院
#define USER_ICONID @"IconId"                         //头像id
#define USER_ID @"Id"                                 //用户id
#define USER_INTEGRAL @"Integral"                     //积分
#define USER_INTRODUCE @"Introduce"                   //自我介绍
#define USER_NAME @"Name"                             //姓名
#define USER_REGION @"Region"                         //地区
#define USER_SIGNATURE @"Signature"                   //签名
#define USER_TITLE @"Title"                           //职称
#define USER_SESSIONID @"UserId"                      //会话id

/**
 my posts
 */

#define USER_MESSAGE_POSTID @"PostId"                   //帖子id
#define USER_MESSAGE_POSTTITLE @"PostTitle"             //帖子标题
#define USER_MESSGAE_CONTENT @"Content"                 //帖子内容
#define USER_MESSGAE_SUPPORTS @"Supports"               //点赞数
#define USER_MESSGAE_ISCOLLECTION @"IsCollection"       //是否已收藏
#define USER_MESSAGE_REPLYID @"ReplyId"                 //回复id
#define USER_MESSAGE_ISSUPPORT @"IsSupport"             //是否已点赞
#define USER_MESSAGE_ISCOURSE @"IsCourse"               //是否为课程学习
#define USER_MESSAGE_SENDER @"Sender"                 //发送人姓名
#define USER_MESSAGE_SENDERID @"SendId"                 //发送人id
#define USER_MESSAGE_ICONID @"IconId"                   //发送人头像id
#define USER_MESSAGE_POSTTIME @"PostTime"               //发送时间




/**
 
 my collection
 
 */

#define USER_COLLECTION_AUTHOR @"Author"
#define USER_COLLECTION_FAVPOSTDETAIURL @"FavPostDetailUrl"
#define USER_COLLECTION_ICONID @"IconId"
#define USER_COLLECTION_ISCOURSE @"IsCourse"
#define USER_COLLECTON_ISEXPERT @"IsExpert"
#define USER_COLLECTION_ISEXTRACTIVE @"IsExtractive"
#define USER_COLLECTION_ISHOT @"IsHot"
#define USER_COLLECTION_ISINCLUDEPIC @"IsIncludePic"
#define USER_COLLECTION_ISTOP @"IsTop"
#define USER_COLLECTION_POSTID @"PostId"
#define USER_COLLECTION_POSTTIME @"PostTime"
#define USER_COLLECTION_REPLYS @"Replys"
#define USER_COLLECTION_SUPPORTS @"Supports"
#define USER_COLLECTION_TITLE @"Title"


/**
 
 user chatme
 
 */


#define USER_CHATME_CHART @"Chart" 
#define USER_CHATME_NOTREADNUM @"NotReadNum" 

#define USER_CHATME_DICTATR_CONTENT @"Content"
#define USER_CHATME_DICTART_ICONID @"IconId"
#define USER_CHATME_DICTART_POSTTIME @"PostTime"
#define USER_CHATME_DICTART_SENDID @"SendId"
#define USER_CHATME_DICTART_SENDER @"Sender"
#define USER_CHATME_DICTART_RECEIVE @"receiver"





/**
 
 home
 
 */
#define HOME_POST_ID @"Id"
#define HOME_POST_TITLE @"Title"
#define HOME_POST_AUTHORID @"AuthorId"
#define HOME_POST_AUTHORNAME @"AuthorName"
#define HOME_POST_ISRECOMMAND @"IsExpertRecommand"
#define HOME_POST_ISCOLLECTION @"IsCollection"
#define HOME_POST_FAVCNT @"FavCnt"
#define HOME_POST_PRIASECNT @"PriaseCnt"
#define HOME_POST_REPLECNT @"RepleCnt"
#define HOME_POST_POSTTIME @"PostTime"
#define HOME_POST_IMGID @"ImgId"
#define HOME_POST_ISHOT @"IsHot"
#define HOME_POST_ISEXTRACTIVE @"IsExtractive"
#define HOME_POST_ISTOP @"IsTop"
#define HOME_POST_ISINCLUDEPIC @"IsIncludePic"
#define HOME_POST_ISCOURSE @"IsCourse"
#define HOME_POST_LIST @"PostList"





#endif
