package com.t304.our_neighborhood.adapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.core.content.ContextCompat
import androidx.recyclerview.widget.RecyclerView
import com.t304.our_neighborhood.R
import kotlinx.android.synthetic.main.item_detail_image.view.*

class DetailViewPagerAdapter : RecyclerView.Adapter<DetailViewPagerAdapter.DetailItemViewHolder>(){

    private val colorList = listOf(
        android.R.color.black,
        android.R.color.holo_red_dark,
        android.R.color.holo_blue_dark
    )

    inner class DetailItemViewHolder(parent: ViewGroup) : RecyclerView.ViewHolder(
        LayoutInflater
            .from(parent.context)
            .inflate(R.layout.item_detail_image, parent, false)
    )

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): DetailItemViewHolder  = DetailItemViewHolder(parent)

    override fun getItemCount(): Int = colorList.size

    override fun onBindViewHolder(holder: DetailItemViewHolder, position: Int) {

        holder.itemView.apply {
            iv_detail_image.setColorFilter(ContextCompat.getColor(context, colorList[position]), android.graphics.PorterDuff.Mode.SRC_IN)

        }
    }
}
