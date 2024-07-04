#include <jni.h>
#include <string>
#include <android/log.h>

#define  TAG "native"

#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG,TAG,__VA_ARGS__);
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,TAG,__VA_ARGS__);
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO,TAG,__VA_ARGS__);

/**
 * 交换地址
 * @param a
 * @param b
 */
void change(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
    a + 1;
}

/**
 * 指针类型丢弃，只保存地址
 * void change(void * num1p,void * num2p)
 * num1p+1;//只有首地址，没有指针类型(无法运算)
 */
void commonChange(void *num1p, void *num2p, int len) {
    // 我们首先把 void* 指针，转化成 char * 指针。因为(char * )可以 单个字节 操作内存。
    //void * 不能取值 和 加减，所以必须转char*
    char *pa = (char *) num1p;
    char *pb = (char *) num2p;
    char temp;//交换用得临时值
    for (int i = 0; i < len; ++i) {
//        temp = *(pa + i);
//        *(pa + i) = *(pb + i);
//        *(pb + i) = temp;
        temp = pa[i];
        pa[i] = pb[i];
        pb[i] = temp;
    }



}

extern "C" JNIEXPORT jstring

JNICALL
Java_com_soul_jni_MainActivity_stringFromJNI(
        JNIEnv *env,
        jobject /* this */) {
    std::string hello = "Hello from C++";
    //指针(核心一：数据对象首地址 ，核心二：数据对象得存储空间大小)
    int a = 100;//内存地址：1000h
    int b = 200;//内存地址:2000h
    LOGI("呼唤前a:%d,b:%d", a, b);
    change(&a, &b);

    int arr2[5][10] = {
            {1,     2,     3,     4,    5,    6,    7},
            {11, 22, 33, 44, 55, 66,                77,  88,  99},
            {111,   222,   333,   444,  555,  666,  777, 888, 999},
            {1111,  2222,  3333,  4444, 5555, 6666, 7777},
            {11111, 22222, 33333, 44444}
    };

    LOGI("方式:%d", arr2[2][5])
    LOGI("方式:%d", *((*(arr2 + 2)) + 5))
    LOGI("方式:%d", arr2[2][5])


    return env->NewStringUTF(hello.c_str());
}

extern "C"
JNIEXPORT jstring

JNICALL
Java_com_soul_jni_MainActivity_changeName(JNIEnv *env, jobject thiz, jstring name) {
    //1、获取修改对象
    jclass pJclass = env->GetObjectClass(thiz);
    //2、获取需要修改的字段 name 字段名称 ;Ljava/lang/String 字段类型
    jfieldID fieldId = env->GetFieldID(pJclass, "name", "Ljava/lang/String;");
    jstring stringUtf = env->NewStringUTF("Sam");
    //3、修改字段内容
    env->SetObjectField(thiz, fieldId, stringUtf);
    env->DeleteLocalRef(stringUtf);
    LOGI("fdsafd")
    return name;
}

extern "C"
JNIEXPORT void JNICALL
Java_com_soul_jni_MainActivity_setStudent(JNIEnv
                                          *env,
                                          jobject thiz, jobject
                                          student) {
//1、获取操作的对象
    jclass _student = env->GetObjectClass(student);
//2、获取操作的方法
    jmethodID _setName = env->GetMethodID(_student, "setName", "(Ljava/lang/String;)V");
    jmethodID _setAge = env->GetMethodID(_student, "setAge", "(I)V");
//3、赋值
    jstring _name = env->NewStringUTF("soul");
    env->
            CallVoidMethod(student, _setName, _name
    );
    env->
            CallVoidMethod(student, _setAge,
                           33);
}

extern "C"
JNIEXPORT jobject
JNICALL
Java_com_soul_jni_MainActivity_createStudent(JNIEnv *env, jobject
thiz) {
//1、找到class
    jclass _studentClass = env->FindClass("com/soul/jni/Student");
//2、创建对象
    jobject _student = env->AllocObject(_studentClass);
//3、获取操作的方法
    jmethodID _setName = env->GetMethodID(_studentClass, "setName", "(Ljava/lang/String;)V");
    jmethodID _setAge = env->GetMethodID(_studentClass, "setAge", "(I)V");
//4、赋值
    jstring _name = env->NewStringUTF("soul2");
    env->
            CallVoidMethod(_student, _setName, _name
    );
    env->
            CallVoidMethod(_student, _setAge,
                           34);
    return
            _student;
}