<?php
    session_start();
    if(!isset($_SESSION['id'])){
        header("Location: index.php");
} ?>
<?php include('conexion/conexion.php'); ?>
<?php $mesaje_alerta = ""; ?>
<?php if(isset($_POST['eliminar'])){
      $reg = $conexion -> query("delete from espresas where id = '".$_POST['id_eliminar']."'");

 $mesaje_alerta = '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Registro Eliminado</strong> .
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';

} ?>
<?php if(isset($_POST['editar'])){

    $reg = $conexion -> query("update espresas set nombre_empresa = '".$_POST['nombre_empresa']."',
                                                       email = '".$_POST['email']."',
                                                       descripcion = '".$_POST['descripcion']."',
                                                       area_negocios = '".$_POST['area_negocios']."',
                                                       stat = '".$_POST['stat']."',
                                                       telefono = '".$_POST['telefono']."'
                                                       WHERE
                                                       id = '".$_POST['id_editar']."'");

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
    <title>Ver Empresas</title>

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
      <h6 class="mb-0 text-white lh-100">Ver Empresas</h6>
      <small>Ver Empresas</small>
    </div>
  </div>
      <?php echo $mesaje_alerta; ?>
  <div class="my-3 p-3 bg-white rounded shadow-sm">
  <div class="form-row">
  <table class="table" id="example">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#ID</th>
      <th scope="col">Nombre Empresa</th>
      <th scope="col">Email</th>
      <th scope="col">Descripcion</th>
      <th scope="col">Area de negocios</th>
      <th scope="col">Status</th>
      <th scope="col">Telefono</th>
      <th scope="col">Acciones</th>
    </tr>
  </thead>
  <tbody>
    <?php $obtener_estudiante_carrera = $conexion -> query("SELECT e.id,
                                                                   e.nombre_empresa,
                                                                   e.email,
                                                                   e.descripcion,
                                                                   e.area_negocios,
                                                                   e.stat,
                                                                   e.telefono,
                                                                   c.descripcion as rubro FROM espresas e inner join area_negocios c on e.area_negocios = c.id");

          while($lista_estudiante_carrera = $obtener_estudiante_carrera->fetch_array()){ ?>
    <tr>
      <th scope="row"><?php echo $lista_estudiante_carrera['id']; ?></th>
      <td><?php echo $lista_estudiante_carrera['nombre_empresa']; ?></td>
      <td><?php echo $lista_estudiante_carrera['email']; ?></td>
      <th scope="row"><?php echo $lista_estudiante_carrera['descripcion']; ?></th>
      <td><?php echo $lista_estudiante_carrera['rubro']; ?></td>
      <td><?php if($lista_estudiante_carrera['stat'] == 1){ echo 'On';}else{echo 'Off';} ?></td>
      <td><?php echo $lista_estudiante_carrera['telefono']; ?></td>
      <td>
        <input type="button" name="editar" class="btn btn-primary" data-toggle="modal" data-target="#EditarModal<?php echo $lista_estudiante_carrera['id']; ?>" value="Editar">
        <!-- Modal Editar -->
        <div class="modal fade" id="EditarModal<?php echo $lista_estudiante_carrera['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Editar Empresa</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form class="" action="" method="post" enctype="multipart/form-data">
            <div class="modal-body">
              <div class="form-row">
                    <div class="form-group col-md-12">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="inputCity">Nombre Empresa</label>
                      <input type="text" name="nombre_empresa" value="<?php echo $lista_estudiante_carrera['nombre_empresa']; ?>" class="form-control" id="inputCity">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="inputCity">Email</label>
                      <input type="text" name="email" value="<?php echo $lista_estudiante_carrera['email']; ?>" class="form-control" id="inputCity">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="inputCity">Descripcion</label>
                      <input type="text" name="descripcion" value="<?php echo $lista_estudiante_carrera['descripcion']; ?>" class="form-control" id="inputCity">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="inputCity">Telefono</label>
                      <input type="text" name="telefono" value="<?php echo $lista_estudiante_carrera['telefono']; ?>" class="form-control" id="inputCity">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="sel1">Carrera</label>
                        <select class="form-control" id="sel1" name="area_negocios">
                          <option value = "">Area de negocios</option>
                        <?php
                        $obtener_carreras = $conexion -> query("SELECT * FROM area_negocios");
                          while($lista_carreras = $obtener_carreras->fetch_array()){ ?>
                          <option value="<?php echo $lista_carreras['id']; ?>" <?php if($lista_carreras['id'] == $lista_estudiante_carrera['area_negocios']){ echo 'selected'; } ?>><?php echo $lista_carreras['descripcion']; ?></option>
                        <?php } ?>
                        </select>
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
              <!-- Fin de Modal Editar -->
              <input type="button" name="eliminar" class="btn btn-danger" data-toggle="modal" data-target="#EliminarModal<?php echo $lista_estudiante_carrera['id']; ?>" value="Eliminar">
              <!-- Modal Eliminar -->
              <div class="modal fade" id="EliminarModal<?php echo $lista_estudiante_carrera['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Empresa # <?php echo $lista_estudiante_carrera['id']; ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                        ID: <b> <?php echo $lista_estudiante_carrera['id']; ?> </b><br>
                        Nombre Empresa: <b><?php echo $lista_estudiante_carrera['nombre_empresa']; ?></b><br>
                        Descripcion: <b><?php echo $lista_estudiante_carrera['descripcion']; ?></b><br>
                        Telefono: <b><?php echo $lista_estudiante_carrera['telefono']; ?></b><br>
                        <h5 style="color:red;">Esta seguro que desea eliminar La empresa?</h5>
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
            </td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
</main>
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
