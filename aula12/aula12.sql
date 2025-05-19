USE clinica_medica;
-- EXERCICIOS 

SELECT pacientes.nome as "pacientes", SUM(medicamentos.preco) as "Gastos com Medicamentos" FROM pacientes JOIN historicomedico
ON pacientes.id = historicomedico.paciente_id JOIN prescricoes 
ON historicomedico.id = prescricoes.historico_medico_id JOIN medicamentos
ON medicamentos.id = prescricoes.medicamento_id
GROUP BY pacientes.nome;

-- MOSTRAR O TOTAL DE PRESCRIÇÕES POR PACIENTE --

SELECT pacientes.nome, COUNT(prescricoes.id)
FROM pacientes JOIN hitoricomedico
ON pacientes.id = hitoricomedico.paciente_id JOIN prescricoes
ON historicomedico.id = prescricoes.historico_medico_id
GROUP BY pacientes.nome;

-- MOSTRAR OS MEDICAMENTOS DE CADA PRESCRIÇÃO--
SELECT prescricoes.id "Prescrição", medicamentos.nome "Medicamento"
FROM prescricoes JOIN medicamentos 
ON prescricoes.medicamento_id = medimentos.id;
