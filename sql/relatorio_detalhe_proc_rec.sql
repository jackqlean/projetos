SELECT p.cod , u.name AS usuario_rec , s.setor AS setor_dst , DATE_FORMAT(e.data_rec,'%d/%m/%Y') AS data_rec , e.horas_rec AS horas_rec FROM proc p, setor s, users u, encaminhamento e 
WHERE e.user_rec = u.id AND e.cod_stdst = s.cod_setor AND e.cod_prenc = p.cod AND p.cod ='59';