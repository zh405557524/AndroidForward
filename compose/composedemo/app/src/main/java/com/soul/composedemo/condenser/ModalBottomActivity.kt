package com.soul.composedemo.condenser

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.rememberModalBottomSheetState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.rememberCoroutineScope

/**
 * Description: 底部弹框
 * Author: 祝明
 * CreateDate: 2024/7/10 11:27
 * UpdateUser:
 * UpdateDate: 2024/7/10 11:27
 * UpdateRemark:
 */
class ModalBottomActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }

    }

    @OptIn(ExperimentalMaterial3Api::class)
    @Composable
    private fun Greeting() {
        val state = rememberModalBottomSheetState(false)
        val scope = rememberCoroutineScope()
//        ModalBottomSheet()
    }


}