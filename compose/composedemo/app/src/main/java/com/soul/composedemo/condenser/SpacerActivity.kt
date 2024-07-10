package com.soul.composedemo.condenser

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

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
        Column(
            modifier = Modifier.padding(top = 48.dp, start = 12.dp, end = 12.dp)
        ) {
            //Spacer是一个空白的布局，可以用来占位
            Box(
                Modifier
                    .size(100.dp)
                    .background(Color.Red)
            )
            Spacer(Modifier.size(20.dp))
            Box(
                Modifier
                    .size(100.dp)
                    .background(Color.Magenta)
            )
            Spacer(Modifier.size(20.dp))
            Box(
                Modifier
                    .size(100.dp)
                    .background(Color.Yellow)
            )
        }

    }


}