package com.t304.our_neighborhood.fragment

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import androidx.navigation.ui.setupWithNavController
import androidx.viewpager2.widget.ViewPager2
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.MapView
import com.google.android.gms.maps.OnMapReadyCallback
import com.t304.our_neighborhood.R
import com.t304.our_neighborhood.adapter.DetailViewPagerAdapter
import kotlinx.android.synthetic.main.fragment_detail.view.*

class DetailFragment : Fragment(), OnMapReadyCallback {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val v = inflater.inflate(R.layout.fragment_detail, container, false)

        //init toolbar
        v.toolbar_detail.apply {
            setupWithNavController(findNavController())
            title = ""
        }

        // init viewpager
        v.vp_detail_image.apply {
            adapter = DetailViewPagerAdapter()
            orientation = ViewPager2.ORIENTATION_HORIZONTAL
        }

        return v
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)

    }

    override fun onMapReady(p0: GoogleMap?) {

    }
}
