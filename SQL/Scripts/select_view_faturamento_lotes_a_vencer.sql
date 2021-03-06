select
        nf.rep_in_codigo  as COD_REP,
        REP.AGN_ST_NOME AS NOME_REP,
        nf.agn_in_codigo  as COD_CLI,
        AGN.AGN_ST_NOME AS NOME_CLI,
        ITNF.PRO_IN_CODIGO AS COD_PROD,
        itnf.itn_st_descricao as NOME_PROD,
        itnf.itn_re_quantidade as QUANTIDADE,
        itnf.itn_re_valorunitarioconv as  VLR_UNITARIO_VENDA,
        pro.uni_st_unidade as UNIDADE_MEDIDA,
        nf.not_re_valortotal as VALOR_TOTAL,
        nf.not_dt_emissao as DT_VENDA,
       -- NF.NOT_IN_numero  as NUMERO_NF,
        itnf.itn_re_valortotal as TOTAL_ITEM,
        itnf.itn_re_valorunitario as UNITARIO_ITEM,
         O.MVS_ST_LOTEFORNE,
         O.ALM_PAD_IN_CODIGO,
         O.MVS_RE_QUANTIDADE as QTD_LOTE
         

  from mgven.ven_notafiscal NF,
       mgven.ven_itemnotafiscal ITNF,
       mgglo.glo_agentes AGN,
       mgglo.glo_agentes REP,
       mgadm.est_produtos PRO,
       mgglo.glo_agentes_id id_agn,
       mgglo.glo_acao ACAO,
       MGADM.EST_MOVSUMARIZADO O


 where NF.agn_tab_in_codigo = AGN.agn_tab_in_codigo
       and NF.agn_pad_in_codigo = AGN.agn_pad_in_codigo
       and NF.agn_in_codigo = AGN.agn_in_codigo
       and NF.org_tab_in_codigo = ITNF.org_tab_in_codigo
       and NF.org_pad_in_codigo = ITNF.org_pad_in_codigo
       and NF.org_in_codigo = ITNF.org_in_codigo
       and NF.org_tau_st_codigo = ITNF.org_tau_st_codigo
       and NF.seq_tab_in_codigo = ITNF.seq_tab_in_codigo
       and NF.seq_in_codigo = ITNF.seq_in_codigo
       and NF.not_in_codigo = ITNF.not_in_codigo
       AND itnf.pro_in_codigo = pro.pro_in_codigo
       AND REP.AGN_IN_CODIGO = NF.REP_IN_CODIGO
       AND NF.AGN_IN_CODIGO = ID_AGN.AGN_IN_CODIGO
       AND NF.ACAO_IN_CODIGO = ACAO.ACAO_IN_CODIGO
       AND ACAO.ACAO_BO_CREC = 'S'
       AND ITNF.PRO_IN_CODIGO = O.PRO_IN_CODIGO
       
          
   AND O.ORG_TAB_IN_CODIGO = 53
     AND O.ORG_PAD_IN_CODIGO = 1
     AND O.ORG_IN_CODIGO     = 2
     AND O.ORG_TAU_ST_CODIGO = 'G'
     AND O.FIL_IN_CODIGO     = 3
     AND O.PRO_TAB_IN_CODIGO = 100
     AND O.PRO_PAD_IN_CODIGO = 1
     AND O.ALM_IN_CODIGO     = 4
  


and   nf.not_dt_emissao  =  (select  max(cond_nf.not_dt_emissao) from mgven.ven_notafiscal cond_nf
                                   where cond_nf.agn_in_codigo = nf.agn_in_codigo
                                   /* AND COND_NF.NOT_DT_EMISSAO >= ADD_MONTHS(LAST_DAY(SYSDATE),-3)+1*/)


       and nf.not_ch_situacao <> 'C'
      and pro.pro_in_codigo not in (select ina.pro_in_codigo from mgadm.est_inativaproduto INA
                                           where pro.pro_in_codigo = ina.pro_in_codigo)




   AND id_agn.agn_tau_st_codigo = 'C'
   and id_agn.agn_ch_status = 'A'


   GROUP BY ITNF.PRO_IN_CODIGO, nf.rep_in_codigo,REP.AGN_ST_NOME,nf.agn_in_codigo, AGN.AGN_ST_NOME,itnf.itn_st_descricao,itnf.itn_re_quantidade,itnf.itn_re_valorunitarioconv,pro.uni_st_unidade,nf.not_re_valortotal,nf.not_dt_emissao,itnf.itn_re_valortotal,itnf.itn_re_valorunitario,O.MVS_ST_LOTEFORNE,O.ALM_PAD_IN_CODIGO,O.MVS_RE_QUANTIDADE,O.pro_in_codigo 

