package com.soul.composedemo

import android.content.Intent
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.soul.composedemo.animation.AnimatableActivity
import com.soul.composedemo.animation.AnimateContentSizeActivity
import com.soul.composedemo.animation.AnimationVisibilityActivity
import com.soul.composedemo.animation.AsStateActivity
import com.soul.composedemo.animation.CrossfadeActivity
import com.soul.composedemo.component.MyComponentActivity
import com.soul.composedemo.condenser.BottomNavigationActivity
import com.soul.composedemo.condenser.BoxActivity
import com.soul.composedemo.condenser.ColumnActivity
import com.soul.composedemo.condenser.FlowRowActivity
import com.soul.composedemo.condenser.ModalBottomActivity
import com.soul.composedemo.condenser.MyCondenserActivity
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
                ButtonWithAction("基础布局") { startActivity(MyCondenserActivity::class.java) }
                ButtonWithAction("显示/隐藏的过渡动画") { startActivity(AnimationVisibilityActivity::class.java) }
                ButtonWithAction("尺寸大小变化动画") { startActivity(AnimateContentSizeActivity::class.java) }
                ButtonWithAction("淡入淡出的动画") { startActivity(CrossfadeActivity::class.java) }
                ButtonWithAction("单数值变化动画") { startActivity(AsStateActivity::class.java) }
                ButtonWithAction("Animatable") { startActivity(AnimatableActivity::class.java) }

                Spacer(Modifier.size(48.dp))
            }
        }
    }

    private fun startActivity(classz: Class<*>) {
        startActivity(Intent(this, classz))
    }
}

