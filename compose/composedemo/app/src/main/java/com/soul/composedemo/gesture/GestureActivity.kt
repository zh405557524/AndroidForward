package com.soul.composedemo.gesture

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.runtime.Composable

/**
 * Description: 手势动画
 * Author: 祝明
 * CreateDate: 2024/7/24 18:33
 * UpdateUser:
 * UpdateDate: 2024/7/24 18:33
 * UpdateRemark:
 */
class GestureActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {


    }


}






