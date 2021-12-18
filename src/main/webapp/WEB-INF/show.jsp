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
  <title>Show - TV Shows</title>
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
      <li><a href="/shows/new" class="nav-link px-2 link-secondary">Nuevo Show</a></li>
    </ul>
    <form id="logout" method="post" action="/logout" class="col-md-3 text-end">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <input type="submit" value="Cerrar sesión" class="btn btn-primary">
    </form>
  </header>
  <div class="content">
    <div class="container">
      <div class="row justify-content-center">

        <div class="mb-4">
          <h3>TV<strong>Shows</strong></h3>
          <h5>Title: <strong>${show.showTitle}</strong></h5>
          <h5>Network: <strong>${show.showNetwork}</strong></h5>
          <p>Usuarios que calificaron este programa</p>
        </div>
        <div class="mb-5">
          <table class="table table-striped table-hover border border-primary">
            <thead>
              <tr>
                <th scope="col">Nombre</th>
                <th scope="col">Calificación</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${showRatings}" var="rat">
                <tr>
                  <td scope="row">${rat.user.username}</td>
                  <td>${rat.rating}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <div>

          <c:if test="${currentUser.id == creatorShow.id}">
            <a href="/shows/${show.id}/edit" class="btn btn-info">Edit</a>
          </c:if>

          <form:form method="POST" action="/shows/${show.id}/add" modelAttribute="addRating">

            <form:hidden path="user.id" value="${currentUser.id}" />
            <!--<form:hidden path="show" value="${show.id}" />-->
            <div class="form-inline">
              <form:label path="rating">Leave a Rating</form:label>

              <div class="mx-3">
                <form:input type="number" min="1" max="5" path="rating" class="form-control" />
                <form:errors path="rating" />
              </div>
              <div>
                <input type="submit" value="Rate...!" class="btn btn-primary" />
              </div>
            </div>

          </form:form>

          <button class="btn btn-primary">Modificar</button>
          <p>Deja una calificación: </p>
          <button class="btn btn-primary">Volver</button>
        </div>

        <div class="mt-5 pb-5 text-end">
          <a href="/shows" class="btn btn-dark">Volver</a>
        </div>

      </div>
    </div>
  </div>
</body>

</html>