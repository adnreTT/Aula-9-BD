-- Criação das tabelas
CREATE TABLE departamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    orcamento DECIMAL(10,2)
);

CREATE TABLE funcionarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2),
    departamento_id INT,
    data_contratacao DATE,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    data_cadastro DATE
);

CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2),
    estoque INT,
    categoria VARCHAR(50)
);

CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    funcionario_id INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);

CREATE TABLE itens_pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);


INSERT INTO departamentos (nome, orcamento) VALUES 
('Vendas', 500000.00),
('Marketing', 300000.00),
('TI', 450000.00),
('RH', 250000.00),
('Financeiro', 400000.00);


INSERT INTO funcionarios (nome, salario, departamento_id, data_contratacao) VALUES 
('Ana Souza', 3500.00, 1, '2020-05-15'),
('Carlos Mendes', 4200.00, 3, '2019-03-10'),
('Mariana Oliveira', 2800.00, 1, '2021-11-20'),
('Pedro Alves', 5100.00, 5, '2018-07-05'),
('Juliana Costa', 3900.00, 2, '2020-09-12'),
('Ricardo Lima', 3200.00, 4, '2022-01-30'),
('Fernanda Santos', 4500.00, 3, '2019-08-22'),
('Lucas Pereira', 2900.00, 1, '2023-02-18');


INSERT INTO clientes (nome, email, telefone, data_cadastro) VALUES 
('João Silva', 'joao.silva@gmail.com', '(11) 9999-8888', '2023-01-15'),
('Maria Oliveira', 'maria.oliveira@gmail.com', '(19) 7777-6666', '2022-05-20'),
('Carlos Pereira', 'carlos.pereira@gmail.com', '(11) 5555-4444', '2023-03-10'),
('Ana Costa', 'ana.costa@gmail.com', '(19) 3333-2222', '2024-02-05'),
('Paulo Santos', 'paulo.santos@gmail.com', '(11) 1111-0000', '2022-11-30');


INSERT INTO produtos (nome, preco, estoque, categoria) VALUES 
('Notebook Elite', 3500.00, 15, 'Eletrônicos'),
('Smartphone Pro', 2200.00, 25, 'Eletrônicos'),
('Mesa Executiva', 850.00, 8, 'Móveis'),
('Cadeira Ergonômica', 650.00, 12, 'Móveis'),
('Monitor 24"', 950.00, 10, 'Eletrônicos'),
('Teclado Sem Fio', 120.00, 30, 'Acessórios'),
('Mouse Gamer', 150.00, 20, 'Acessórios'),
('Impressora Laser', 750.00, 5, 'Eletrônicos'),
('Headphone Premium', 350.00, 18, 'Acessórios'),
('Webcam HD', 180.00, 15, 'Acessórios');


INSERT INTO pedidos (cliente_id, funcionario_id, data_pedido, valor_total) VALUES 
(1, 1, '2024-01-10', 3500.00),
(2, 3, '2024-02-15', 2200.00),
(3, 1, '2024-03-05', 1600.00),
(4, 5, '2024-01-20', 950.00),
(1, 3, '2024-02-28', 180.00),
(5, 1, '2024-03-10', 750.00),
(2, 5, '2024-01-05', 350.00),
(3, 3, '2024-02-10', 120.00),
(4, 1, '2024-03-15', 650.00),
(5, 5, '2023-12-20', 2200.00);


INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES 
(1, 1, 1, 3500.00),
(2, 2, 1, 2200.00),
(3, 5, 1, 950.00),
(3, 7, 1, 150.00),
(3, 6, 1, 120.00),
(3, 10, 1, 180.00),
(4, 5, 1, 950.00),
(5, 10, 1, 180.00),
(6, 8, 1, 750.00),
(7, 9, 1, 350.00),
(8, 6, 1, 120.00),
(9, 4, 1, 650.00),
(10, 2, 1, 2200.00);