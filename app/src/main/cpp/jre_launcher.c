#include <jni.h>
#include <android/log.h>
#define LOG(...) __android_log_print(ANDROID_LOG_INFO,"MCL",__VA_ARGS__)

JNIEXPORT void JNICALL
Java_com_mcl_launcher_MainActivity_nativeInit(JNIEnv *env, jclass cls) {
    LOG("nativeInit ok");
}
