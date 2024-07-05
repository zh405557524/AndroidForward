package com.soul.composedemo.condenser

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.runtime.Composable

/**
 * Description: 空白布局
 * Author: 祝明
 * CreateDate: 2024/7/5 18:24
 * UpdateUser:
 * UpdateDate: 2024/7/5 18:24
 * UpdateRemark:
 */
class SpacerActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {
        //Spacer是一个空白的布局，可以用来占位

    }


}