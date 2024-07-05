package com.soul.composedemo.component

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Favorite
import androidx.compose.material3.ExtendedFloatingActionButton
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import com.soul.lib.utils.ToastUtils

/**
 * Description: 悬浮按钮
 * Author: 祝明
 * CreateDate: 2024/7/5 15:29
 * UpdateUser:
 * UpdateDate: 2024/7/5 15:29
 * UpdateRemark:
 */
class FloatingActionButtonActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {
        Column(
            modifier = Modifier.padding(top = 48.dp)
        ) {
            //基本用法
            FloatingActionButton(
                onClick = { ToastUtils.showShortToast("被点击了") },
                modifier = Modifier.padding(16.dp),
                contentColor = Color.White

            ) {
                Icon(
                    imageVector = Icons.Filled.Favorite,
                    contentDescription = "Favorite"
                )
            }

            ExtendedFloatingActionButton(
                text = { Text("Add Item") },
                onClick = { /* 处理点击事件 */ },
                icon = { Icon(Icons.Filled.Add, contentDescription = "Add") },
                contentColor = Color.White
            )

        }
    }
}