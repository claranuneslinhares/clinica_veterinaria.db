CREATE DATABASE dbclinica_vet;
USE dbclinica_vet;
-- TABELA: Especies
CREATE TABLE dbclinica_vet.especies (
id_especie INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL UNIQUE
);
-- TABELA: Racas
CREATE TABLE dbclinica_vet.racas (
id_raca INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(60) NOT NULL,
id_especie INT NOT NULL,
FOREIGN KEY (id_especie) REFERENCES especies(id_especie)
);
-- TABELA: Clientes (Tutores)
CREATE TABLE dbclinica_vet.clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
telefone VARCHAR(20),
endereco VARCHAR(150)
);
-- TABELA: Animais (Pacientes)
CREATE TABLE dbclinica_vet.animais (
id_animal INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
data_nascimento DATE,
sexo CHAR(1),
peso DECIMAL(5,2),
id_cliente INT NOT NULL,
id_raca INT NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_raca) REFERENCES racas(id_raca)
);
-- TABELA: Veterinarios
CREATE TABLE dbclinica_vet.veterinarios (
id_veterinario INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
crmv VARCHAR(20) NOT NULL UNIQUE,
especialidade VARCHAR(60)
);
-- TABELA: Atendimentos
CREATE TABLE dbclinica_vet.atendimentos (
id_atendimento INT AUTO_INCREMENT PRIMARY KEY,
data_atendimento DATE NOT NULL,
hora_atendimento TIME NOT NULL,
motivo VARCHAR(150),
peso_dia DECIMAL(5,2),
id_animal INT NOT NULL,
id_veterinario INT NOT NULL,
FOREIGN KEY (id_animal) REFERENCES animais(id_animal),
FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id_veterinario)
);
-- TABELA: Servicos
CREATE TABLE dbclinica_vet.servicos (
id_servico INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
preco DECIMAL(8,2) NOT NULL
);
-- TABELA: Medicamentos
CREATE TABLE dbclinica_vet.medicamentos (
id_medicamento INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
descricao VARCHAR(150)
);
-- TABELA: Prescricoes (N:M)
CREATE TABLE dbclinica_vet.prescricoes (
id_atendimento INT NOT NULL,
id_medicamento INT NOT NULL,
instrucoes_uso VARCHAR(200),
PRIMARY KEY (id_atendimento, id_medicamento),
FOREIGN KEY (id_atendimento) REFERENCES atendimentos(id_atendimento),
FOREIGN KEY (id_medicamento) REFERENCES medicamentos(id_medicamento)
);
CREATE TABLE dbclinica_vet.atendimento_servicos (
id_atendimento INT NOT NULL,
id_servico INT NOT NULL,
quantidade INT DEFAULT 1,
valor_unitario DECIMAL(8,2) NOT NULL,
PRIMARY KEY (id_atendimento, id_servico),
FOREIGN KEY (id_atendimento) REFERENCES atendimentos(id_atendimento),
FOREIGN KEY (id_servico) REFERENCES servicos(id_servico)
);