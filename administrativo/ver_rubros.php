<?php
    session_start();
    if(!isset($_SESSION['id'])){
        header("Location: index.php");
} ?>
<?php include('conexion/conexion.php'); ?>
<?php $mesaje_alerta = ""; ?>
<?php if(isset($_POST['eliminar'])){
      $reg = $conexion -> query("delete from area_negocios where id = '".$_POST['id_eliminar']."'");

 $mesaje_alerta = '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Registro Eliminado</strong> .
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';

} ?>
<?php if(isset($_POST['nombre_carrera_edit'])){
      $reg = $conexion -> query("update area_negocios set descripcion = '".$_POST['nombre_carrera_edit']."' where id = '".$_POST['id_editar']."'");

 $mesaje_alerta = '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Registro Modificado</strong> .
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';

} ?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Ver Rubros</title>

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
      <h6 class="mb-0 text-white lh-100">Ver Rubros</h6>
      <small>Ver Rubros</small>
    </div>
  </div>
      <?php echo $mesaje_alerta; ?>
  <div class="my-3 p-3 bg-white rounded shadow-sm">
  <form action="" method="post">
  <div class="form-row">
  <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#ID</th>
      <th scope="col">Rubro</th>
      <th scope="col">Status</th>
      <th scope="col">Acciones</th>
    </tr>
  </thead>
  <tbody>
    <?php $obrener_carreras = $conexion -> query("SELECT * FROM area_negocios");
          while($lista_carreras = $obrener_carreras->fetch_array()){ ?>
    <tr>
      <th scope="row"><?php echo $lista_carreras['id']; ?></th>
      <td><?php echo $lista_carreras['descripcion']; ?></td>
      <td><?php echo $lista_carreras['stat']; ?></td>
      <td>
        <input type="button" name="editar" class="btn btn-primary" data-toggle="modal" data-target="#EditarModal<?php echo $lista_carreras['id']; ?>" value="Editar">
        <!-- Modal Editar -->
        <div class="modal fade" id="EditarModal<?php echo $lista_carreras['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Editar Rubro</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form class="" action="" method="post">
            <div class="modal-body">
                <textarea name="nombre_carrera_edit" class="form-control"><?php echo $lista_carreras['descripcion']; ?></textarea>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="submit" name="editar" class="btn btn-primary">Editar</button>
                <input type="hidden" name="id_editar" value="<?php echo $lista_carreras['id']; ?>">
              </form>
            </div>
          </div>
        </div>
      </div>
        <!-- Fin de Modal Editar -->
        <input type="button" name="eliminar" class="btn btn-danger" data-toggle="modal" data-target="#EliminarModal<?php echo $lista_carreras['id']; ?>" value="Eliminar">
        <!-- Modal Eliminar -->
        <div class="modal fade" id="EliminarModal<?php echo $lista_carreras['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Rubro # <?php echo $lista_carreras['id']; ?></h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                  ID: <b> <?php echo $lista_carreras['id']; ?> </b><br>
                  Rubro: <b><?php echo $lista_carreras['descripcion']; ?></b><br>
                  STATUS: <b> <?php echo $lista_carreras['stat']; ?></b><br>
                  <h5 style="color:red;">Esta seguro que desea eliminar El rubro</h5>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
              <form class="" action="" method="post">
                <button type="submit" name="eliminar" class="btn btn-danger">Eliminar</button>
                <input type="hidden" name="id_eliminar" value="<?php echo $lista_carreras['id']; ?>">
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Fin de Modal Eliminar -->
      </td>
    </tr>
   <?php } ?>
   </tbody>
  </table>
    </div>

   </form>
  </div>

</main>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script><script src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
<script src="https://getbootstrap.com/docs/4.3/examples/offcanvas/offcanvas.js"></script></body>
</html>
