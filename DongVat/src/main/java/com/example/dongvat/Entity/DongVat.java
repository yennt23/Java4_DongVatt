package com.example.dongvat.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class DongVat {
    private int id;
    private String loaiCay;
    private String ten;
    private int tuoi;
    private boolean gioiTinh;
    private String khuVuc;

    public DongVat() {

    }
}
