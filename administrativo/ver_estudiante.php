<?php
    session_start();
    if(!isset($_SESSION['id'])){
        header("Location: index.php");
} ?>
<?php include('conexion/conexion.php'); ?>
<?php $mesaje_alerta = ""; ?>
<?php if(isset($_POST['eliminar'])){
      $reg = $conexion -> query("delete from estudiantes where id = '".$_POST['id_eliminar']."'");

 $mesaje_alerta = '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Registro Eliminado</strong> .
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';

} ?>
<?php if(isset($_POST['editar'])){

    $reg = $conexion -> query("update estudiantes set nombre = '".$_POST['nombre']."',
                                                       apellido = '".$_POST['apellido']."',
                                                       carrera = '".$_POST['carrera']."',
                                                       nivel_practica_industrial = '".$_POST['nivel_practica_industrial']."',
                                                       cedula = '".$_POST['cedula']."',
                                                       stat = '".$_POST['stat']."',
                                                       email_usma = '".$_POST['email_usma']."',
                                                       email_personal = '".$_POST['email_personal']."',
                                                       anio = '".$_POST['anio']."'
                                                       where id = '".$_POST['id_editar']."'");

      if ($_FILES['imagen']['name'] != '') {

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

        $reg = $conexion -> query("update estudiantes set img_cedula = '".$rutaDestino."'  where id = '".$_POST['id_editar']."'");

          }

      }

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
    <title>Ver Estudiantes</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/offcanvas/">

    <!-- Bootstrap core CSS -->
<link href="https://getbootstrap.com/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css">
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
  <?php include('menu.php'); ?>

<main role="main" class="container" style="margin-top: 80px;">

  <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm" style="background-color:#1c7c1a;">
    <img class="mr-3" src="logo/min1i.png" alt="" width="48" height="48">
    <div class="lh-100">
      <h6 class="mb-0 text-white lh-100">Ver estudiantes</h6>
      <small>Ver estudiantes</small>
    </div>
  </div>
      <?php echo $mesaje_alerta; ?>
  <div class="my-3 p-3 bg-white rounded shadow-sm">
  <div class="form-row">
  <table class="table" id="example">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#ID</th>
      <th scope="col">Imagen</th>
      <th scope="col">Nombre</th>
      <th scope="col">Cedula</th>
      <th scope="col">Carrera</th>
      <th scope="col">Nivel de practica</th>
      <th scope="col">Status</th>
      <th scope="col">Acciones</th>
    </tr>
  </thead>
  <tbody>
    <?php $obtener_estudiante_carrera = $conexion -> query("SELECT e.id,
                                                                   e.nombre,
                                                                   e.apellido,
                                                                   e.cedula,
                                                                   e.img_cedula,
                                                                   e.nivel_practica_industrial,
                                                                   e.stat,
                                                                   e.email_usma,
                                                                   e.email_personal,
                                                                   e.carrera,
                                                                   e.anio,
                                                                   c.descripcion FROM estudiantes e inner join carreras c on e.carrera = c.id");

          while($lista_estudiante_carrera = $obtener_estudiante_carrera->fetch_array()){ ?>
    <tr>
      <th scope="row"><?php echo $lista_estudiante_carrera['id']; ?></th>
      <td><img src="<?php echo $lista_estudiante_carrera['img_cedula']; ?>" width="50"></td>
      <td><?php echo $lista_estudiante_carrera['nombre'].' '.$lista_estudiante_carrera['apellido']; ?></td>
      <th scope="row"><?php echo $lista_estudiante_carrera['cedula']; ?></th>
      <td><?php echo $lista_estudiante_carrera['descripcion']; ?></td>
      <td><?php echo $lista_estudiante_carrera['nivel_practica_industrial']; ?></td>
      <td><?php if($lista_estudiante_carrera['stat'] == 1){ echo 'On';}else{echo 'Off';} ?></td>
      <td>
        <input type="button" name="editar" class="btn btn-primary" data-toggle="modal" data-target="#EditarModal<?php echo $lista_estudiante_carrera['id']; ?>" value="Editar">
        <!-- Modal Editar -->
        <!-- Fin de Modal Editar -->
        <input type="button" name="eliminar" class="btn btn-danger" data-toggle="modal" data-target="#EliminarModal<?php echo $lista_estudiante_carrera['id']; ?>" value="Eliminar">
            </td>
    </tr>
          <!-- Modal Eliminar -->
          <div class="modal fade" id="EliminarModal<?php echo $lista_estudiante_carrera['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Carrera # <?php echo $lista_estudiante_carrera['id']; ?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                    ID: <b> <?php echo $lista_estudiante_carrera['id']; ?> </b><br>
                    Nombre: <b><?php echo $lista_estudiante_carrera['nombre'].' '.$lista_estudiante_carrera['apellido']; ?></b><br>
                    Carrera: <b><?php echo $lista_estudiante_carrera['descripcion']; ?></b><br>
                    Cedula: <b><?php echo $lista_estudiante_carrera['cedula']; ?></b><br>
                    <h5 style="color:red;">Esta seguro que desea eliminar el estudiante?</h5>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <form class="" action="" method="post">
                  <button type="submit" name="eliminar" class="btn btn-danger">Eliminar</button>
                  <input type="hidden" name="id_eliminar" value="<?php echo $lista_estudiante_carrera['id']; ?>">
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- Fin de Modal Eliminar -->
          <div class="modal fade" id="EditarModal<?php echo $lista_estudiante_carrera['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar Estudiante</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form class="" action="" method="post" enctype="multipart/form-data">
              <div class="modal-body">
                <div class="form-row">
                      <div class="form-group col-md-12">
                        <img src="<?php echo $lista_estudiante_carrera['img_cedula']; ?>" width="250">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputCity">Nombre</label>
                        <input type="text" name="nombre" value="<?php echo $lista_estudiante_carrera['nombre']; ?>" class="form-control" id="inputCity">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputCity">Apellido</label>
                        <input type="text" name="apellido" value="<?php echo $lista_estudiante_carrera['apellido']; ?>" class="form-control" id="inputCity">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputCity">Cedula</label>
                        <input type="text" name="cedula" value="<?php echo $lista_estudiante_carrera['cedula']; ?>" class="form-control" id="inputCity">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputCity">Email USMA</label>
                        <input type="text" name="email_usma" value="<?php echo $lista_estudiante_carrera['email_usma']; ?>" class="form-control" id="inputCity">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputCity">Email personal</label>
                        <input type="text" name="email_personal" value="<?php echo $lista_estudiante_carrera['email_personal']; ?>" class="form-control" id="inputCity">
                      </div>
                      <div class="form-group col-md-6">
                          <label for="sel1">Carrera</label>
                          <select class="form-control" id="sel1" name="carrera">
                            <option value = "">Seleccionar Carrera</option>
                          <?php
                          $obtener_carreras = $conexion -> query("SELECT * FROM carreras");
                            while($lista_carreras = $obtener_carreras->fetch_array()){ ?>
                            <option value="<?php echo $lista_carreras['id']; ?>" <?php if($lista_carreras['id'] == $lista_estudiante_carrera['carrera']){ echo 'selected'; } ?>><?php echo $lista_carreras['descripcion']; ?></option>
                          <?php } ?>
                          </select>
                      </div>
                      <div class="form-group col-md-6">
                          <label for="sel1">Nivel de Practica Industrial</label>
                          <select class="form-control" id="sel1" name="nivel_practica_industrial">
                            <option value = "">Seleccionar nivel</option>
                            <?php while ($a <= 3) {
                                  $a++;?>
                            <option value="<?php echo $a; ?>" <?php if($a == $lista_estudiante_carrera['nivel_practica_industrial']){ echo 'selected'; } ?>><?php echo 'Practica Industrial '.$a; ?></option>
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
                            <option value="<?php echo $b; ?>" <?php if($b == $lista_estudiante_carrera['anio']){ echo 'selected'; } ?>><?php echo 'Año '.$b; ?></option>
                            <?php  } ?>
                          </select>
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputCity">Imagen</label>
                        <input type="file" name="imagen" class="form-control" accept="image/jpeg">
                      </div>
                      <div class="form-group col-md-6">
                          <label for="sel1">Stat</label>
                          <select class="form-control" id="sel1" name="stat">
                            <option value = "">Seleccionar status</option>
                            <option value = "1" <?php if(1 == $lista_estudiante_carrera['stat']){ echo 'selected'; } ?>>On</option>
                            <option value = "2" <?php if(2 == $lista_estudiante_carrera['stat']){ echo 'selected'; } ?>>Off</option>
                          </select>
                      </div>
                  </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                  <button type="submit" name="editar" class="btn btn-primary">Editar</button>
                  <input type="hidden" name="id_editar" value="<?php echo $lista_estudiante_carrera['id']; ?>">
                </form>
              </div>
            </div>
          </div>
        </div>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
</main>
<!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script><script src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
<script src="https://getbootstrap.com/docs/4.3/examples/offcanvas/offcanvas.js"></script>-->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#example').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    } );
  } );
</script>
<script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script><script src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
<script src="https://getbootstrap.com/docs/4.3/examples/offcanvas/offcanvas.js"></script>


  </body>
</html>
