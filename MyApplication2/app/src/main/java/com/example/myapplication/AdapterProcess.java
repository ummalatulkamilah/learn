package com.example.myapplication;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;


    public class AdapterProcess extends RecyclerView.Adapter<AdapterProcess.ViewProcessHolder> {

        Context context;
        private ArrayList<ModelData> item; //memanggil modelData

        public AdapterProcess(Context context, ArrayList<ModelData> item) {
            this.context = context;
            this.item = item;
        }

        @Override
        public ViewProcessHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.custome_list, parent, false); //memanggil layout list recyclerview
            ViewProcessHolder processHolder = new ViewProcessHolder(view);
            return processHolder;
        }

        @Override
        public void onBindViewHolder(ViewProcessHolder holder, int position) {

            final ModelData data = item.get(position);
            holder.mata_pelajaran.setText(data.getNamaData());//menampilkan data
            holder.nama_guru.setText(data.getNamaGuru());//menampilkan data


        }

        @Override
        public int getItemCount() {
            return item.size();
        }

        public class ViewProcessHolder extends RecyclerView.ViewHolder {

            
            TextView mata_pelajaran, nama_guru;

            public ViewProcessHolder(View itemView) {
                super(itemView);

                mata_pelajaran = (TextView) itemView.findViewById(R.id.nama_data_list);
                nama_guru = (TextView) itemView.findViewById(R.id.nama_guru);


            }


        }
        }

