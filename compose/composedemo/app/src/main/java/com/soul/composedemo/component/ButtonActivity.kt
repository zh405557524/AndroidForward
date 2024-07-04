package com.soul.composedemo.component

import android.os.Bundle
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Favorite
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import com.soul.lib.utils.ToastUtils

/**
 * Description: 按钮
 * Author: 祝明
 * CreateDate: 2024/7/4 18:07
 * UpdateUser:
 * UpdateDate: 2024/7/4 18:07
 * UpdateRemark:
 */
class ButtonActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    fun Greeting() {
        Column(
            modifier = Modifier.padding(top = 48.dp)
        ) {
            //文本
            Button(onClick = { ToastUtils.showShortToast("被点击了") }) {
                Text("Click me")
            }

            //文本与图标
            Button(onClick = { ToastUtils.showShortToast("被点击了") }) {
                Icon(Icons.Filled.Favorite, contentDescription = "Favorite")
                Spacer(Modifier.width(8.dp))
                Text("Favorite")
            }

            //背景与圆角
            Button(
                onClick = { ToastUtils.showShortToast("被点击了") },
                colors = ButtonDefaults.buttonColors(
                    containerColor = Color.Red,
                    contentColor = Color.White
                ),
                shape = RoundedCornerShape(8.dp),
                elevation = ButtonDefaults.elevatedButtonElevation(defaultElevation = 4.dp, pressedElevation = 8.dp)
            ) {
                Text("Styled Button")
            }

            //设置禁用
            Button(
                onClick = { ToastUtils.showShortToast("禁用按钮") },
                enabled = false  // 设置按钮为禁用状态
            ) {
                Text("Disabled Button")
            }

            val isLoading = true

            Button(
                onClick = { ToastUtils.showShortToast("被点击了") },
                enabled = !isLoading  // 加载时禁用按钮
            ) {
                if (isLoading) {
                    CircularProgressIndicator(
                        color = Color.White,
                        modifier = Modifier.size(16.dp)
                    )
                    Spacer(Modifier.width(8.dp))  // 添加空间
                    Text("Loading...")
                } else {
                    Text("Load Data")
                }
            }

        }


    }
}