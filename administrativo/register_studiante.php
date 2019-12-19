<?php  include ('conexion/conexion.php'); ?>
<?php $mesaje_alerta = ""; ?>
<?php if(isset($_POST['reg_estudiante'])){

    // validacion

      /* proceso de imagen */
      $rutaEnServidor = "cedulas"; // ruta en el servidor
      $ruraTemporal = $_FILES['imagen']['tmp_name']; // ruta temporal en la pc
      $nombreImagen = $_FILES['imagen']['name']; // nombre de la imagen

      /*  extencion del archivo*/
      $archivo=$_FILES['imagen']['name'];
      $explode= explode('.', $archivo);
      $extension=array_pop($explode);

      $re_nombre = $_POST['cedula']; // nombrar la imagen
      $rutaDestino = $rutaEnServidor.'/'.$re_nombre.'.'.$extension; // lo que se guarda en la base de datos

      if(move_uploaded_file($ruraTemporal, $rutaDestino)){

      $reg = $conexion -> query("INSERT INTO estudiantes(nombre,
                                                         apellido,
                                                         carrera,
                                                         nivel_practica_industrial,
                                                         cedula,
                                                         img_cedula,
                                                         stat,
                                                         email_usma,
                                                         email_personal,
                                                         anio
                                                        )VALUES(
                                                         '".$_POST['nombre']."',
                                                         '".$_POST['apellido']."',
                                                         '".$_POST['carrera']."',
                                                         '".$_POST['nivel']."',
                                                         '".$_POST['cedula']."',
                                                         '".$rutaDestino."',
                                                         1,
                                                         '".$_POST['emai_usma']."',
                                                         '".$_POST['email']."',
                                                         '".$_POST['anio']."')");

 $mesaje_alerta = '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Registro Realizado</strong> .
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
          }
} ?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Registrar Estudiantes</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/offcanvas/">

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
    <link href="https://getbootstrap.com/docs/4.3/examples/offcanvas/offcanvas.css" rel="stylesheet">
  </head>
  <body class="bg-light">
    <?php include('menu.php');

    ?>

<main role="main" class="container" style="margin-top: 80px;">

  <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm" style="background-color:#1c7c1a;">
    <img class="mr-3" src="logo/min1i.png" alt="" width="48" height="48">
    <div class="lh-100">
      <h6 class="mb-0 text-white lh-100">Registrar Estudiante</h6>
      <small>Registro de Estudiante</small>
    </div>
  </div>
      <?php echo $mesaje_alerta; ?>
  <div class="my-3 p-3 bg-white rounded shadow-sm">
  <form action="" method="post" enctype="multipart/form-data">
  <div class="form-row">
        <div class="form-group col-md-6">
          <label for="inputCity">Nombre</label>
          <input type="text" name="nombre" class="form-control" id="inputCity">
        </div>
        <div class="form-group col-md-6">
          <label for="inputCity">Apellido</label>
          <input type="text" name="apellido" class="form-control" id="inputCity">
        </div>
        <div class="form-group col-md-6">
          <label for="inputCity">Cedula</label>
          <input type="text" name="cedula" class="form-control" id="inputCity">
        </div>
        <div class="form-group col-md-6">
          <label for="inputCity">Email USMA</label>
          <input type="text" name="emai_usma" class="form-control" id="inputCity">
        </div>
        <div class="form-group col-md-6">
          <label for="inputCity">Email personal</label>
          <input type="text" name="email" class="form-control" id="inputCity">
        </div>
        <div class="form-group col-md-6">
            <label for="sel1">Carrera</label>
            <select class="form-control" id="sel1" name="carrera">
              <option value = "">Seleccionar Carrera</option>
            <?php
            $obtener_carreras = $conexion -> query("SELECT * FROM carreras");
          while($lista_carreras = $obtener_carreras->fetch_array()){ ?>
              <option value="<?php echo $lista_carreras['id']; ?>"><?php echo $lista_carreras['descripcion']; ?></option>
            <?php } ?>
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="sel1">Nivel de Practica Industrial</label>
            <select class="form-control" id="sel1" name="nivel">
              <option value = "">Seleccionar nivel</option>
              <?php while ($a <= 3) {
                    $a++;?>
              <option value="<?php echo $a; ?>"><?php echo 'Practica Industrial '.$a; ?></option>
              <?php  } ?>
            <?php
            /*$obtener_carreras = $conexion -> query("SELECT * FROM carreras");
          while($lista_carreras = $obtener_carreras->fetch_array()){ ?>
              <option value="<?php echo $lista_carreras['id']; ?>"><?php echo $lista_carreras['descripcion']; ?></option>
            <?php } */?>
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="sel1">Año de crrera</label>
            <select class="form-control" id="sel1" name="anio">
              <option value = "">Seleccionar año</option>
              <?php while ($b <= 4) {
                    $b++;?>
              <option value="<?php echo $b; ?>"><?php echo 'Año '.$b; ?></option>
              <?php  } ?>
            </select>
        </div>
        <div class="form-group col-md-6">
          <label for="inputCity">Imagen</label>
          <input type="file" name="imagen" class="form-control" accept="image/jpeg">
        </div>
    </div>
    <button type="submit" name="reg_estudiante" class="btn btn-primary" style="background-color:#1c7c1a;">Registrar</button>
   </form>
  </div>

</main>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script><script src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
<script src="https://getbootstrap.com/docs/4.3/examples/offcanvas/offcanvas.js"></script></body>
</html>
