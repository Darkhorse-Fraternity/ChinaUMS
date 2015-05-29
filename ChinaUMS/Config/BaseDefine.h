//
//  BaseDefine.h
//  WeiDing
//
//  Created by tonyYo on 15/3/3.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#ifndef BaseDefine_h
#define BaseDefine_h

#define AppStore_BundleIdentify     @"com.flygps.proQ"
#define Enterprise_BundleIdentify   @"com.flygps.proQEP"

#define isAppStoreChannal [[[NSBundle mainBundle] bundleIdentifier] isEqualToString: AppStore_BundleIdentify]


//
//#ifdef DEBUG
//#   define ChinaUMS_URLHost @"www.chinaums-te.com"
//#else
//#   define ChinaUMS_URLHost @"www.chinaums-te.com"
//#endif

#ifdef DEBUG
#   define ChinaUMS_URLHost @"www.baimaiwang.com"
#else
#   define ChinaUMS_URLHost @"www.baimaiwang.com"
#endif


# define ChinaUMS_BaseURL [NSString stringWithFormat:@"%@/api/",ChinaUMS_URLHost]
# define ChinaUMS_ImageBaseURL [NSString stringWithFormat:@"http://%@",ChinaUMS_URLHost]


//其他自定义
# define ChinaUMS_Captcha [NSString stringWithFormat:@"%@/api/%@",ChinaUMS_ImageBaseURL,@"Captcha/get"]
#endif