//
// Created by sou'l on 2024/5/17.
//

#include <android/log.h>

#define  TAG "T1"

#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG,TAG,__VA_ARGS__);
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,TAG,__VA_ARGS__);
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO,TAG,__VA_ARGS__);


#ifndef JNI_T1_H
#define JNI_T1_H


class T1 {

    void main();
};




#endif //JNI_T1_H
