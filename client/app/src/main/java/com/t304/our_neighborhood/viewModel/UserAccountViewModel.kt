package com.t304.our_neighborhood.viewModel

import android.util.Log
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.t304.our_neighborhood.error.ErrorResponse
import com.t304.our_neighborhood.service.retrofit2.RetrofitHelper
import com.t304.our_neighborhood.vo.UserVo
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.net.ConnectException

class UserAccountViewModel : ViewModel() {
    var resultOfInsert = MutableLiveData<Map<String, String>>()

    fun signUp(userVo : UserVo) {
        viewModelScope.launch(Dispatchers.IO) {
            RetrofitHelper.getService().run {
                try {
                    resultOfInsert.postValue(withContext(Dispatchers.IO) { insertUser(userVo) })
                } catch (e: ConnectException) {
                    // server connect faild exception
                    Log.d("ljw", "server connect failed")
                    ErrorResponse.response.postValue(ErrorResponse.SERVER_CONNECT_FAILED)
                }
            }
        }

    }

}