package com.t304.our_neighborhood.fragment

import android.os.Bundle
import android.view.*
import androidx.fragment.app.Fragment
import com.t304.our_neighborhood.R

class LoginFragment : Fragment() {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_login, container, false)
    }

}
