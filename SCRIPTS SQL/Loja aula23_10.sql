SELECT sobrenome, id_departamento, salario
FROM tb_empregado
WHERE (salario, id_departamento) IN (SELECT salario, id_departamento
                                        FROM tb_empregado
                                        WHERE percentual_comissao IS NOT NULL);
                                        
SELECT e.sobrenome, d.nm_departamento, e.salario
FROM tb_empregado e JOIN tb_departamento d USING(id_departamento)
WHERE (e.salario, NVL(e.percentual_comissao, 0)) IN (SELECT  e.salario, NVL(e.percentual_comissao, 0)
                                            FROM tb_empregado e JOIN tb_departamento d USING(id_departamento)
                                            WHERE id_localizacao = 1700);
                                            
SELECT sobrenome, salario
FROM tb_empregado
WHERE sobrenome NOT LIKE 'Kochhar' AND(salario, NVL(percentual_comissao, 0)) IN (SELECT salario, NVL(percentual_comissao,0)
                                        FROM tb_empregado 
                                        WHERE sobrenome LIKE 'Kochhar');
                                        
SELECT e.id_empregado, e.sobrenome, e.id_departamento
FROM tb_empregado e JOIN tb_departamento d USING(id_departamento)
JOIN tb_localizacao l USING (id_localizacao)
WHERE l.cidade IN (SELECT cidade
                FROM tb_localizacao
                WHERE cidade LIKE 'T%');
                
SELECT id_empregado, sobrenome, id_departamento
FROM tb_empregado
WHERE id_departamento IN
                        (SELECT id_departamento
                        FROM tb_departamento
                        WHERE id_localizacao IN
                                            (SELECT cidade
                                            FROM tb_localizacao
                                            WHERE cidade LIKE 'T%'));
                                            
SELECT sobrenome, id_funcao, salario
FROM tb_empregado
WHERE salario > ALL (SELECT salario
                    FROM tb_empregado
                    WHERE id_funcao LIKE 'SA_MAN')
ORDER BY 3 DESC;