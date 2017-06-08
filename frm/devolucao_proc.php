<?php
// O trecho de código faz com que force o apache a exibir os erros, que por padrão são ocultos
header('Content-Type: text/html; charset=utf-8');
ini_set('display_errors',0);
ini_set('display_startup_erros',0);
error_reporting(E_ALL);

session_start();
include "_navegacao.php";

// =====================================
// Realiza a conexão com o servidor
// Coloca as informações da conexão na variável $link
require_once "../config/init.php";

$setor = $_SESSION['user_setor'];
// Executa a instrução SQL para selectionar todos os registros
$sql_query = mysqli_query($link,"SELECT s.cod_setor AS cod_setor FROM setor s WHERE s.setor = '".$setor."'");

$r = mysqli_fetch_array($sql_query);
$scod = $r["cod_setor"];

//Seleciona o processo cadastrado pelo  
//código no banco de dados.

$cod = $_GET["cod"];

//Consulta União tabelas setor e proc (processos)
$sql_query = mysqli_query($link,"SELECT s.cod_setor, s.setor AS desc_setor, p.setor FROM setor s, proc p WHERE s.cod_setor = p.setor AND p.cod = '".$cod."'");

//Consulta tabela proc (processos)
$sql2_query = mysqli_query($link,"SELECT * FROM proc WHERE cod = '".$cod."'");

//Consulta tabela req (requerentes)
$sql3_query = mysqli_query($link,"SELECT r.cod, r.nome FROM req r , proc p WHERE r.cod = p.cod_req AND p.cod = '".$cod."'");

//Consulta de todos registros na tabela setor
$sql4_query = mysqli_query($link, "SELECT * FROM setor");

// Fecha a conexão com o servidor para poupar recursos de processamento
mysqli_close($link);
?>

<!DOCTYPE HTML>
 <html lang="pt-br">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
    <title>Devolução de Processo</title>

    <meta name="description" content="">
    <meta name="author" content="Jaquison Quintao Leandro">
    <link rel="icon" type="image/x-icon" href="favicon.ico"> 
    <!-- Bootstrap -->
    <link href="../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="../lib/jquery/jquery-1.12.4.js" type="text/javascript"></script>
    
</head>
<body>


<div class="page-header">
  <h1>Devolução de Processo</h1>
</div>

<form name="cadastro" id="cadastro" method="POST" action="../op/devolver_proc.php">
<?php $linha = mysqli_fetch_array($sql2_query)?>
<fieldset>

<div class="form-group">
<label class="col-md-4 control-label" for="txtCod">Protocolo nº</label>
  <label class="col-md-5 control-label" /><span style="font-family: Arial; font-size: 28px; font-style:italic; color:#000000;"><?php echo $linha["cod"] ?></span></label>
  </div>
</div>

<?php $rlinha = mysqli_fetch_array($sql3_query) ?>

<div class="form-group">
<label class="col-md-4 control-label" for="txtRequerente">Nome do requerente</label>
  <div class="col-md-5">
     <input type="text" name="txtRequerente" id="txtRequerente" value="<?php echo $rlinha["nome"] ?>" class="form-control input-md" required="" disabled="">
    </div>
</div>
<!-- Text Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="txtTipo">Tipo</label>
  <div class="col-md-5">
     <?php 
     if ($linha["tipo"]=='PI') $ptipo = "Processo Interno";
     if ($linha["tipo"]=='PE') $ptipo = "Processo Externo";
     if ($linha["tipo"]=='OT') $ptipo = "Outros";
     ?>
     <input type="text" name="txtTipo" id="txtTipo" value="<?php echo $ptipo ?>" class="form-control input-md" required="" disabled="">
  </div>
</div>
<!-- Select Basic -->
<div class="form-group">
<?php 
  $array = mysqli_fetch_array($sql_query);
  $cod_setor = $array["cod_setor"];
  $desc_setor = $array["desc_setor"];
?>
 <label class="col-md-4 control-label" for="txtSetor">Setor de origem</label>
  <div class="col-md-5">
     <input type="text" name="txtSetor" id="txtSetor" value="<?php echo $desc_setor ?>" class="form-control input-md" required="" disabled="">
    </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="txtAssunto">Assunto</label>  
  <div class="col-md-5">
  <input type="text" name="txtAssunto" id="txtAssunto" value="<?php echo $linha["assunto"] ?>" placeholder="Digite o assunto" class="form-control input-md" required="" disabled="">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="txtDescricao">Observação</label>  
  <div class="col-md-5">
  <textarea name="txtObservacao" id="txtObservacao" placeholder="Preencha a observação aqui" class="form-control input-md" required=""></textarea>
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="btnEnviar"></label>
  <div class="col-md-8">
    <button type="submit" id="btnEnviar" name="btnEnviar" class="btn btn-success">Enviar</button>
       
    <!--<input type="button" id="btnFechar" name="btnFechar" value="Fechar" class="btn btn-danger" onclick="javascript:location.href='../index.php'">-->
  
    <input type="hidden" name="cod_dProc" value="<?php echo $linha["cod"] ?>">
    <input type="hidden" name="cod_dReq" value="<?php echo $rlinha["cod"] ?>">
    <input type="hidden" name="cod_dSetor" value="<?php echo $cod_setor ?>">
    <input type="hidden" id="" name="cod_oSetor" value="<?php echo $scod ?>" />
    </div>
</div>

</fieldset>
</form>

<script src="../lib/main.js"></script>

</body>
</html>
