<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Nuevo Show - TV Shows</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
    crossorigin="anonymous">
</head>

<body>
  <header class="bg-dark text-white px-5 d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
    <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
      <span class="text-white fs-3">TVShows</span>
    </a>
    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
      <li><a href="/home" class="nav-link px-2 link-secondary">Home</a></li>
      <li><a href="/shows/new" class="nav-link px-2 text-white">Nuevo Show</a></li>
    </ul>
    <form id="logout" method="post" action="/logout" class="col-md-3 text-end">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <input type="submit" value="Cerrar sesión" class="btn btn-primary">
    </form>
  </header>
  <div class="container">
    <div class="row justify-content-center">
      <div class="mb-4">
        <h1>Crear nuevo <strong>Show</strong></h1>
      </div>
      <form:errors path="show.*" />
      <form:form modelAttribute="newShow" method="POST" action="/shows/create">
        <div class="form-group row pt-2">
          <form:label path="showTitle" class="col-sm-2 col-form-label col-form-label-sm">Título</form:label>
          <div class="col-sm-10">
            <form:input type="text" path="showTitle" class="form-control" />
          </div>
        </div>
        <div class="text-center my-2">
          <small>
            <form:errors path="showTitle"></form:errors>
          </small>
        </div>
        <div class="form-group row">
          <form:label path="showNetwork" class="col-sm-2 col-form-label col-form-label-sm">Network</form:label>
          <div class="col-sm-10">
            <form:input type="text" path="showNetwork" class="form-control" />
          </div>
        </div>
        <div class="text-center my-2">
          <small>
            <form:errors path="showNetwork"></form:errors>
          </small>
        </div>
        <div class="pt-4">
          <input type="submit" value="Agregar" class="btn btn-lg btn-primary" />
        </div>
      </form:form>
      <div class="mt-5 pb-5 text-end">
        <a href="/shows" class="btn btn-dark">Volver</a>
      </div>
    </div>
  </div>
</body>

</html>