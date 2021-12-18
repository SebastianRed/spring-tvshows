<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Registrar - TV Shows</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
</head>

<body>
    <div class="container position-absolute top-50 start-50 translate-middle pb-5">
      <div class="card mx-auto" style="max-width: 500px;">
        <div class="card-header px-5 py-4">
          <h3>Crear cuenta - <strong>TV Shows</strong></h3>
        </div>
        <div class="card-body px-5 py-4">
          <form:form modelAttribute="user" action="/registration" method="post">
            <div class="form-group mb-2">
              <form:label path="username" for="username">Username</form:label>
              <form:input path="username" type="text" class="form-control" id="username" />
            </div>
            <div class="form-group mb-2">
              <form:label path="email" for="email">Email</form:label>
              <form:input path="email" type="text" class="form-control" id="email" />
            </div>
            <div class="form-group mb-2">
              <form:label path="password" for="password">Password</form:label>
              <form:password path="password" class="form-control" id="password" />
            </div>
            <div class="form-group mb-4">
              <form:label path="passwordConfirmation" for="password-confirmation">Password confirmation</form:label>
              <form:password path="passwordConfirmation" class="form-control" id="password-confirmation" />
            </div>
            <div class="d-grid gap-2">
              <input type="submit" value="Registrar" class="btn btn-primary" />
            </div>            
          </form:form>
        </div>
        <div class="mt-3 text-center">
          <form:errors path="*" />
        </div>
        <div class="card-body border-top text-center px-5 py-4">
          ¿Tienes una cuenta? <a class="" href="/login" role="button">Iniciar sesión</a>
        </div>
      </div>
    </div>
</body>

</html>