<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <title>Contador de Parentesis - Teste Buser</title>
    <meta charset="utf-8">
  </head>
  <body>
    <h1>Contador de Parentesis - Teste Buser</h1>
  </body>
  <script>

var text = prompt('Entre com os parentesis para Direita ou esquerda: ');

function contaParentesis(str){
  var copen = 0 ;
  var cclose = 0 ;
  for (i=0;i<=str.length;i++)
  {
    if ( str.substring(i-1,i)=="(")
    {
      copen ++;
    }
    else
    {
      if(str.substring(i-1,i)==")")
      {
        cclose ++;
      }
    }
  }
  str = cclose - copen;
  if (str<0)
  {
    str=str*-1
  }
  return str;
}
  document.write('Quantidade faltante: '+contaParentesis(text));
 
 </script>
</html>