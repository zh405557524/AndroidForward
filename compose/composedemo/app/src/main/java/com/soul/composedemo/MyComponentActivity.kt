package com.soul.composedemo

import android.content.Intent
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.soul.composedemo.component.ButtonActivity
import com.soul.composedemo.component.CardActivity
import com.soul.composedemo.component.DialogActivity
import com.soul.composedemo.component.FloatingActionButtonActivity
import com.soul.composedemo.component.IconActivity
import com.soul.composedemo.component.IconButtonActivity
import com.soul.composedemo.component.ImageActivity
import com.soul.composedemo.component.SliderActivity
import com.soul.composedemo.component.TextActivity
import com.soul.composedemo.component.TextFieldActivity
import com.soul.composedemo.ui.theme.ButtonWithAction

/**
 * Description: 组件
 * Author: 祝明
 * CreateDate: 2024/7/5 15:35
 * UpdateUser:
 * UpdateDate: 2024/7/5 15:35
 * UpdateRemark:
 */
class MyComponentActivity : ComponentActivity() {
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
            ButtonWithAction("文字") { startActivity(TextActivity::class.java) }
            ButtonWithAction("图片") { startActivity(ImageActivity::class.java) }
            ButtonWithAction("按钮") { startActivity(ButtonActivity::class.java) }
            ButtonWithAction("输入框") { startActivity(TextFieldActivity::class.java) }
            ButtonWithAction("图标") { startActivity(IconActivity::class.java) }
            ButtonWithAction("图标按钮") { startActivity(IconButtonActivity::class.java) }
            ButtonWithAction("Dialog") { startActivity(DialogActivity::class.java) }
            ButtonWithAction("卡牌") { startActivity(CardActivity::class.java) }
            ButtonWithAction("滑块") { startActivity(SliderActivity::class.java) }
            ButtonWithAction("悬浮按钮") { startActivity(FloatingActionButtonActivity::class.java) }
        }
    }

    private fun startActivity(classz: Class<*>) {
        startActivity(Intent(this, classz))
    }
}