class DtoCategoria{
    final dynamic id;
    final String nome;
    final String desc;

    DtoCategoria({
      this.id,
      required this.nome,
      required this.desc
    });

    @override
    String toString() {
      return '''
        $id
        $nome
        $desc
      ''';
    }
}