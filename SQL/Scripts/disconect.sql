select p.usu_dt_logout,p.usu_dt_ultacesso,g.gru_st_nome,p.sis_in_codigo,p.usu_st_enderecoip,p.usu_in_codigo, p.rowid from mgglo.glo_logacessosistema p, mgglo.glo_grupo_usuario g
where p.usu_in_codigo = g.gru_in_codigo
and p.usu_dt_login <> '05-out-2015'
and p.sis_in_codigo = 1
and p.usu_dt_logout is null


