package com.example.dongvat.Controller;

import com.example.dongvat.Entity.DongVat;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletDongVat", value = {
        "/dong-vat/hien-thi-tat-ca",//get
        "/dong-vat/detail",//get
        "/dong-vat/delete",//get
        "/dong-vat/update",//post
        "/dong-vat/view-update",//get
        "/dong-vat/add",//post
        "/dong-vat/search",//get
})
public class ServletDongVat extends HttpServlet {
    private List<DongVat> listdv = new ArrayList<>();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String uri = request.getRequestURI();
    if(uri.contains("hien-thi-tat-ca")){
        this.hienThiTatCa(request,response);
    }
    else if(uri.contains("detail")){
        this.DetailDongVat(request,response);
    }
    else if(uri.contains("delete")){
        this.DeleteDongVat(request,response);
    }
    else if(uri.contains("search")){
        this.SearchDongVat(request,response);
    }
    else if(uri.contains("view-update")){
        this.ViewUpdateDongVat(request,response);
    }
    else {
        this.hienThiTatCa(request,response);
    }
    }

    private void ViewUpdateDongVat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        DongVat dongVat = new DongVat();
        for (DongVat dvat: listdv){
            if(dvat.getId()==id ){
                dongVat=dvat;
            }
        }
        request.setAttribute("dongVat",dongVat);
        request.getRequestDispatcher("/updateDV.jsp").forward(request,response);
    }

    private void DetailDongVat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        DongVat dongVat = new DongVat();
        for (DongVat dvat: listdv){
            if(dvat.getId()==id ){
                dongVat=dvat;
            }
        }
        request.setAttribute("dongVat",dongVat);
        request.getRequestDispatcher("/DongVat.jsp").forward(request,response);
    }

    private void DeleteDongVat(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        listdv.remove(id-1);
        response.sendRedirect("/dong-vat/hien-thi-tat-ca");

    }

    private void SearchDongVat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int min = Integer.parseInt(request.getParameter("min"));
        int max = Integer.parseInt(request.getParameter("max"));
        List<DongVat> listsearch=new ArrayList<>();
        for (DongVat dv: listdv){
            if((dv.getTuoi() >= min) && (dv.getTuoi() <= max)){
                listsearch.add(dv);
            }
        }
        request.setAttribute("listdv",listsearch);
        request.getRequestDispatcher("/DongVat.jsp").forward(request,response);
    }

    private void hienThiTatCa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(listdv.isEmpty()){
            listdv.add(new DongVat(1,"An qua","tao",2,false,"HN"));
            listdv.add(new DongVat(2,"An qua","tao",2,false,"HN"));
            listdv.add(new DongVat(3,"An qua","tao",2,false,"HN"));
            listdv.add(new DongVat(4,"An qua","tao",2,false,"HN"));
        }
        request.setAttribute("listdv",listdv);
        request.getRequestDispatcher("/DongVat.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if(uri.contains("add")){
            this.AddDongVat(request,response);
        }
        else if(uri.contains("update")){
            this.UpdateDongVat(request,response);
        }
    }

    private void UpdateDongVat(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String loaiCay = request.getParameter("loaiCay");
        String ten = request.getParameter("ten");
        String tuoi = request.getParameter("tuoi");
        String gioiTinh = request.getParameter("gioiTinh");
        String khuVuc = request.getParameter("khuVuc");
        DongVat dongVat = new DongVat(id,loaiCay,ten,Integer.parseInt(tuoi),Boolean.parseBoolean(gioiTinh),khuVuc);
        listdv.set(id-1,dongVat);
        response.sendRedirect("/dong-vat/hien-thi-tat-ca");
//        request.setAttribute("dongVat",dongVat);
//        request.getRequestDispatcher("/updateDV.jsp").forward(request,response);
    }

    private void AddDongVat(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String loaiCay = request.getParameter("loaiCay");
        String ten = request.getParameter("ten");
        String tuoi = request.getParameter("tuoi");
        String gioiTinh = request.getParameter("gioiTinh");
        String khuVuc = request.getParameter("khuVuc");
        DongVat dongVat = new DongVat(id,loaiCay,ten,Integer.parseInt(tuoi),Boolean.parseBoolean(gioiTinh),khuVuc);
        listdv.add(dongVat);
        response.sendRedirect("/dong-vat/hien-thi-tat-ca");
    }
}
