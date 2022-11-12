class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song(this.title, this.description, this.url, this.coverUrl);

  static List<Song> songs = [
    Song(
      'Gostosinha é ela',
      'É na pegada do Vianna',
      'assets/music/na_pegada_do_viana.mp3',
      'assets/images/na_pegada_do_viana.webp',
    ),
    Song(
      'Dois Rivais',
      'péricles feito pra durar',
      'assets/music/dois_rivais_pericles.mp3',
      'assets/images/pericles.jpg',
    ),
    Song(
      'Melhor eu ir',
      'péricles feito pra durar',
      'assets/music/melhor_eu_ir.mp3',
      'assets/images/melhor_eu_ir.jpg',
    ),
    Song(
      'Ela não vai voltar',
      'Ao vivo em Fortaleza',
      'assets/music/ela_nao_vai_voltar_joao_gomes.mp3',
      'assets/images/ela_nao_vai_voltar_joao_gomes.jpg',
    ),
  ];
}
