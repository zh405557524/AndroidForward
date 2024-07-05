package com.soul.composedemo.component

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog

/**
 * Description: dialog 的用法
 * Author: 祝明
 * CreateDate: 2024/7/5 13:47
 * UpdateUser:
 * UpdateDate: 2024/7/5 13:47
 * UpdateRemark:
 */
class DialogActivity : ComponentActivity() {
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
            //AlertDialog()
            AlertDialogExample()
            DialogExample()
        }

    }

    private @Composable
    fun DialogExample() {
        var isShow by remember { mutableStateOf(false) }
        Button(onClick = { isShow = true }) {
            Text("显示弹框")
        }
        if (isShow) {
            MyDialog(onDismiss = { isShow = false })
        }
    }

    @Composable
    fun MyDialog(onDismiss: () -> Unit) {
        Dialog(
            onDismissRequest = { onDismiss() }
        ) {
            Box(
                modifier = Modifier
                    .size(300.dp)
                    .background(Color.White),
                contentAlignment = Alignment.Center
            ) {
                Column {
                    LinearProgressIndicator()
                    Text("加载中 ing...")
                }
            }
        }
    }

    @Composable
    fun AlertDialogExample() {
        var isShow by remember { mutableStateOf(false) }
        Button(onClick = { isShow = true }) { Text("显示弹框") }
        if (isShow) {
            MyAlertDialog(onDismiss = { isShow = false })
        }
    }

    @Composable
    fun MyAlertDialog(onDismiss: () -> Unit) {
        AlertDialog(
            onDismissRequest = { onDismiss() },
            title = { Text("标题") },
            text = { Text("内容") },
            confirmButton = {
                Button(onClick = { onDismiss() }) {
                    Text("确定")
                }
            },
            dismissButton = {
                Button(onClick = { onDismiss() }) {
                    Text("取消")
                }
            }
        )
    }

}