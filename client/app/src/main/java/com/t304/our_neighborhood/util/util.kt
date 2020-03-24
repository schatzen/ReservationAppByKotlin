package com.t304.our_neighborhood.util

import android.content.Context
import android.view.View
import android.view.inputmethod.InputMethodManager

fun hideKeyBoard(targetView: View?, context: Context?) =
    (context?.getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager)
        .hideSoftInputFromWindow(
            targetView?.windowToken,
            0
        )
