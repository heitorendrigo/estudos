
SELECT
  A.ORD_IN_CODIGO,
  F.PRO_TAB_IN_CODIGO,
  F.PRO_PAD_IN_CODIGO,
  F.PRO_IN_CODIGO,
  G.PRO_ST_DESCRICAO,
  L.MVL_ST_LOTEFORNED,
  A.COM_IN_CODIGO PRO_IN_SANIVEL1,
  A.MVL_ST_LOTEFORNED PRO_ST_LOTEFORNENIVEL1,
  B.PRO_ST_DESCRICAO PRO_ST_DESCSANIVEL1,
  H.COM_TAB_IN_CODIGO PRO_TAB_SANIVEL2,
  H.COM_PAD_IN_CODIGO PRO_PAD_SANIVEL2,
  H.COM_IN_CODIGO PRO_IN_SANIVEL2,
  I.PRO_ST_DESCRICAO PRO_ST_DESCSANIVEL2,
  H.MVL_ST_LOTEFORNED PRO_ST_LOTEFORNENIVEL2/* */,/* */


/* */
  M.COM_TAB_IN_CODIGO PRO_TAB_SANIVEL3,
  M.COM_PAD_IN_CODIGO PRO_PAD_SANIVEL3,
  M.COM_IN_CODIGO PRO_IN_SANIVEL3,
  N.PRO_ST_DESCRICAO PRO_ST_DESCSANIVEL3,
  M.MVL_ST_LOTEFORNED PRO_ST_LOTEFORNENIVEL3
/* */


FROM
  MGMAN.PRO_ESTMOVTOMANUF    A, -- Nivel 1 
  MGADM.EST_PRODUTOS         B, -- Nivel 1
  MGMAN.PRO_ORDENS           F, -- Nivel 1
  MGADM.EST_PRODUTOS         G, -- Nivel 1
  
  MGMAN.PRO_ESTMOVTOMANUF    H, -- Nivel 2
  MGADM.EST_PRODUTOS         I, -- Nivel 2
  MGMAN.PRO_ORDENS           J, -- Nivel 2
  MGMAN.PRO_ESTMOVTOMANUF    L/* */,/* */  -- Nivel 2


/* */
  MGMAN.PRO_ESTMOVTOMANUF    M, -- Nivel 3  
  MGADM.EST_PRODUTOS         N, -- Nivel 3  
  MGMAN.PRO_ORDENS           O, -- Nivel 3  
  MGMAN.PRO_ESTMOVTOMANUF    P  -- Nivel 3  
/* */


WHERE A.EMM_CH_TIPOMOV     ='M'

  AND A.COM_TAB_IN_CODIGO  =B.PRO_TAB_IN_CODIGO -- Nivel 1 
  AND A.COM_PAD_IN_CODIGO  =B.PRO_PAD_IN_CODIGO -- Nivel 1 
  AND A.COM_IN_CODIGO      =B.PRO_IN_CODIGO     -- Nivel 1 
  AND B.PRO_ST_DEFITEM     = 'CO'               -- Nivel 1 
  AND A.ORD_IN_CODIGO      = F.ORD_IN_CODIGO    -- Nivel 1 
  AND F.PRO_IN_CODIGO      = G.PRO_IN_CODIGO    -- Nivel 1 

  AND F.ORD_IN_CODIGO      = L.ORD_IN_CODIGO      -- LINK Nivel 1 COM Nivel 2 
  AND A.COM_IN_CODIGO      = J.PRO_IN_CODIGO      -- LINK Nivel 1 COM Nivel 2 
  AND L.MVL_ST_LOTEFORNED  = A.MVL_ST_LOTEFORNED  -- LINK Nivel 1 COM Nivel 2 
  AND A.MVL_ST_LOTEFORNED  = H.MVL_ST_LOTEFORNED  -- LINK Nivel 1 COM Nivel 2   

  AND J.ORD_IN_CODIGO      = H.ORD_IN_CODIGO     -- Nivel 2
  AND H.COM_IN_CODIGO      = I.PRO_IN_CODIGO     -- Nivel 2

/* */
  AND J.ORD_IN_CODIGO      = P.ORD_IN_CODIGO      -- LINK Nivel 2 COM Nivel 3
  AND H.COM_IN_CODIGO      = O.PRO_IN_CODIGO      -- LINK Nivel 2 COM Nivel 3
  AND P.MVL_ST_LOTEFORNED  = H.MVL_ST_LOTEFORNED  -- LINK Nivel 2 COM Nivel 3
  AND H.MVL_ST_LOTEFORNED  = M.MVL_ST_LOTEFORNED  -- LINK Nivel 2 COM Nivel 3
  
  AND O.ORD_IN_CODIGO      = M.ORD_IN_CODIGO     -- Nivel 3
  AND M.COM_IN_CODIGO      = N.PRO_IN_CODIGO     -- Nivel 3 
/* */
  
  AND B.PRO_IN_CODIGO = 1290  -- FILTRO PARA TESTES
  