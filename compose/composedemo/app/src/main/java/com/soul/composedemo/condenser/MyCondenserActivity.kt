package com.soul.composedemo.condenser

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
import com.soul.composedemo.ui.theme.ButtonWithAction

/**
 * Description: 布局
 * Author: 祝明
 * CreateDate: 2024/7/18 17:29
 * UpdateUser:
 * UpdateDate: 2024/7/18 17:29
 * UpdateRemark:
 */
class MyCondenserActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { greeting() }
    }

    @Composable
    private fun greeting() {
        Column(
            modifier = Modifier.padding(top = 48.dp)
        ) {
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
        }
    }

    private fun startActivity(classz: Class<*>) {
        startActivity(Intent(this, classz))
    }
}