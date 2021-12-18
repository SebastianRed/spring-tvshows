<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home - TV Shows</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
  <header class="bg-dark text-white px-5 d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
    <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
      <span class="text-white fs-3">TVShows</span>
    </a>
    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
      <li><a href="/home" class="nav-link px-2 text-white">Home</a></li>
      <li><a href="/shows/new" class="nav-link px-2 link-secondary">Nuevo Show</a></li>
    </ul>
    <form id="logout" method="post" action="/logout" class="col-md-3 text-end">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <input type="submit" value="Cerrar sesión" class="btn btn-primary">
    </form>
  </header>

  <div class="content">
    <div class="container">
      <div class="mb-4">
        <h1 class="mb-4">TV Shows</h1>
        <h2>Bienvenido,
          <strong>
            <c:out value="${currentUser.username }"></c:out>
          </strong>
        </h2>        
      </div>
      <div>
        <table class="table table-hover table-striped">
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Show</th>
              <th scope="col">Network</th
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${allShows}" var="show">
              <tr>
                <td>${show.id}</td>
                <td scope="row">
                  <a href="/shows/${show.id}" class="font-weight-bold">${show.showTitle}</a>
                </td>
                <td>${show.showNetwork}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>        
        <div class="text-end">
          <a href="/shows/new" class="btn btn-success">Agregar show</a>
        </div>
      </div>
    </div>
  </div>
</body>

</html>