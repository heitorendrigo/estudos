create or replace view cli_vw_movimentorel as 
--CRIADO POR HEITOR (CLIENTE) DIA31/03/2015 PARA O RELATORIO DE MOVIMENTOS

select USU.GRU_ST_NOME,           PRO.PRO_ST_ALTERNATIVO,  
       PRO.PRO_ST_DESCRICAO,      LOTMOV.MVL_RE_QUANTIDADE,
       MOV.MVT_ST_NUMDOC,         MOV.MVT_DT_MOVIMENTO,
       LOTMOV.MVT_DT_VALIDADE, LOTMOV.ALM_IN_CODIGO,
       LOTMOV.LOC_IN_CODIGO,   LOTMOV.MVL_ST_LOTEFORNE,
       PRO.UNIP_ST_UNIDADE, PRO.PRO_IN_CODIGO,
       
       
       nvl((Select 'SAIDA' from MGADM.EST_MOVIMENTO M
       where M.MVT_ST_ENTRSAIDA = 'SD'
       AND MOV.MVT_IN_LANCAM = M.MVT_IN_LANCAM  ),'ENTRADA') as TP_MV
      
  from MGADM.EST_MOVIMENTO MOV,
       MGADM.EST_PRODUTOS PRO,
       MGGLO.GLO_GRUPO_USUARIO USU,
       MGADM.EST_LOTESMOVIMENTO LOTMOV

 where MOV.usu_in_inclusao = USU.gru_in_codigo
       and MOV.pro_in_codigo = PRO.pro_in_codigo
       and MOV.pro_pad_in_codigo = PRO.pro_pad_in_codigo
       and MOV.pro_tab_in_codigo = PRO.pro_tab_in_codigo
       AND MOV.MVT_IN_LANCAM     = LOTMOV.MVT_IN_LANCAM
