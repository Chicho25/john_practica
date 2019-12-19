<?php $mensaje =""; ?>
<?php if(isset($_POST['ingresar'])){

      include('conexion/conexion.php');

      $verificar_usuario = $conexion -> query("select 
                                                count(*) as contar 
                                               from usuarios 
                                               where 
                                               user_name = '".$_POST['user_name']."' 
                                               and 
                                               pass = '".$_POST['pass']."'"); 
                                               
      while($list_contar = $verificar_usuario -> fetch_array()){
             $resultado= $list_contar['contar']; 
      }
      if (isset($resultado) and $resultado > 0) {

          $obtener_datos_usuario = $conexion -> query("select 
                                                        *
                                                        from usuarios 
                                                        where 
                                                        user_name = '".$_POST['user_name']."' 
                                                        and 
                                                        pass = '".$_POST['pass']."'"); 
          while($obtener_usuario = $obtener_datos_usuario -> fetch_array()){
                $id = $obtener_usuario['id'];
                $nombre = $obtener_usuario['nombre'];
                $apellido = $obtener_usuario['apellido'];
          }

          session_start();
          
          $_SESSION['id'] = $id;
          $_SESSION['nombre'] = $nombre;
          $_SESSION['apellido'] = $apellido;

          header("Location: main.php");
      }else{
          $mensaje = '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Usuario incorrecto, intente de nuevo</strong> .
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
      }
} ?>
<html lang="es"><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="John">
    <meta n.ame="generator" content="Jekyll v38.5">
    <title>Practica Industrial</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/sign-in/">
    <!-- Bootstrap core CSS -->
    <link href="https://getbootstrap.com/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/4.3/examples/sign-in/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
  
  <form class="form-signin" action="" method="POST">
  <?php echo $mensaje; ?>
  <img class="mb-4" src="img/logo.png" alt="" width="300">
  <h1 class="h3 mb-3 font-weight-normal">Login</h1>
  <label for="inputEmail" class="sr-only">Usuario</label>
  <input type="text" name="user_name" id="" class="form-control" require placeholder="Ingrese el usuario">
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" name="pass" id="inputPassword" require class="form-control" placeholder="Password">

  <button name="ingresar" class="btn btn-lg btn-primary btn-block" style="background-color:#1c7c1a;" type="submit">Ingresar</button>
</form>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script><script src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
        <script src="https://getbootstrap.com/docs/4.3/examples/offcanvas/offcanvas.js"></script></body>
</html>
