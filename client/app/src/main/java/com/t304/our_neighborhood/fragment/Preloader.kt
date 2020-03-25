package com.t304.our_neighborhood.fragment

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.navigation.fragment.findNavController
import com.t304.our_neighborhood.R
import com.t304.our_neighborhood.viewModel.UserAccountViewModel
import kotlinx.android.synthetic.main.fragment_preloader.view.*

class Preloader : Fragment() {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val v = inflater.inflate(R.layout.fragment_preloader, container, false)
        v.btn_perloader_go_login.setOnClickListener { findNavController().navigate(R.id.action_preloader_to_user_account_nav_graph) }

        //test TODO DELETE
        val viewModel = ViewModelProvider(this)[UserAccountViewModel::class.java]
        viewModel.resultOfInsert.observe(viewLifecycleOwner, Observer { Log.d("ljw", it.toString()) })
        viewModel.signUp()

        return v
    }

}
