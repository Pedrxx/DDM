//comando para criar tabela
const criarContato = '''
 CREATE TABLE contato(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,email VARCHAR(150) NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL 
  )
''';
//array de inserções
const insercoesContato = [
  '''
INSERT INTO contato (nome, telefone, email, url_avatar)
VALUES ('Pedro','(44) 9 9874-5656','pedro@email.com','https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png')
'''
];
