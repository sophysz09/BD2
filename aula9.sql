use cadastro;
-- Sublinguagem DDL
show tables;
desc curso;
desc estudante;
desc estudantecursa;

-- DQL - comandos de consulta
select * from curso;
select nome,descricao from curso;
select nome, descricao from curso where nome like "S%";
select count(nome) from estudante;

-- Consulta envolvendo duas ou mais tabelas
select estudante.nome, curso.nome from estudante left join
estudantecursa on estudante.id = estudantecursa.idestudante 
join curso on estudantecursa.idcurso = curso.idcurso;

select estudante.nome, curso.nome from estudante right join
estudantecursa on estudante.id = estudantecursa.idestudante 
join curso on estudantecursa.idcurso = curso.idcurso;
