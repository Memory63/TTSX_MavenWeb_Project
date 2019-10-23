package com.sdh.utils;

/**
 * @ClassName StirngUtils
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/21 19:58
 * @Version 1.0
 */
public class StringUtils {
    //判断字符串是否为空
    public static boolean isEmpty(String str){
        if(str==null||str.trim().length()==0){
            return true;
        }
        return false;
    }
}
