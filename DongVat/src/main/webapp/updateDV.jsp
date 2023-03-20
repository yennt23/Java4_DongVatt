<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 19/03/2023
  Time: 11:14 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/dong-vat/update" method="post">
  <div class="form-group row">
    <label class="col-sm-2 col-form-label">id</label>
    <div class="col-sm-10">
      <input class="form-control" type="text" name="id" value="${dongVat.id}"><br>
    </div>
  </div>
  <div class="form-group row">
    <label class="col-sm-2 col-form-label">Loai cay</label>
    <div class="col-sm-10">
      <input class="form-control" type="text" name="loaiCay" value="${dongVat.loaiCay}"><br>
    </div>
  <div class="form-group row">
    <label class="col-sm-2 col-form-label">Ten</label>
    <div class="col-sm-10">
      <input class="form-control" type="text" name="ten" value="${dongVat.ten}"><br>
    </div>
  </div>
  <div class="form-group row">
    <label class="col-sm-2 col-form-label">tuoi</label>
    <div class="col-sm-10">
      <input class="form-control" type="text" name="tuoi" value="${dongVat.tuoi}"><br>
    </div>
  </div>
    <div class="col-6">
      <label>Giới tính</label>
      <input type="radio" name="gioiTinh" value="true"
      ${dongVat.gioiTinh == true ? "checked" : "" }/>Đực
      <input type="radio" name="gioiTinh" value="false"
      ${dongVat.gioiTinh == false ? "checked" : "" }/>Cái
    </div>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label">khu vuc</label>
      <div class="col-sm-10">
        <input class="form-control" type="text" name="khuVuc" value="${dongVat.khuVuc}"><br>
      </div>
    </div>
  <button type="submit">Update</button>
</form>
</body>
</html>
