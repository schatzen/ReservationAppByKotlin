package com.t304.our_neighborhood.fragment

import android.content.Context
import android.os.Build
import android.os.Bundle
import android.os.VibrationEffect
import android.os.Vibrator
import android.text.Editable
import android.text.TextWatcher
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.WindowManager
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import com.t304.our_neighborhood.R
import com.t304.our_neighborhood.util.hideKeyBoard
import com.t304.our_neighborhood.viewModel.UserAccountViewModel
import com.t304.our_neighborhood.vo.UserVo
import kotlinx.android.synthetic.main.fragment_sign_up.*
import kotlinx.android.synthetic.main.fragment_sign_up.view.*
import kotlinx.android.synthetic.main.fragment_sign_up.view.tiet_signup_pw

class SignUpFragment : Fragment() {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val v = inflater.inflate(R.layout.fragment_sign_up, container, false)
        activity?.window?.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN)
        v.setOnTouchListener { _, _ -> hideKeyBoard(v.findFocus(), activity); false }

        val viewModel = ViewModelProvider(this)[UserAccountViewModel::class.java]
        viewModel.resultOfInsert.observe(viewLifecycleOwner, Observer { Toast.makeText(context, it.toString(), Toast.LENGTH_SHORT).show() })

        // 비밀번호 체크
        v.tiet_signup_repeat_pw.addTextChangedListener(object : TextWatcher {
            override fun afterTextChanged(s: Editable?) {
                til_signup_refeat_pw.error =
                    if (tiet_signup_pw.text.toString() != tiet_signup_repeat_pw.text.toString())
                        "재확인 비밀번호가 틀립니다."
                    else{
                        null
                    }

            }
            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {}
        })

        // 보내기
        v.btn_signup_submit.setOnClickListener {
            if (til_signup_refeat_pw.error == null){
                with(v) {
                    viewModel.signUp(
                        UserVo(
                            member_name = tiet_signup_name.text.toString(),
                            member_id = tiet_signup_id.text.toString(),
                            member_pwd = tiet_signup_pw.text.toString(),
                            member_tel = tiet_signup_phone.text.toString()
                        )
                    )
                }


            }
            else{
                (context?.getSystemService(Context.VIBRATOR_SERVICE) as Vibrator).vibrate(50)
                til_signup_refeat_pw.requestFocus()
            }
        }

        return v
    }

}
