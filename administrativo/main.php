<?php
    session_start();
    if(!isset($_SESSION['id'])){
        header("Location: index.php");
} ?>
<?php include('conexion/conexion.php'); ?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Practicas Industriales - DashBoard</title>

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
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<style type="text/css">
${demo.css}
		</style>
    <script type="text/javascript">
$(function () {
    $('#container').highcharts({
        title: {
            text: 'Nivel de Practica Industrial'
        },
        xAxis: {
          <?php $obtener_anios = $conexion -> query("SELECT anio from estudiantes where anio not in('') group by anio"); ?>
          <?php $contador = 0; ?>
          <?php $cadena =""; ?>
          <?php while ($lista = $obtener_anios -> fetch_array()) { ?>
          <?php if ($contador == 0) {
                  $cadena .= $lista['anio'];
                }else{
                  $cadena .= ', '.$lista['anio'];
                }
                $contador++; ?>
          <?php } ?>
            categories: [<?php echo $cadena; ?>]
        },
        labels: {
            items: [{
                html: 'Total de niveles de practica',
                style: {
                    left: '50px',
                    top: '18px',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                }
            }]
        },
        series: [{
            type: 'column',
            name: 'Nivel 1',
            <?php

            $obtener_anios_contar = $conexion -> query("SELECT
                                                        count(*) as contar,
                                                        nivel_practica_industrial,
                                                        anio
                                                        from
                                                        estudiantes
                                                        where (1=1)
                                                        and
                                                        nivel_practica_industrial = 1
                                                        group by nivel_practica_industrial, anio");

                  while ($lista_por_anio = $obtener_anios_contar -> fetch_array()) {
                    if ($lista_por_anio['anio']==1) {
                        $anio1 = $lista_por_anio['contar'];
                    }elseif ($lista_por_anio['anio']==2) {
                        $anio2 = $lista_por_anio['contar'];
                    }elseif ($lista_por_anio['anio']==3) {
                        $anio3 = $lista_por_anio['contar'];
                    }elseif ($lista_por_anio['anio']==4) {
                        $anio4 = $lista_por_anio['contar'];
                    }elseif ($lista_por_anio['anio']==5) {
                        $anio5 = $lista_por_anio['contar'];
                    }
                  } ?>

            data: [<?php echo $anio1; ?>, <?php echo $anio2; ?>, <?php echo $anio3; ?>, <?php echo $anio4; ?>, <?php echo $anio5; ?>]
            <?php

            $nivel_1_total = $anio1 + $anio2 + $anio3 + $anio4 + $anio5;

             ?>
        }, {
            type: 'column',
            name: 'Nivel 2',
            <?php

            $obtener_anios_contar = $conexion -> query("SELECT
                                                        count(*) as contar,
                                                        nivel_practica_industrial,
                                                        anio
                                                        from
                                                        estudiantes
                                                        where (1=1)
                                                        and
                                                        nivel_practica_industrial = 2
                                                        group by nivel_practica_industrial, anio");

                  while ($lista_por_anio = $obtener_anios_contar -> fetch_array()) {
                        if ($lista_por_anio['anio']==1) {
                            $anio12 = $lista_por_anio['contar'];
                        }elseif ($lista_por_anio['anio']==2) {
                            $anio22 = $lista_por_anio['contar'];
                        }elseif ($lista_por_anio['anio']==3) {
                            $anio32 = $lista_por_anio['contar'];
                        }elseif ($lista_por_anio['anio']==4) {
                            $anio42 = $lista_por_anio['contar'];
                        }elseif ($lista_por_anio['anio']==5) {
                            $anio52 = $lista_por_anio['contar'];
                        }
                  } ?>

            data: [<?php echo $anio12; ?>, <?php echo $anio22; ?>, <?php echo $anio32; ?>, <?php echo $anio42; ?>, <?php echo $anio52; ?>]
            <?php

            $nivel_2_total = $anio12 + $anio22 + $anio32 + $anio42 + $anio52;

             ?>
        }, {
            type: 'column',
            name: 'Nivel 3',
            <?php

            $obtener_anios_contar = $conexion -> query("SELECT
                                                        count(*) as contar,
                                                        nivel_practica_industrial,
                                                        anio
                                                        from
                                                        estudiantes
                                                        where (1=1)
                                                        and
                                                        nivel_practica_industrial = 3
                                                        group by nivel_practica_industrial, anio");

                  while ($lista_por_anio = $obtener_anios_contar -> fetch_array()) {
                      if ($lista_por_anio['anio']==1) {
                          $anio13 = $lista_por_anio['contar'];
                      }elseif ($lista_por_anio['anio']==2) {
                          $anio23 = $lista_por_anio['contar'];
                      }elseif ($lista_por_anio['anio']==3) {
                          $anio33 = $lista_por_anio['contar'];
                      }elseif ($lista_por_anio['anio']==4) {
                          $anio43 = $lista_por_anio['contar'];
                      }elseif ($lista_por_anio['anio']==5) {
                          $anio53 = $lista_por_anio['contar'];
                      }
                  } ?>

            data: [<?php echo $anio13; ?>, <?php echo $anio23; ?>, <?php echo $anio33; ?>, <?php echo $anio43; ?>, <?php echo $anio53; ?>]
            <?php

            $nivel_3_total = $anio13 + $anio23 + $anio33 + $anio43 + $anio53;

             ?>
        },
          {
              type: 'column',
              name: 'Nivel 4',
              <?php

              $obtener_anios_contar = $conexion -> query("SELECT
                                                          count(*) as contar,
                                                          nivel_practica_industrial,
                                                          anio
                                                          from
                                                          estudiantes
                                                          where (1=1)
                                                          and
                                                          nivel_practica_industrial = 4
                                                          group by nivel_practica_industrial, anio");

                    while ($lista_por_anio = $obtener_anios_contar -> fetch_array()) {
                      if ($lista_por_anio['anio']==1) {
                          $anio14 = $lista_por_anio['contar'];
                      }elseif ($lista_por_anio['anio']==2) {
                          $anio24 = $lista_por_anio['contar'];
                      }elseif ($lista_por_anio['anio']==3) {
                          $anio34 = $lista_por_anio['contar'];
                      }elseif ($lista_por_anio['anio']==4) {
                          $anio44 = $lista_por_anio['contar'];
                      }elseif ($lista_por_anio['anio']==5) {
                          $anio54 = $lista_por_anio['contar'];
                      }
                    } ?>

              data: [<?php echo $anio14; ?>, <?php echo $anio24; ?>, <?php echo $anio34; ?>, <?php echo $anio44; ?>, <?php echo $anio54; ?>],
              <?php

              $nivel_4_total = $anio14 + $anio24 + $anio34 + $anio44 + $anio54;

               ?>
                marker: {
                    lineWidth: 2,
                    lineColor: Highcharts.getOptions().colors[3],
                    fillColor: 'white'
                }
            }
        , {
            <?php

             ?>
            type: 'pie',
            name: 'Total consumption',
            data: [{
                name: 'Nivel Practica 1',
                y: <?php echo $nivel_1_total; ?>,
                color: Highcharts.getOptions().colors[0] // Jane's color
            }, {
                name: 'Nivel Practica 2',
                y: <?php echo $nivel_2_total; ?>,
                color: Highcharts.getOptions().colors[1] // John's color
            }, {
                name: 'Nivel Practica 3',
                y: <?php echo $nivel_3_total; ?>,
                color: Highcharts.getOptions().colors[2] // Joe's color
            },
            {
                name: 'Nivel Practica 4',
                y: <?php echo $nivel_4_total; ?>,
                color: Highcharts.getOptions().colors[3] // Joe's color
            }
            ],
            center: [100, 80],
            size: 100,
            showInLegend: false,
            dataLabels: {
                enabled: false
            }
        }]
    });
});


		</script>
  </head>
  <body class="bg-light">
  <?php include('menu.php'); ?>

<main role="main" class="container" style="margin-top: 80px;">
  <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm" style="background-color:#1c7c1a;">
    <img class="mr-3" src="logo/min1i.png" alt="" width="48" height="48">
    <div class="lh-100">
      <h6 class="mb-0 text-white lh-100">DashBoard</h6>
      <small>DashBoard del Sistema</small>
    </div>
  </div>
  <div class="my-3 p-3 bg-white rounded shadow-sm">
    <h6 class="border-bottom border-gray pb-2 mb-0">Info</h6>
    <div class="media text-muted pt-3">
      <h2></h2>
      <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
        <div class="d-flex justify-content-between align-items-center w-100">
          <strong class="text-gray-dark"></strong>
          <a href="#"></a>
          <script src="grafict/js/highcharts.js"></script>
          <script src="grafict/js/modules/exporting.js"></script>

          <div id="container" style="min-width: 100%; height: 400px; margin: 0 auto"></div>
        </div>
        <span class="d-block" style="margin-left:10px;"><small></small></span>
      </div>
    </div>
  </div>
</main>

<!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>-->
<script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script><script src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
<script src="https://getbootstrap.com/docs/4.3/examples/offcanvas/offcanvas.js"></script>

</body>
</html>
