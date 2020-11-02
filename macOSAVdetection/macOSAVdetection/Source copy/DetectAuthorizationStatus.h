//
//  DetectAuthorizationStatus.h
//  macOSAVdetection
//
//  Created by eZuce Team on 17/04/2020.
//  Copyright © 2020 eZuce Team. All rights reserved.
//

#include <jni.h>

#ifndef DetectAuthorizationStatus_h
#define DetectAuthorizationStatus_h

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT void JNICALL Java_com_ezuce_utils_MacAV_askForAVPermissions
(JNIEnv *env, jobject thiz);

JNIEXPORT jboolean JNICALL Java_com_ezuce_utils_MacAV_getMicPermission
(JNIEnv *env, jobject thiz);

JNIEXPORT jboolean JNICALL Java_com_ezuce_utils_MacAV_getCamPermission
(JNIEnv *env, jobject thiz);

#ifdef __cplusplus
}
#endif

#endif /* DetectAuthorizationStatus_h */
