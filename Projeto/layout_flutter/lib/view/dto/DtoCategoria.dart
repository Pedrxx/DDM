class DtoCategoria{
    final dynamic id;
    final String nome;
    final String desc;
    final String prioridade;

    DtoCategoria({
      this.id,
      required this.nome,
      required this.desc,
      required this.prioridade
    });

    @override
    String toString() {
      return '''
        $id
        $nome
        $desc
        $prioridade
      ''';
    }
}