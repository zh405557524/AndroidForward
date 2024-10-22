package com.soul.composedemo.animation

import android.content.Intent
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.runtime.Composable
import com.soul.composedemo.ui.theme.ButtonWithAction

/**
 * Description: 动画
 * Author: 祝明
 * CreateDate: 2024/7/26 10:27
 * UpdateUser:
 * UpdateDate: 2024/7/26 10:27
 * UpdateRemark:
 */
class AnimationActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {
        ButtonWithAction("显示/隐藏的过渡动画") { startActivity(AnimationVisibilityActivity::class.java) }
        ButtonWithAction("尺寸大小变化动画") { startActivity(AnimateContentSizeActivity::class.java) }
        ButtonWithAction("淡入淡出的动画") { startActivity(CrossfadeActivity::class.java) }
        ButtonWithAction("单数值变化动画") { startActivity(AsStateActivity::class.java) }
        ButtonWithAction("Animatable") { startActivity(AnimatableActivity::class.java) }
        ButtonWithAction("updateTransition") { startActivity(UpdateTransitionActivity::class.java) }
        ButtonWithAction("rememberInfiniteTransition") { startActivity(RememberInfiniteTransitionActivity::class.java) }
        ButtonWithAction("手势与动画") { startActivity(RememberInfiniteTransitionActivity::class.java) }

    }

    private fun startActivity(classz: Class<*>) {
        startActivity(Intent(this, classz))
    }

}