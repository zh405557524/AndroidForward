package com.soul.composedemo

import android.content.Intent
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
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
import com.soul.composedemo.condenser.BottomNavigationActivity
import com.soul.composedemo.condenser.BoxActivity
import com.soul.composedemo.condenser.ColumnActivity
import com.soul.composedemo.condenser.FlowRowActivity
import com.soul.composedemo.condenser.ModalBottomActivity
import com.soul.composedemo.condenser.PagerActivity
import com.soul.composedemo.condenser.RowActivity
import com.soul.composedemo.condenser.ScaffoldRowActivity
import com.soul.composedemo.condenser.SpacerActivity
import com.soul.composedemo.condenser.SurfaceRowActivity
import com.soul.composedemo.condenser.TopAppBarActivity
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
        // 创建滚动状态
        val scrollState = rememberScrollState()
        ComposedemoTheme(false, false) {
            Column(
                modifier =
                Modifier
                    .padding(top = 48.dp)
                    .verticalScroll(scrollState)
            ) {
                ButtonWithAction("基础组件") { startActivity(MyComponentActivity::class.java) }
                ButtonWithAction("帧布局") { startActivity(BoxActivity::class.java) }
                ButtonWithAction("横向列表") { startActivity(RowActivity::class.java) }
                ButtonWithAction("竖向列表") { startActivity(ColumnActivity::class.java) }
                ButtonWithAction("流式布局") { startActivity(FlowRowActivity::class.java) }
                ButtonWithAction("整体布局") { startActivity(ScaffoldRowActivity::class.java) }
                ButtonWithAction("Surface") { startActivity(SurfaceRowActivity::class.java) }
                ButtonWithAction("空白布局") { startActivity(SpacerActivity::class.java) }
                ButtonWithAction("AppBar") { startActivity(TopAppBarActivity::class.java) }
                ButtonWithAction("bottom") { startActivity(BottomNavigationActivity::class.java) }
                ButtonWithAction("底部弹框") { startActivity(ModalBottomActivity::class.java) }
                ButtonWithAction("Pager") { startActivity(PagerActivity::class.java) }
                Spacer(Modifier.size(48.dp))
            }
        }
    }

    private fun startActivity(classz: Class<*>) {
        startActivity(Intent(this, classz))
    }
}

