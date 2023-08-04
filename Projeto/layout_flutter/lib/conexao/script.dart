const criarTicket = '''
 CREATE TABLE ticket(
    id INTEGER NOT NULL PRIMARY KEY
    ,titulo VARCHAR(50) NOT NULL
    ,descrição VARCHAR(200) NOT NULL
    ,categoria VARCHAR(50) NOT NULL
    ,tipo VARCHAR(50) NOT NULL
    ,urgencia VARCHAR(50) NOT NULL 
  )
''';

const insercoesTicket = [
'''
INSERT INTO ticket (titulo, descrição, categoria, tipo, urgencia)
VALUES ('Erro no envio de email','O serviço de emails do protheus não esta funcionando','Protheus','Acidente','Alta')
'''
];
