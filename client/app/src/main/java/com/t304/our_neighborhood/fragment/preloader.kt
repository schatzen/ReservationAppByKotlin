package com.t304.our_neighborhood.fragment

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.t304.our_neighborhood.R
import kotlinx.android.synthetic.main.fragment_preloader.view.*

class preloader : Fragment() {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val v = inflater.inflate(R.layout.fragment_preloader, container, false)
        v.btn_perloader_go_login.setOnClickListener { findNavController().navigate(R.id.action_preloader_to_login_nav_graph) }
        return v
    }
}
