const criaTabelas = '''
 CREATE TABLE ticket(
    id INTEGER NOT NULL PRIMARY KEY
    ,titulo VARCHAR(50) NOT NULL
    ,descrição VARCHAR(200) NOT NULL
    ,categoria VARCHAR(50) NOT NULL
    ,tipo VARCHAR(50) NOT NULL
    ,urgencia VARCHAR(50) NOT NULL 
    ,status VARCHAR(50) NOT NULL
    ,idUser INTEGER NOT NULL
  );

CREATE TABLE usuario (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    cargo VARCHAR(100),
    setor VARCHAR(100),
    senha VARCHAR(255),
    acesso VARCHAR(255)
);

''';

const insercoesTabelas = [
'''
INSERT INTO ticket (id, titulo, descrição, categoria, tipo, urgencia, status, idUser)
VALUES (1, 'Problema de rede', 'Os computadores não estão conectados à rede', 'Infra', 'Incidente', 'Alta','Novo',2);
''',
'''
INSERT INTO ticket (id, titulo, descrição, categoria, tipo, urgencia, status, idUser)
VALUES (2, 'Solicitação de software', 'Necessito do software de Protheus', 'Protheus', 'Pedido', 'Média','Novo',2);

''',
'''
INSERT INTO ticket (titulo, descrição, categoria, tipo, urgencia, status, idUser)
VALUES ('Erro no envio de email','O serviço de emails do protheus não esta funcionando','Protheus','Acidente','Alta','Novo',2)
''',
'''
INSERT INTO usuario (id, nome, email, cargo, setor, senha, acesso)
VALUES ('João', 'joao@email.com', 'Gerente', 'Administração', 'senha123', 'Admin');
''',
'''
INSERT INTO usuario (id, nome, email, cargo, setor, senha, acesso)
VALUES ('Maria', 'maria@email.com', 'Analista', 'TI', 'senha456', 'User');
'''
];
