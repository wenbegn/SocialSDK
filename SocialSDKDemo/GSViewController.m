//
//  GSViewController.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSViewController.h"

@import SocialSDK;

@interface GSViewController ()

@end

@implementation GSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)selectSharePlan:(id)sender
{
    [GSShareView showShareViewWithChannels:@[
                                             @(GSShareChannelTypeSina),
                                             @(GSShareChannelTypeQQ),
                                             @(GSShareChannelTypeQzone),
                                             @(GSShareChannelTypeWechatSession),
                                             @(GSShareChannelTypeWechatTimeLine)
                                             ]
                           completionBlock:^(BOOL isCancel, GSShareChannelType channelType) {
                               if (isCancel) {
                                   NSLog(@"用户点击了取消分享");
                               } else {
                                   id<GSShareProtocol> share = [[GSShareManager share] getShareProtocolWithChannelType:channelType];
                                   [share setShareCompletionBlock:^(id<GSShareResultProtocol> result) {
                                       NSLog(@"%@", result.message);
                                   }];
                                   [share shareSimpleText:@"测试分享"];
                               }
    }];
}

@end
