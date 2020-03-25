package com.t304.our_neighborhood.viewModel

import android.accounts.NetworkErrorException
import android.app.Application
import android.util.Log
import android.widget.Toast
import androidx.lifecycle.*
import com.t304.our_neighborhood.error.ErrorResponse
import com.t304.our_neighborhood.service.retrofit2.RetrofitHelper
import com.t304.our_neighborhood.vo.UserVo
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.lang.Exception
import java.net.ConnectException

class UserAccountViewModel : ViewModel() {
    var resultOfInsert = MutableLiveData<Map<String, String>>()

    //test Model TODO DELETE
    var test1 = UserVo(member_name = "la", member_id = "la_ID", member_pwd = "1234", member_tel = "000-0000-0000")

    fun signUp() {
        viewModelScope.launch(Dispatchers.IO) {
            RetrofitHelper.getService().run {
                try {
                    resultOfInsert.postValue(withContext(Dispatchers.IO) { insertUser(test1) })
                } catch (e: ConnectException) {
                    // server connect faild exception
                    Log.d("ljw", "server connect failed")
                    ErrorResponse.response.postValue(ErrorResponse.SERVER_CONNECT_FAILED)
                }
            }
        }

    }

}