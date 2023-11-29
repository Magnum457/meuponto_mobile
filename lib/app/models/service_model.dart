class ServiceModel {
  String descricao;
  String icon;
  String? link;
  bool? emBreve;

  ServiceModel({
    required this.descricao,
    required this.icon,
    this.link,
    this.emBreve,
  });

  @override
  String toString() {
    return 'ServiceModel{descricao: $descricao, icon: $icon}';
  }

  static List<ServiceModel> getServiceModels() {
    return [
      ServiceModel(
        descricao: 'Bater Ponto',
        icon: 'fileDocumentCheckOutline',
        link: '/time_record/',
        emBreve: false,
      ),
      ServiceModel(
        descricao: 'Listar Registros',
        icon: 'fileEyeOutline',
        link: '/day_record/',
        emBreve: false,
      ),
      ServiceModel(
        descricao: 'Atualizar Contato',
        icon: 'account-cog',
        link: '/update_user/',
        emBreve: true,
      ),
    ];
  }
}
