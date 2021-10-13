insert into mgven.ven_usutipodoc (TPD_TAB_IN_CODIGO,TPD_PAD_IN_CODIGO,TPD_IN_CODIGO,TDU_BO_APROVADOR,USU_IN_CODIGO)
(select p.tpd_tab_in_codigo,p.tpd_pad_in_codigo,p.tpd_in_codigo,'S' AS TDU_BO_APROVADOR,&USUARIO_NOVO USU_IN_CODIGO from mgven.ven_usutipodoc p
where p.usu_in_codigo = &USUARIO_ORIGEM
and p.tpd_in_codigo not in (select o.tpd_in_codigo from mgven.ven_usutipodoc o where o.usu_in_codigo = &USUARIO_NOVO)) --joao
