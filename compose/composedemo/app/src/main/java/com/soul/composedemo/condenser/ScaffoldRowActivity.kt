package com.soul.composedemo.condenser

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.runtime.Composable

/**
 * Description: 抽屉布局
 * Author: 祝明
 * CreateDate: 2024/7/5 17:15
 * UpdateUser:
 * UpdateDate: 2024/7/5 17:15
 * UpdateRemark:
 */
class ScaffoldRowActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {

    }

}