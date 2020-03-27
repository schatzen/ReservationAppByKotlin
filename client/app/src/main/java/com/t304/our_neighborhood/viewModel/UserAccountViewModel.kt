package com.t304.our_neighborhood.viewModel

import android.util.Log
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.t304.our_neighborhood.error.ErrorResponse
import com.t304.our_neighborhood.service.SessionUser
import com.t304.our_neighborhood.service.retrofit2.RetrofitHelper
import com.t304.our_neighborhood.vo.UserVo
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Dispatchers.IO
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import okhttp3.Dispatcher
import java.net.ConnectException
import java.util.*

class UserAccountViewModel : ViewModel() {
    var resultOfInsert = MutableLiveData<Map<String, String>>()
    var resultOfLogin = MutableLiveData<Boolean>()

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

    fun singIn(userVo : UserVo) {
        viewModelScope.launch(Dispatchers.IO) {
           RetrofitHelper.getService().run {
               try {
                   //val vo = withContext(Dispatchers.IO) { getUser(userVo) } // return vo
                   //SessionUser.user = vo
                   //resultOfLogin.postValue(withContext(Dispatchers.IO) { getUser(userVo) })
                   val test = withContext(Dispatchers.IO) { getUser(userVo) }
                   // if test ? not null resultOfLogin =true
                   Log.d("ljw", test.toString())
               } catch (e: ConnectException) {
                   // server connect faild exception
                   Log.d("ljw", "server login failed")
                   ErrorResponse.response.postValue(ErrorResponse.SERVER_CONNECT_FAILED)
               }
           }}


    }

}