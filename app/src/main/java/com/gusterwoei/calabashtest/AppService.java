package com.gusterwoei.calabashtest;

import android.content.Context;

/**
 * Created by guster on 06/10/2017.
 */

public class AppService {
    private static AppService appService;
    private final Context context;

    public static AppService get(Context context) {
        if(appService == null)
            appService = new AppService(context);
        return appService;
    }

    public AppService(Context context) {
        this.context = context;
    }

    public boolean validateLogin(String username, String password) {
        if(username == null || password == null) return false;
        if(!username.equals("admin") || !password.equals("password")) {
            return false;
        }
        return true;
    }
}
