package com.t304.our_neighborhood.fragment

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.WindowManager
import androidx.navigation.fragment.findNavController
import com.t304.our_neighborhood.R
import com.t304.our_neighborhood.util.hideKeyBoard
import kotlinx.android.synthetic.main.fragment_login.view.*

class LoginFragment : Fragment() {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val v = inflater.inflate(R.layout.fragment_login, container, false)
        activity?.window?.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE)
        v.apply {
            setOnTouchListener { _, _ -> hideKeyBoard(v.findFocus(), activity); false }
            btn_login_go_signup.setOnClickListener { findNavController().navigate(R.id.action_loginFragment_to_signUpFragment) }
            btn_login_submit.setOnClickListener { findNavController().navigate(R.id.action_loginFragment_to_nav_graph_home) }
        }
        return v
    }

}
