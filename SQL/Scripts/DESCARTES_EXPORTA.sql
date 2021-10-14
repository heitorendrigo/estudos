SELECT 
SAIDA.MVT_ST_NUMDOC AS DOCUMENTO, 
SAIDA.PRO_IN_CODIGO AS COD_PROD,
PRO.PRO_ST_DESCRICAO AS DESC_PROD,
SAIDA.ALM_IN_CODIGO AS ALM_SAIDA, 
SAIDA.LOC_IN_CODIGO AS LOC_SAIDA, 
ENTRADA.ALM_IN_CODIGO AS ALM_ENTR, 
ENTRADA.LOC_IN_CODIGO AS LOC_ENTR,
SAIDA.MVT_DT_DOCUMENTO AS "DATA",

LOT.MVL_ST_LOTEFORNE AS LOTE,
LOT.MVT_DT_VALIDADE AS VALIDADE,
LOT.MVL_RE_QUANTIDADE AS QTDE,
custo.VR_UNIT_CUSTOCONTABIL VALOR_UNIT,
(custo.VR_UNIT_CUSTOCONTABIL*LOT.MVL_RE_QUANTIDADE) VALOR_TOTAL



FROM MGADM.EST_MOVIMENTO SAIDA, MGADM.EST_MOVIMENTO ENTRADA, MGADM.EST_PRODUTOS PRO, MGADM.EST_LOTESMOVIMENTO LOT,
mgcli.cli_vw_tbbvrunit_ccontabil custo

WHERE SAIDA.MVT_ST_ENTRSAIDA = 'SD'
AND ENTRADA.MVT_ST_ENTRSAIDA = 'ED'
AND SAIDA.PRO_IN_CODIGO = ENTRADA.PRO_IN_CODIGO
AND SAIDA.MVT_ST_NUMDOC = ENTRADA.MVT_ST_NUMDOC
AND SAIDA.MVT_DT_DOCUMENTO = ENTRADA.MVT_DT_DOCUMENTO
AND PRO.PRO_IN_CODIGO = ENTRADA.PRO_IN_CODIGO
AND LOT.MVT_IN_LANCAM = ENTRADA.MVT_IN_LANCAM
and custo.PRO_IN_CODIGO = pro.pro_in_codigo



AND SAIDA.ALM_IN_CODIGO = 4
AND SAIDA.LOC_IN_CODIGO = 4
AND ENTRADA.ALM_IN_CODIGO = 997
AND ENTRADA.LOC_IN_CODIGO = 4


group by
SAIDA.MVT_ST_NUMDOC, 
SAIDA.PRO_IN_CODIGO,
PRO.PRO_ST_DESCRICAO,
SAIDA.ALM_IN_CODIGO, 
SAIDA.LOC_IN_CODIGO, 
ENTRADA.ALM_IN_CODIGO , 
ENTRADA.LOC_IN_CODIGO,
SAIDA.MVT_DT_DOCUMENTO,

LOT.MVL_ST_LOTEFORNE ,
LOT.MVT_DT_VALIDADE,
LOT.MVL_RE_QUANTIDADE,
custo.VR_UNIT_CUSTOCONTABIL,
(custo.VR_UNIT_CUSTOCONTABIL*LOT.MVL_RE_QUANTIDADE) 