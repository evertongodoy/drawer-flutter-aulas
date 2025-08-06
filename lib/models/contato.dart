class Contato {

  final String pessoa;
  final String telefone;
  // Construtor da classe Contato
  Contato(
    {
      required this.pessoa, 
      required this.telefone
    }
  );
  // Converter um objeto Contato em um mapa (JSON)
  factory Contato.fromJson(Map<String, dynamic> json) {
    return Contato(
      pessoa: json['pessoa'],
      telefone: json['telefone'],
    );
  }
  // Converter um mapa (JSON) em um objeto Contato
  Map<String, dynamic> toJson() {
    return {
      'pessoa': pessoa,
      'telefone': telefone,
    };
  }

}