use clinica_medica;
show tables;
desc pacientes;
select * from pacientes;
select * from medicos;
select * from agendamentos;
-- LISTA OS PACIENTES NASCIDOS DEPOIS DE 01/01/1990
select nome,data_nascimento,telefone from pacientes 
where data_nascimento >"1990-01-01";

-- LISAR PARA CADA CONSULTA, O NOME DO PACIENTE,DATA E TIPO.
SELECT pacientes.nome, agendamentos.data_hora, agendamentos.tipo_consulta
from pacientes left join agendamentos on pacientes.id = agendamentos.paciente_id;

SELECT medicos.nome, agendamentos.data_hora, agendamentos.tipo_consulta
from medicos left join agendamentos on medicos.id = agendamentos.medico_id;

-- LISTAR AS CONSUSLTAS INCLUINDO NOME DOS PACIENTES E DO MEDICO
select pacientes.nome, medicos.nome, agendamentos.data_hora, agendamentos.tipo_consulta from pacientes
 join agendamentos on pacientes.id = agendamentos.pacientes_id join medicos on medicos.id = agendamentos.medico_id;



