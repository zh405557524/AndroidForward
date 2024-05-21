## Jni 的使用
### 一、jni对java代码的调用。
* 1、修改字段
```c++

Java_com_soul_jni_MainActivity_changeName(JNIEnv *env, jobject thiz, jstring name) {
    //1、获取修改对象
    jclass pJclass = env->GetObjectClass(thiz);
    //2、获取需要修改的字段 name 字段名称 ;Ljava/lang/String 字段类型
    jfieldID fieldId = env->GetFieldID(pJclass, "name", "Ljava/lang/String;");
    jstring stringUtf = env->NewStringUTF("Sam");
    //3、修改字段内容
    env->SetObjectField(thiz, fieldId, stringUtf);
    }
```

* 2、获取对象
```c++
Java_com_soul_jni_MainActivity_setStudent(JNIEnv *env, jobject thiz, jobject student) {
    //1、获取操作的对象
    jclass _student = env->GetObjectClass(student);
    //2、获取操作的方法
    jmethodID _setName = env->GetMethodID(_student, "setName", "(Ljava/lang/String;)V");
    jmethodID _setAge = env->GetMethodID(_student, "setAge", "(I)V");
    //3、赋值
    jstring _name = env->NewStringUTF("soul");
    env->CallVoidMethod(student, _setName, _name);
    env->CallVoidMethod(student, _setAge, 33);
}
```
# 3、创建对象
```c++
Java_com_soul_jni_MainActivity_createStudent(JNIEnv *env, jobject thiz) {
    //1、找到class
    jclass _studentClass = env->FindClass("com/soul/jni/Student");
    //2、创建对象
    jobject _student = env->AllocObject(_studentClass);
    //3、获取操作的方法
    jmethodID _setName = env->GetMethodID(_studentClass, "setName", "(Ljava/lang/String;)V");
    jmethodID _setAge = env->GetMethodID(_studentClass, "setAge", "(I)V");
    //4、赋值
    jstring _name = env->NewStringUTF("soul2");
    env->CallVoidMethod(_student, _setName, _name);
    env->CallVoidMethod(_student, _setAge, 34);
    return _student;
}

```






