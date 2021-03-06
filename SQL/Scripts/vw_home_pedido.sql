CREATE OR REPLACE VIEW CLI_VW_HOME_PEDIDOS AS

select 

REP.AGN_IN_CODIGO AS rep_in_codigo,  
PROG.IPE_DT_DATAENTREGA AS ipe_dt_dataentrega,
AGN.AGN_IN_CODIGO AS agn_st_fantasia,
CONCAT(CONCAT(PED.PED_IN_CODIGO,' / '),ITNPED.ITP_IN_SEQUENCIA) AS ped_st_pedidoitem,

COND.COND_ST_CODIGO AS cond_st_codigo,
PRO.PRO_ST_ALTERNATIVO AS pro_st_alternativo,
PRO.PRO_ST_DESCRICAO AS pro_st_descricao,
(ITNPED.ITP_RE_QUANTIDADE - PROG.IPE_RE_QTDEFATURADA) AS pro_re_quantidade,
ITNPED.ITP_RE_VALORUNITARIO AS pro_re_vlunitario,
PED.PED_RE_VLMERCADORIA AS ped_re_vlmercadoria,
PED.PED_RE_VALORTOTAL AS ped_re_total

from 
mgven.ven_pedprogentrega PROG, MGVEN.VEN_ITEMPEDIDOVENDA ITNPED, 
MGVEN.VEN_PEDIDOVENDA PED, MGGLO.GLO_CONDPAGTO COND, MGADM.EST_PRODUTOS PRO,
MGGLO.GLO_AGENTES AGN, MGGLO.GLO_AGENTES REP

WHERE PROG.ORG_TAB_IN_CODIGO = ITNPED.ORG_TAB_IN_CODIGO
AND PROG.ORG_PAD_IN_CODIGO   = ITNPED.ORG_PAD_IN_CODIGO
AND PROG.ORG_IN_CODIGO       = ITNPED.ORG_IN_CODIGO
AND PROG.ORG_TAU_ST_CODIGO   = ITNPED.ORG_TAU_ST_CODIGO
AND PROG.PED_IN_CODIGO       = ITNPED.PED_IN_CODIGO
AND PROG.ITP_IN_SEQUENCIA    = ITNPED.ITP_IN_SEQUENCIA

AND ITNPED.ORG_TAB_IN_CODIGO = PED.ORG_TAB_IN_CODIGO
AND ITNPED.ORG_PAD_IN_CODIGO = PED.ORG_PAD_IN_CODIGO
AND ITNPED.ORG_IN_CODIGO     = PED.ORG_IN_CODIGO
AND ITNPED.ORG_TAU_ST_CODIGO = PED.ORG_TAU_ST_CODIGO
AND ITNPED.PED_IN_CODIGO     = PED.PED_IN_CODIGO

AND PED.CLI_TAB_IN_CODIGO = AGN.AGN_TAB_IN_CODIGO
AND PED.CLI_PAD_IN_CODIGO = AGN.AGN_PAD_IN_CODIGO
AND PED.CLI_IN_CODIGO     = AGN.AGN_IN_CODIGO

AND PED.REP_TAB_IN_CODIGO = REP.AGN_TAB_IN_CODIGO
AND PED.REP_PAD_IN_CODIGO = REP.AGN_PAD_IN_CODIGO
AND PED.REP_IN_CODIGO     = REP.AGN_IN_CODIGO

AND ITNPED.COND_TAB_IN_CODIGO = COND.COND_TAB_IN_CODIGO
AND ITNPED.COND_PAD_IN_CODIGO = COND.COND_PAD_IN_CODIGO
AND ITNPED.COND_ST_CODIGO     = COND.COND_ST_CODIGO

AND ITNPED.PRO_TAB_IN_CODIGO = PRO.PRO_TAB_IN_CODIGO
AND ITNPED.PRO_PAD_IN_CODIGO = PRO.PRO_PAD_IN_CODIGO
AND ITNPED.PRO_IN_CODIGO     = PRO.PRO_IN_CODIGO

AND PED.PED_DT_EMISSAO > '01-JAN-2018'

