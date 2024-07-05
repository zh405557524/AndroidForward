package com.soul.composedemo.component

import android.os.Bundle
import android.os.PersistableBundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Favorite
import androidx.compose.material.icons.filled.FavoriteBorder
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.material3.TextFieldDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp

/**
 * Description: 文本框输入
 * Author: 祝明
 * CreateDate: 2024/7/4 18:37
 * UpdateUser:
 * UpdateDate: 2024/7/4 18:37
 * UpdateRemark:
 */
class TextFieldActivity : ComponentActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {

        var text by remember { mutableStateOf("") }

        var passwordVisible by remember { mutableStateOf(false) }
        Column(
            modifier = Modifier
                .padding(top = 48.dp)
                .fillMaxWidth()
        ) {

            TextField(
                value = text,
                onValueChange = { text = it },
                label = { Text("请输入内容") }
            )
            TextField(
                value = text,
                onValueChange = { text = it },
                trailingIcon = { Text("@qq.com") },//后置图标
                placeholder = { Text("占位符   ") }//占位符
            )

            //密码隐藏
            TextField(
                value = text,
                onValueChange = { text = it },
                label = { Text("请输入密码") },
                singleLine = true,
                leadingIcon = { Text("密码") },//前置图标
                visualTransformation = if (passwordVisible) VisualTransformation.None else PasswordVisualTransformation(),
                trailingIcon = {
                    val image = if (passwordVisible) Icons.Filled.Favorite else Icons.Filled.FavoriteBorder
                    IconButton(onClick = { passwordVisible = !passwordVisible }) {
                        Icon(image, contentDescription = "Toggle password visibility")
                    }
                }

            )
//颜色
            TextField(
                value = text,
                onValueChange = { text = it },
                placeholder = { Text("Email") },
                colors = TextFieldDefaults.colors(
                    focusedTextColor = androidx.compose.ui.graphics.Color.Red,
                    cursorColor = androidx.compose.ui.graphics.Color.Green,
                    focusedIndicatorColor = androidx.compose.ui.graphics.Color.Blue,
                    unfocusedIndicatorColor = androidx.compose.ui.graphics.Color.Cyan
                )
            )
        }
    }
}



















