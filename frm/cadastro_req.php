<?php
session_start();
include "_navegacao.php";
?>
<!DOCTYPE HTML>
 <html lang="pt-br">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
    <title>Cadastro de requerentes</title>

    <meta name="description" content="">
    <meta name="author" content="Jaquison Quintao Leandro">
    <!-- Bootstrap -->
    <link href="../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="../lib/jquery/jquery-1.12.4.js"></script>
    <!-- Funções para validação de CPF e CNPJ -->
    <script src="../lib/valida_cpf_cnpj.js"></script>
    <script src="../lib/formatacnpjcpf.js"></script>
</head>
<body>

<div class="page-header">
        <h1>Cadastro de Requerentes</h1>
</div>

<form class name="cadastro" id="cadastro" method="POST" action="../op/cadastrar_req.php" >
<fieldset>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="txtNome">Nome</label>  
  <div class="col-md-5">
  <input id="txtNome" name="txtNome" type="text" value="" placeholder="Nome do usuário" class="inputUnico form-control input-md" required="">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="txtTipo">Informe o tipo</label>  
  <div class="col-md-5">
  <select name="txtTipo" id="txtTipo" class="inputUnico form-control input-md" />
        <option>Selecione...</option>
        <option value="F">PESSOA FÍSICA</option>
        <option value="J">PESSOA JURÍDICA</option>
        <option value="S">SERVIDOR PÚBLICO</option>
        </select>
 </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="txtCpf">CPF/CNPJ</label>  
  <div class="col-md-5">
  <input id="txtCpf" name="txtCpf" type="text" class="inputUnico cpf_cnpj form-control input-md" value="" size="18" maxlength="18"/>
 </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="txtTel">Telefone</label>
  <div class="col-md-5">
    <input type="text" name="txtTel" id="txtTel" value="" class="inputUnico form-control input-md" onkeypress="return txtBoxFormat(this, '(##)####-####', event);"/>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="txtCel">Celular</label>
  <div class="col-md-5">
    <input type="text" name="txtCel" id="txtCel" value="" class="inputUnico form-control input-md" onkeypress="return txtBoxFormat(this, '(##)#####-####', event);"/>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="txtRec">Recados</label>
  <div class="col-md-5">
    <input type="text" name="txtRec" id="txtRec" value="" class="inputUnico form-control input-md" onkeypress="return txtBoxFormat(this, '(##)#####-####', event);" />
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="txtEmail">Email</label>
  <div class="col-md-5">
    <input type="email" name="txtEmail" id="txtEmail" value="" class="inputUnico form-control input-md"  placeholder="digite seu @email.com.br" />
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="txtSexo">Sexo</label>
  <div class="col-md-5">
    <select id="txtSexo" name="txtSexo" class="inputUnico form-control">
      <option>Selecione...</option>
      <option value="M">Masculino</option>
      <option value="F">Feminino</option>
    </select>
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="btnEnviar"></label>
  <div class="col-md-8">
    <button type="submit" id="btnEnviar" name="btnEnviar" class="btn btn-primary">Confirmar</button>
    <button type="reset" id="btnCancelar" name="btnCancelar" class="btn btn-warning">Cancelar</button>
    <input type="button" id="btnFechar" name="btnFechar" value="Fechar" class="btn btn-danger" onclick="javascript:location.href='../index.php'">
  </div>
</div>
</fieldset>
</form>
    <script src="../lib/tab.js"></script>
    <script src="../lib/main.js"></script>
</body>
</html>
