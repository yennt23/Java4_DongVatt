<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 18/03/2023
  Time: 11:03 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>--%>
</head>
<body>
<form action="/dong-vat/add" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">id</label>
        <div class="col-sm-10">
            <input class="form-control" type="text" name="id" value="${dongVat.id}"><br>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Loaicay</label>
        <div class="col-sm-10">
            <input class="form-control" type="text" name="loaiCay" value="${dongVat.loaiCay}"><br>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Ten</label>
        <div class="col-sm-10">
            <input class="form-control" type="text" name="ten" value="${dongVat.ten}"><br>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Tuoi</label>
        <div class="col-sm-10">
            <input class="form-control" type="text" name="tuoi" value="${dongVat.tuoi}"><br>
        </div>
    </div>
    <div class="col-6">
        <label>Giới tính</label>
        <input type="radio" name="gioiTinh" value="true"
        ${dongVat.gioiTinh == true ? "checked" : "" }/>Đực
        <input type="radio" name="gioiTinh"
               value="false" ${dongVat.gioiTinh == false ? "checked" : "" }/>Cái
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">khu vuc</label>
        <div class="col-sm-10">
            <input class="form-control" type="text" name="khuVuc" value="${dongVat.khuVuc}"><br>
        </div>
    </div>
    <button type="submit">Them</button>

</form>
<form action="/dong-vat/search" method="get">
    <div class="col-sm-3">
      Tuoi min  <input class="" type="number" name="min" ><br>
      tuoi max  <input class="" type="number" name="max" ><br>
        <button type="submit">Search</button>
    </div>
</form>
<table class="table">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">loaiCay</th>
        <th scope="col">Ten</th>
        <th scope="col">tuoi</th>
        <th scope="col">gioiTinh</th>
        <th scope="col">khuVuc</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listdv}" var="l">
        <tr>
            <td>${l.id}</td>
            <td>${l.loaiCay}</td>
            <td>${l.ten}</td>
            <td>${l.tuoi}</td>
            <td>${l.gioiTinh == true ? "Đực" : "Cái"}</td>
            <td>${l.khuVuc}</td>
            <td>
                <a href="/dong-vat/detail?id=${l.id}">Detail</a>
                <a href="/dong-vat/view-update?id=${l.id}">Update</a>
                <a href="/dong-vat/delete?id=${l.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
