<?php
// O trecho de código faz com que force o apache a exibir os erros, que por padrão são ocultos
header('Content-Type: text/html; charset=utf-8');
ini_set('display_errors',0);
ini_set('display_startup_erros',0);
error_reporting(E_ALL);
// =====================================

//$cod = $_GET["cod"];

// Realiza a conexão com o servidor
// Coloca as informações da conexão na variável $link
require_once "config/init.php";
// Executa a instrução SQL para selectionar todos os registros

//recebemos nosso parâmetro vindo do form
$pesquisa = isset($_POST['pesquisaCliente']) ? $_POST['pesquisaCliente'] : null;

$sql_query = mysqli_query($link, "SELECT * FROM req WHERE nome LIKE '$pesquisa%' ORDER BY nome ASC");

//$sql_query = mysqli_query($link, "SELECT * FROM req");
// Fecha a conexão com o servidor para poupar recursos de processamento
mysqli_close($link);
?>
<!doctype html>
<html lang="pt-br">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>E-Protocol 1.0</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="js/jquery-1.12.4.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/smartpaginator.js" type="text/javascript"></script>
  <link href="css/smartpaginator.css" rel="stylesheet" type="text/css" />
  
  <script>
  $(document).ready(function () {
            $('#green-contents').css('display', '');
            $('ul li').click(function () {
                
                $('#green-contents').css('display', 'none');
                            
                if ($(this).attr('id') == '2') $('#green-contents').css('display', '');
            });

            $('#green').smartpaginator({ totalrecords: 100, recordsperpage: 3, datacontainer: 'mt', dataelement: 'tr', initval: 0, next: 'Next', prev: 'Prev', first: 'First', last: 'Last', theme: 'green' });

            $('#red').smartpaginator({ totalrecords: 32, recordsperpage: 4, length: 4, next: 'Next', prev: 'Prev', first: 'First', last: 'Last', theme: 'red', controlsalways: true, onchange: function (newPage) {
                $('#r').html('Page # ' + newPage);
            }
            });

        });
  </script>
</head>
<body>
 
<div id="wrapper">
        <div style="height: 30px;">
            
        </div>

        <div id="green-contents" class="contents" style="border: solid 1px #5f9000;">

     <table cellpadding='0' cellspacing='0' border='1' bordercolor='#000' class='table'>
                <tr class="header">
                    <th align='center' bgColor='#666666'><font color='#FFF'></font>Nome</th>
                    <th align='center' bgColor='#666666'><font color='#FFF'></font>Tipo</th>
                    <th align='center' bgColor='#666666'><font color='#FFF'></font>CPF</th>
                    <th align='center' bgColor='#666666'><font color='#FFF'></font>Sexo</th>
                    <th align='center' bgColor='#666666'><font color='#FFF'></font>Telefone</th>
                    <th align='center' bgColor='#666666'><font color='#FFF'></font>Celular</th>
                    <th align='center' bgColor='#666666'><font color='#FFF'></font>Recados</th>
                    <th align='center' bgColor='#666666'><font color='#FFF'></font>Email</th>
                </tr>
        <?php while ($array = mysqli_fetch_array($sql_query)) { 
        $req_nome = $array["nome"];
        $req_tipo = $array["tipo"];
        $req_cpf = $array["cpf"];
        $req_sexo = $array["sexo"];
        $req_tel = $array["tel"];
        $req_cel = $array["cel"];
        $req_rec = $array["rec"];
        $req_email = $array["email"];
        

        if ($req_tipo=='F') $rtipo = "Pessoa física";
        if ($req_tipo=='J') $rtipo = "Pessoa jurídica";
        if ($req_tipo=='S') $rtipo = "Servidor público";

        if ($req_sexo=='M') $rsexo = "Masculino";
        if ($req_sexo=='F') $rsexo = "Feminino";
        ?>
                <tr>
                <td width='220' align='center' valign='middle' bgColor='#DDDDDD'><?php echo $req_nome ?></td>
                <td width='120' align='center' valign='middle' bgColor='#DDDDDD'><?php echo $rtipo ?></td>
                <td width='120' align='center' valign='middle' bgColor='#DDDDDD'><?php echo $req_cpf ?></td>
                <td width='120' align='center' valign='middle' bgColor='#DDDDDD'><?php echo $rsexo ?></td>
                <td width='120' align='center' valign='middle' bgColor='#DDDDDD'><?php echo $req_tel ?></td>
                <td width='120' align='center' valign='middle' bgColor='#DDDDDD'><?php echo $req_cel ?></td>
                <td width='120' align='center' valign='middle' bgColor='#DDDDDD'><?php echo $req_rec ?></td>
                <td width='220' align='center' valign='middle' bgColor='#DDDDDD'><?php echo $req_email ?></td>   
                </tr>
            <?php } ?>
            </table>
    </div>

</div>

  </body>
</html>