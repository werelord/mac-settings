# set -gx PATH /opt/local/bin /opt/local/sbin $PATH

set -gx ANDROID_NDK_ROOT ~/development/android-ndk-r10c
set -gx ANDROID_SDK_ROOT ~/development/adt/sdk
set -gx ANT_HOME ~/bin/ant/apache-ant-1.9.4
set -gx ANT_PATH ~/bin/ant/apache-ant-1.9.4/bin

set -gx JAVA_HOME (/usr/libexec/java_home)
set -gx ANDROID_HOME $ANDROID_SDK_ROOT
set -gx ANDROID_SDK $ANDROID_SDK_ROOT
set -gx NDK_ROOT $ANDROID_NDK_ROOT

# my local shit

set -gx APK_RESIGNER ~/bin/apk-resigner-read-only
set -gx DEX2JAR ~/bin/dex2jar
set -gx APKTOOL ~/bin/apktool
set -gx DEX_METHOD_COUNTS ~/bin/dex-method-counts

set -gx GOOGLE_CLOUD_SDK ~/bin/google-cloud-sdk/bin

set -gx PATH $ANDROID_SDK_ROOT/tools $ANDROID_SDK_ROOT/platform-tools $ANT_PATH $APK_RESIGNER $DEX2JAR $APKTOOL $DEX_METHOD_COUNTS $GOOGLE_CLOUD_SDK $PATH
