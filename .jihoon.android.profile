############################################################################
############################################################################
# for android build settings
############################################################################
############################################################################
export ANDROID_HOME=$HOME/Android/Sdk
#export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/21.3.6528147
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk-bundle

export USE_CCACHE=1
export CCACHE_DIR=$HOME/.ccache
export CCACHE_EXEC=$HOME/bin/ccache
