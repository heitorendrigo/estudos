create or replace view mgcli.cli_vw_instrucoesdetrabalho as
SELECT
proc.tdq_st_codigo as TPD_ST_QUALIDADE,
PROC.pqua_st_definicao as DOC_IN_COD_GQ,
PROC.Pqua_St_Objetivo as DOC_ST_DESCRICAO,
TO_DATE(proc.PQUA_ST_IDENTIFICA) AS  DOC_DT_VENCIMENTO,
CC.ORF_IN_REDUZIDO AS RESP_IN_REDUZIDO,
CC.ORF_ST_DESCRICAO AS RESP_ST_NOME ,
proc.PQUA_IN_CODIGO AS COD_IN_PROC,
proc.pqua_st_arqnome as NOME_ST_ARQIVO,
PROC.PQUA_ST_ARQPATH AS CAMINHO_ST_ARQUIVO

FROM MGADM.EST_PROCQUALIDADE PROC, mgadm.est_destinoprocedimentos DEP, MGGLO.GLO_ORGANOFUNC cc

WHERE PROC.PQUA_ST_TIPO = 'A'
AND PROC.PAI_PQUA_IN_CODIGO in (7,8)
and proc.pqua_in_codigo = dep.pqua_in_codigo
and dep.orf_in_reduzido = cc.orf_in_reduzido

--VW CLIADA PELO CLIENTE HEITOR 17/09/2020 PARA CUSTOMIZA��O DO MODULO PARA CONTROLES DE DOCUMENTOS DE INSTRU��ES DE TRABALHO DO GQ.
--ERROS NESTA VIEW PODEM TER RELA��O � DATA DE VALIDADE DO DOCUMENTO INSERIDA NO CAMPO "ESPECIFICA��O TECNICA" SE O USUARIO NAO INSERIR
-- COM O FORMATO DD/MM/AAA.
