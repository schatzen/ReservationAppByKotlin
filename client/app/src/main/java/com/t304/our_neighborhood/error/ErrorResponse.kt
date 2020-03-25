package com.t304.our_neighborhood.error

import androidx.lifecycle.MutableLiveData

object ErrorResponse {
    const val DEFAULT = 0
    const val SERVER_CONNECT_FAILED = 1
    var response = MutableLiveData<Int>()

    init {
        response.postValue(DEFAULT)
    }
}