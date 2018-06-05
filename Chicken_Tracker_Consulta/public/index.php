<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require 'db.php';
$app = new \Slim\App;
$app->options('/{routes:.+}', function ($request, $response, $args) {
    return $response;
});

$app->add(function ($req, $res, $next) {
    $response = $next($req, $res);
    return $response
        ->withHeader('Access-Control-Allow-Origin', 'http://localhost:8080')
        ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
        ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
});
$app->get('/api/perfil/usuario/{name}/', function (Request $request, Response $response) {
    $name = $request->getAttribute('name');
    $sql = "Select * from perfil where usuario='$name'";
    $response->withAddedHeader('Access-Control-Allow-Origin', '*');
    try{

        echo "<script type='javascript'>alert('Email enviado com Sucesso!');";
        echo "javascript:window.location='index.php';</script>";
        $db = new db();
        $db = $db->connect();
        $stmt = $db->query($sql);
        $cont = 0;
        while($row = $stmt->fetch()){
            $cont++;
        }
        $db = null;
        if($cont==1){
            echo '{"existe":"true"}';
        }else{
            echo '{"existe":"false"}';
        }
    }catch(PDOException $e){
        echo '{"error":{"text": '.$e->getMessage().'}';
    }
});

$app->get('/api/perfil/email/{email}/', function (Request $request, Response $response) {
    $email = $request->getAttribute('email');
    $sql = "Select * from perfil where email='$email'";
    try{
        $db = new db();
        $db = $db->connect();
        $stmt = $db->query($sql);
        $cont = 0;
        while($row = $stmt->fetch()){
            $cont++;
        }
        $db = null;
        if($cont==1){
            echo '{"existe":"true"}';
        }else{
            echo '{"existe":"false"}';
        }
    }catch(PDOException $e){
        echo '{"error":{"text": '.$e->getMessage().'}';
    }
});

$app->get('/api/negocio/{name}/', function (Request $request, Response $response) {
    $name = $request->getAttribute('name');
    $sql = "Select * from negocio where empresaCNPJ='$name'";
    try{
        $db = new db();
        $db = $db->connect();
        $stmt = $db->query($sql);
        $cont = 0;
        while($row = $stmt->fetch()){
            $cont++;
        }
        $db = null;
        if($cont==1){
            echo '{"existe":"true"}';
        }else{
            echo '{"existe":"false"}';
        }
    }catch(PDOException $e){
        echo '{"error":{"text": '.$e->getMessage().'}';
    }
});
$app->get('/api/estabelecimento/{empresaCNPJ}/{sufixoCNPJ}/', function (Request $request, Response $response) {
    $empresaCNPJ = $request->getAttribute('empresaCNPJ');
    $sufixoCNPJ = $request->getAttribute('sufixoCNPJ');
    $sql = "Select * from estabelecimento where sufixoCNPJ_id='$sufixoCNPJ' and negocio_id='$empresaCNPJ'";
    try{
        $db = new db();
        $db = $db->connect();
        $stmt = $db->query($sql);
        $cont = 0;
        while($row = $stmt->fetch()){
            $cont++;
        }
        $db = null;
        if($cont==1){
            echo '{"existe":"true"}';
        }else{
            echo '{"existe":"false"}';
        }
    }catch(PDOException $e){
        echo '{"error":{"text": '.$e->getMessage().'}';
    }
});

$app->get('/api/fornecimento/{id}/{CNPJ}/{produto}/{tipo}', function (Request $request, Response $response) {
    $estabelecimento = $request->getAttribute('id');
    $funcionario = $request->getAttribute('CPF');
    $produto = $request->getAttribute('produto');
    $tipo = $request->getAttribute('tipo');
    $sql = "Select * from estabelecimentofuncionario where estabelecimento_id='$estabelecimento' and funcionario_i='$funcionario' 
            and produto_id = '$produto' and tipo = '$tipo'";
    try{
        $db = new db();
        $db = $db->connect();
        $stmt = $db->query($sql);
        $cont = 0;
        while($row = $stmt->fetch()){
            $cont++;
        }
        $db = null;
        if($cont==1){
            echo '{"existe":"true"}';
        }else{
            echo '{"existe":"false"}';
        }
    }catch(PDOException $e){
        echo '{"error":{"text": '.$e->getMessage().'}';
    }
});

$app->get('/api/funcionario/{CPF}/{id}/', function (Request $request, Response $response) {
    $estabelecimento = $request->getAttribute('id');
    $funcionario = $request->getAttribute('CPF');
    $sql = "Select * from estabelecimentofuncionario where estabelecimento_id='$estabelecimento' and funcionario_id='$funcionario'";
    try{
        $db = new db();
        $db = $db->connect();
        $stmt = $db->query($sql);
        $cont = 0;
        while($row = $stmt->fetch()){
            $cont++;
        }
        $db = null;
        if($cont==1){
            echo '{"existe":"true"}';
        }else{
            echo '{"existe":"false"}';
        }
    }catch(PDOException $e){
        echo '{"error":{"text": '.$e->getMessage().'}';
    }
});

$app->get('/api/produto/{id}/{codigo}/', function (Request $request, Response $response) {
    $estabelecimento = $request->getAttribute('id');
    $produto = $request->getAttribute('codigo');
    $sql = "Select * from produto where estabelecimento_id='$estabelecimento' and codigo='$produto'";
    try{
        $db = new db();
        $db = $db->connect();
        $stmt = $db->query($sql);
        $cont = 0;
        while($row = $stmt->fetch()){
            $cont++;
        }
        $db = null;
        if($cont==1){
            echo '{"existe":"true"}';
        }else{
            echo '{"existe":"false"}';
        }
    }catch(PDOException $e){
        echo '{"error":{"text": '.$e->getMessage().'}';
    }
});

$app->get('/api/localaves/{id}/{codigo}/', function (Request $request, Response $response) {
    $estabelecimento = $request->getAttribute('id');
    $localaves = $request->getAttribute('codigo');
    $sql = "Select * from localaves where estabelecimento_id='$estabelecimento' and codigo='$localaves'";
    try{
        $db = new db();
        $db = $db->connect();
        $stmt = $db->query($sql);
        $cont = 0;
        while($row = $stmt->fetch()){
            $cont++;
        }
        $db = null;
        if($cont==1){
            echo '{"existe":"true"}';
        }else{
            echo '{"existe":"false"}';
        }
    }catch(PDOException $e){
        echo '{"error":{"text": '.$e->getMessage().'}';
    }
});

$app->get('/api/vacina/{id}/{codigo}/', function (Request $request, Response $response) {
    $estabelecimento = $request->getAttribute('id');
    $vacina = $request->getAttribute('codigo');
    $sql = "Select * from localaves where estabelecimento_id='$estabelecimento' and codigo='$vacina'";
    try{
        $db = new db();
        $db = $db->connect();
        $stmt = $db->query($sql);
        $cont = 0;
        while($row = $stmt->fetch()){
            $cont++;
        }
        $db = null;
        if($cont==1){
            echo '{"existe":"true"}';
        }else{
            echo '{"existe":"false"}';
        }
    }catch(PDOException $e){
        echo '{"error":{"text": '.$e->getMessage().'}';
    }
});

// Catch-all route to serve a 404 Not Found page if none of the routes match
// NOTE: make sure this route is defined last
$app->map(['GET', 'POST', 'PUT', 'DELETE', 'PATCH'], '/{routes:.+}', function($req, $res) {
    $handler = $this->notFoundHandler; // handle using the default Slim page not found handler
    return $handler($req, $res);
});

$app->run();