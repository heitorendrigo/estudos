SELECT * FROM 

(SELECT
LG.ACAOM_ST_DOCUMENTO AS DOCUMENTO,
CLI.AGN_ST_FANTASIA AS CLIENTE,
LG.ACAOM_DT_DATAEMISSAO AS EMISSAO,
USU_IN.GRU_ST_NOME AS USUARIO_INCLUSAO,
LG.ACAOM_DT_INCLUSAO AS INCLUS�O,
USU_AL.GRU_ST_NOME AS USUARIO_ALTERACAO,
LG.ACAOM_DT_ALTERACAO AS ALTERACAO,
PED.PED_RE_VALORTOTAL AS VALOR_PEDIDO

FROM MGGLO.GLO_ACAOMOVIMENTO LG, MGGLO.GLO_GRUPO_USUARIO USU_AL, 
MGGLO.GLO_GRUPO_USUARIO USU_IN,  MGGLO.GLO_ACAO ACAO, 
MGVEN.VEN_PEDIDOVENDA PED, MGGLO.GLO_AGENTES CLI, MGGLO.GLO_AGENTES REP

WHERE LG.USU_IN_ALTERACAO = USU_AL.GRU_IN_CODIGO
AND LG.USU_IN_INCLUSAO = USU_IN.GRU_IN_CODIGO
AND LG.ACAO_IN_CODIGO = ACAO.ACAO_IN_CODIGO
AND PED.CLI_IN_CODIGO = CLI.AGN_IN_CODIGO
AND PED.REP_IN_CODIGO = REP.AGN_IN_CODIGO

--AND PED.REP_IN_CODIGO = 227   -- PEDIDOS DO MILTON
AND LG.ACAOM_ST_DOCUMENTO = TO_CHAR(PED.PED_IN_CODIGO) -- DOCUMENTO TENHA NA TABELA DE PEDIDOS
and ped.tpd_in_codigo in (1,2)

AND LG.ACAOM_DT_EXCLUSAO IS NULL  -- NAO TENHA DATA DE EXCLUS�O

AND LG.ACAOM_DT_ALTERACAO >= '22-JUN-2020' -- ALTERA��O ENTRE ONTEM E HOJE
and LG.ACAOM_DT_ALTERACAO < '23-JUN-2020' -- ALTERA��O ENTRE ONTEM E HOJE

AND LG.ACAOM_DT_ALTERACAO <> LG.ACAOM_DT_INCLUSAO --apenas altera��es de pedidos ja colocados.


)
GROUP BY  DOCUMENTO,
CLIENTE,
EMISSAO,
USUARIO_INCLUSAO,
INCLUS�O,
USUARIO_ALTERACAO,
ALTERACAO,
VALOR_PEDIDO 
 