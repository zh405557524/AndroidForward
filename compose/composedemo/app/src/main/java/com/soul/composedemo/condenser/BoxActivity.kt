package com.soul.composedemo.condenser

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

/**
 * Description: 帧布局
 * Author: 祝明
 * CreateDate: 2024/7/5 15:47
 * UpdateUser:
 * UpdateDate: 2024/7/5 15:47
 * UpdateRemark:
 */
class BoxActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {
        Box(
            modifier = Modifier.padding(top = 48.dp)
        ) {
            //基本用法
            Box(
                modifier = Modifier
                    .padding(16.dp)
                    .size(150.dp)
                    .background(Color.Green)
            )
            Box(
                modifier = Modifier
                    .padding(16.dp)
                    .size(80.dp)
                    .background(Color.Red)
            )
            Text(
                modifier = Modifier.padding(16.dp),
                text = "Box布局"
            )
        }
    }


}