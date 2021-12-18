<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Iniciar sesión - TV Shows</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
</head>

<body>
  <div class="container position-absolute top-50 start-50 translate-middle pb-5">
    <div class="card mx-auto" style="max-width: 500px;">
      <div class="card-header px-5 py-4">
        <h3>Iniciar sesión - <strong>TV Shows</strong></h3>
      </div>      
      <div class="card-body px-5 py-4">
        <form action="/login" method="POST">
          <div class="form-group mb-2">
            <label for="email">Email</label>
            <input type="email" name="username" class="form-control" id="email" />
          </div>
          <div class="form-group mb-4">
            <label for="password">Contraseña</label>
            <input type="password" name="password" class="form-control" id="password" />
          </div>
          <div class="text-center text-danger fw-bold mb-4">
            <c:if test="${errorMessage != null}">
              <c:out value="${errorMessage}"></c:out>
            </c:if>
          </div>
          <div class="d-grid gap-2">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="submit" value="Iniciar sesión" class="btn btn-primary" />
          </div>
        </form>
      </div>
      <div class="card-body border-top text-center px-5 py-4">
        <a class="" href="/registration" role="button">Crear una cuenta</a>
      </div>      
    </div>
  </div>
</body>

</html>