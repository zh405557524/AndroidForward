package com.soul.composedemo

import android.app.Application
import com.soul.lib.BuildConfig
import com.soul.lib.Global

/**
 * Description: 程序入口
 * Author: 祝明
 * CreateDate: 2024/7/4 18:16
 * UpdateUser:
 * UpdateDate: 2024/7/4 18:16
 * UpdateRemark:
 */
class BaseApplication : Application() {

    override fun onCreate() {
        super.onCreate()
        Global.init(this, true)
    }
}