create or replace view cli_vw_home_nf as

SELECT 
REP.AGN_TAB_IN_CODIGO AS rep_in_codigo,
REP.AGN_ST_FANTASIA AS rep_st_fantasia,
NF.NOT_DT_EMISSAO AS not_dt_emissao,
AGN.AGN_ST_FANTASIA AS agn_st_fantasia,
CONCAT(CONCAT(NF.NOT_IN_NUMERO,'/'),ITNNF.ITN_IN_SEQUENCIA) AS not_nf_serie,
COND.COND_ST_CODIGO AS cond_st_codigo,
PRO.PRO_ST_ALTERNATIVO AS pro_st_alternativo,

CONCAT(CONCAT(AGN.UF_ST_SIGLA,'/'),UPPER(AGN.AGN_ST_MUNICIPIO)) AS agn_st_muniuf,

PRO.PRO_ST_DESCRICAO AS pro_st_descricao,
ITNNF.ITN_RE_QUANTIDADE AS itn_re_quantidade,
ITNNF.ITN_RE_VALORUNITARIO AS itn_re_valorunitario,
ITNNF.ITN_RE_VALORMERCADORIA AS itn_re_valormercadoria,
ITNNF.ITN_RE_VALORTOTAL AS nf_re_valortotal


FROM MGVEN.VEN_ITEMNOTAFISCAL ITNNF, MGADM.EST_PRODUTOS PRO, 
MGGLO.GLO_CONDPAGTO COND, MGTRF.TRF_CFOP CFOP, 
MGVEN.VEN_NOTAFISCAL NF, MGGLO.GLO_AGENTES AGN, MGGLO.GLO_AGENTES REP

WHERE ITNNF.PRO_TAB_IN_CODIGO = PRO.PRO_TAB_IN_CODIGO
AND   ITNNF.PRO_PAD_IN_CODIGO = PRO.PRO_PAD_IN_CODIGO
AND       ITNNF.PRO_IN_CODIGO = PRO.PRO_IN_CODIGO

AND ITNNF.COND_PAD_IN_CODIGO = COND.COND_PAD_IN_CODIGO
AND ITNNF.COND_TAB_IN_CODIGO = COND.COND_TAB_IN_CODIGO
AND ITNNF.COND_ST_CODIGO     = COND.COND_ST_CODIGO

AND ITNNF.CFOP_TAB_IN_CODIGO = CFOP.CFOP_TAB_IN_CODIGO
AND ITNNF.CFOP_PAD_IN_CODIGO = CFOP.CFOP_PAD_IN_CODIGO
AND ITNNF.CFOP_IN_CODIGO     = CFOP.CFOP_IN_CODIGO

AND ITNNF.ORG_TAB_IN_CODIGO = NF.ORG_TAB_IN_CODIGO
AND ITNNF.ORG_PAD_IN_CODIGO = NF.ORG_PAD_IN_CODIGO
AND ITNNF.ORG_IN_CODIGO     = NF.ORG_IN_CODIGO
AND ITNNF.SEQ_TAB_IN_CODIGO = NF.SEQ_TAB_IN_CODIGO
AND ITNNF.SEQ_IN_CODIGO     = NF.SEQ_IN_CODIGO
AND ITNNF.NOT_IN_CODIGO     = NF.NOT_IN_CODIGO

AND NF.AGN_TAB_IN_CODIGO = AGN.AGN_TAB_IN_CODIGO
AND NF.AGN_PAD_IN_CODIGO = AGN.AGN_PAD_IN_CODIGO
AND NF.AGN_IN_CODIGO     = AGN.AGN_IN_CODIGO

AND NF.REP_TAB_IN_CODIGO = REP.AGN_TAB_IN_CODIGO
AND NF.REP_PAD_IN_CODIGO = REP.AGN_PAD_IN_CODIGO
AND NF.REP_IN_CODIGO     = REP.AGN_IN_CODIGO

AND NF.NOT_DT_EMISSAO > '01-JAN-2018'
