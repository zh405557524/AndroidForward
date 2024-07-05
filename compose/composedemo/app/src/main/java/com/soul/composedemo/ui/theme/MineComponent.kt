package com.soul.composedemo.ui.theme

import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

/**
 * Description: 自定义的组件
 * Author: 祝明
 * CreateDate: 2024/7/5 15:37
 * UpdateUser:
 * UpdateDate: 2024/7/5 15:37
 * UpdateRemark:
 */
@Composable
fun ButtonWithAction(name: String, onClickListener: () -> Unit) {
    Button(
        onClick = onClickListener,
        modifier = Modifier
            .padding(8.dp)
            .fillMaxWidth()
    ) {
        Text(text = name)
    }
}