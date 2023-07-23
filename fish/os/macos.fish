# MacOS
if type -sq "rvm"
    rvm default
end

# Java on MacOS
if test -f /usr/libexec/java_home
    # export JAVA_17_HOME=(/usr/libexec/java_home -v 17)
    # export JAVA_11_HOME=(/usr/libexec/java_home -v 11.0.11)
    export JAVA_8_HOME=(/usr/libexec/java_home -v 1.8.0_242)
    # alias java17="export JAVA_HOME={$JAVA_17_HOME}"
    # alias java11="export JAVA_HOME=$JAVA_11_HOME"
    alias java8="export JAVA_HOME={$JAVA_8_HOME}"
    #set default to Java 17
    java8
end

