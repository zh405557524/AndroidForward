package com.soul.composedemo

import android.content.Intent
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.Text
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
import com.soul.composedemo.condenser.BoxActivity
import com.soul.composedemo.condenser.ColumnActivity
import com.soul.composedemo.condenser.RowActivity
import com.soul.composedemo.ui.theme.ButtonWithAction
import com.soul.composedemo.ui.theme.ComposedemoTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }


    @Composable
    fun Greeting() {
        ComposedemoTheme(false, false) {
            Column(modifier = Modifier.padding(top = 48.dp)) {
                ButtonWithAction("基础组件") { startActivity(MyComponentActivity::class.java) }
                ButtonWithAction("帧布局") { startActivity(BoxActivity::class.java) }
                ButtonWithAction("横向列表") { startActivity(RowActivity::class.java) }
                ButtonWithAction("竖向列表") { startActivity(ColumnActivity::class.java) }
            }
        }
    }

    private fun startActivity(classz: Class<*>) {
        startActivity(Intent(this, classz))
    }
}

