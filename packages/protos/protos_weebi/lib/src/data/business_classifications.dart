import 'package:protos_weebi/src/generated/boutique.pb.dart';
import 'package:protos_weebi/src/generated/boutique.pbenum.dart';

/// Authoritative ISIC-oriented business classifications for Weebi.
///
/// Composite unique key: ([BusinessClassification.isicCode],
/// [BusinessClassification.subCode]). [isicCode] may repeat;
/// [subCode] is empty when a single Weebi activity maps to that ISIC.
///
/// SMT regimes: A=[CommerceTypePb.negoce], B=artisanat, C=services.
abstract final class BusinessClassifications {
  /// Lookup by ISIC + optional sub-code (defaults to empty sub).
  static BusinessClassification? byIsicAndSub(
    String isicCode, [
    String subCode = '',
  ]) {
    final isic = isicCode.trim();
    if (isic.isEmpty) return null;
    final sub = subCode.trim();
    for (final row in all) {
      if (row.isicCode == isic && row.subCode == sub) return row;
    }
    return null;
  }

  /// All rows sharing an ISIC code (one or more Weebi refinements).
  static List<BusinessClassification> byIsic(String isicCode) {
    final isic = isicCode.trim();
    if (isic.isEmpty) return const [];
    return [
      for (final row in all)
        if (row.isicCode == isic) row,
    ];
  }

  static String compositeKey(String isicCode, String subCode) {
    final sub = subCode.trim();
    return sub.isEmpty ? isicCode.trim() : '${isicCode.trim()}:$sub';
  }

  static final List<BusinessClassification> all = List.unmodifiable([
    _row(
      isic: '4719',
      sub: '',
      emoji: '🛍️',
      labelFr: 'Boutique',
      isicFr: 'Autres commerces de détail en magasin non spécialisé',
      isicEn: 'Other retail sale in non-specialized stores',
      isicEs:
          'Otras actividades de venta al por menor en comercios no especializados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '4711',
      sub: '',
      emoji: '🥫',
      labelFr: 'Alimentation générale',
      isicFr:
          'Commerce de détail en magasin non spécialisé à prédominance alimentaire',
      isicEn:
          'Retail sale in non-specialized stores with food, beverages or tobacco predominating',
      isicEs:
          'Venta al por menor en comercios no especializados con predominio de la venta de alimentos, bebidas o tabaco',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '4771',
      sub: 'bambinerie',
      emoji: '🧸',
      labelFr: 'Bambinerie',
      isicFr: "Commerce de détail d'habillement, chaussures et articles en cuir",
      isicEn:
          'Retail sale of clothing, footwear and leather articles in specialized stores',
      isicEs:
          'Venta al por menor de prendas de vestir, calzado y artículos de cuero en comercios especializados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '5630',
      sub: '',
      emoji: '🍹',
      labelFr: 'Bar',
      isicFr: 'Activités de consommation de boissons',
      isicEn: 'Beverage serving activities',
      isicEs: 'Actividades de servicio de bebidas',
      regime: CommerceTypePb.services,
    ),
    _row(
      isic: '1071',
      sub: '',
      emoji: '🍞',
      labelFr: 'Boulangerie',
      isicFr: 'Boulangerie, pâtisserie et biscuiterie',
      isicEn: 'Manufacture of bakery products',
      isicEs: 'Elaboración de productos de panadería',
      regime: CommerceTypePb.artisanat,
    ),
    _row(
      isic: '4721',
      sub: 'boucherie',
      emoji: '🥩',
      labelFr: 'Boucherie',
      isicFr: 'Commerce de détail de produits alimentaires en magasin spécialisé',
      isicEn: 'Retail sale of food in specialized stores',
      isicEs: 'Venta al por menor de alimentos en comercios especializados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '1103',
      sub: '',
      emoji: '🍺',
      labelFr: 'Brasserie',
      isicFr: 'Fabrication de bière et de malt',
      isicEn: 'Manufacture of malt liquors and malt',
      isicEs: 'Elaboración de bebidas malteadas y de malta',
      regime: CommerceTypePb.artisanat,
    ),
    _row(
      isic: '4773',
      sub: '',
      emoji: '💄',
      labelFr: 'Cosmétique',
      isicFr: "Commerce de détail d'autres biens neufs en magasin spécialisé",
      isicEn: 'Other retail sale of new goods in specialized stores',
      isicEs:
          'Venta al por menor de otros productos nuevos en comercios especializados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '014',
      sub: '',
      emoji: '🐄',
      labelFr: 'Élevage bovin/ovin/etc.',
      isicFr: "Élevage d'animaux",
      isicEn: 'Raising of animals',
      isicEs: 'Cría de animales',
      regime: CommerceTypePb.artisanat,
    ),
    _row(
      isic: '0322',
      sub: '',
      emoji: '🐟',
      labelFr: 'Pisciculture',
      isicFr: 'Aquaculture en eau douce',
      isicEn: 'Freshwater aquaculture',
      isicEs: 'Acuicultura de agua dulce',
      regime: CommerceTypePb.artisanat,
    ),
    _row(
      isic: '4740',
      sub: 'electronique',
      emoji: '📱',
      labelFr: 'Électronique',
      isicFr:
          "Commerce de détail de matériels d'information et de communication",
      isicEn:
          'Retail sale of information and communications equipment in specialized stores',
      isicEs:
          'Venta al por menor de equipos de información y comunicaciones en comercios especializados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '4740',
      sub: 'informatique',
      emoji: '💻',
      labelFr: 'Informatique',
      isicFr:
          "Commerce de détail de matériels d'information et de communication",
      isicEn:
          'Retail sale of information and communications equipment in specialized stores',
      isicEs:
          'Venta al por menor de equipos de información y comunicaciones en comercios especializados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '4759',
      sub: '',
      emoji: '🔌',
      labelFr: 'Électroménager',
      isicFr:
          "Commerce de détail d'appareils ménagers et autres équipements du foyer",
      isicEn:
          'Retail sale of electrical household appliances, furniture, lighting equipment and other household articles in specialized stores',
      isicEs:
          'Venta al por menor de aparatos eléctricos de uso doméstico, muebles, equipo de iluminación y otros enseres domésticos en comercios especializados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '4721',
      sub: 'epicerie',
      emoji: '🍏',
      labelFr: 'Épicerie',
      isicFr: 'Commerce de détail de produits alimentaires en magasin spécialisé',
      isicEn: 'Retail sale of food in specialized stores',
      isicEs: 'Venta al por menor de alimentos en comercios especializados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '5510',
      sub: '',
      emoji: '🏨',
      labelFr: 'Hôtel',
      isicFr: "Activités d'hébergement de courte durée",
      isicEn: 'Short term accommodation activities',
      isicEs: 'Actividades de alojamiento para estancias cortas',
      regime: CommerceTypePb.services,
    ),
    _row(
      isic: '1811',
      sub: '',
      emoji: '🖨️',
      labelFr: 'Imprimerie',
      isicFr: 'Imprimerie',
      isicEn: 'Printing',
      isicEs: 'Impresión',
      regime: CommerceTypePb.artisanat,
    ),
    _row(
      isic: '4763',
      sub: '',
      emoji: '🎲',
      labelFr: 'Jeux',
      isicFr: 'Commerce de détail de jeux et jouets',
      isicEn: 'Retail sale of sporting equipment in specialized stores',
      isicEs:
          'Venta al por menor de equipo de deporte en comercios especializados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '1622',
      sub: '',
      emoji: '🪵',
      labelFr: 'Menuiserie bois',
      isicFr:
          'Fabrication d’éléments de menuiserie et de charpente pour le bâtiment',
      isicEn: "Manufacture of builders' carpentry and joinery",
      isicEs:
          'Fabricación de partes y piezas de carpintería para edificios y construcciones',
      regime: CommerceTypePb.artisanat,
    ),
    _row(
      isic: '2511',
      sub: '',
      emoji: '⚙️',
      labelFr: 'Menuiserie métallique',
      isicFr: "Fabrication d'éléments métalliques pour la construction",
      isicEn: 'Manufacture of structural metal products',
      isicEs: 'Fabricación de productos metálicos para uso estructural',
      regime: CommerceTypePb.artisanat,
    ),
    _row(
      isic: '3100',
      sub: '',
      emoji: '🪑',
      labelFr: 'Fabrication de meubles en bois',
      isicFr: 'Fabrication de meubles',
      isicEn: 'Manufacture of furniture',
      isicEs: 'Fabricación de muebles',
      regime: CommerceTypePb.artisanat,
    ),
    _row(
      isic: '8299',
      sub: '',
      emoji: '🛠️',
      labelFr: 'Multi-services',
      isicFr: 'Autres activités de soutien aux entreprises n.c.a.',
      isicEn: 'Other business support service activities n.e.c.',
      isicEs: 'Otras actividades de servicios de apoyo a las empresas n.c.p.',
      regime: CommerceTypePb.services,
    ),
    _row(
      isic: '4761',
      sub: '',
      emoji: '📚',
      labelFr: 'Papeterie',
      isicFr: 'Commerce de détail de livres, journaux et papeterie',
      isicEn:
          'Retail sale of books, newspapers and stationary in specialized stores',
      isicEs:
          'Venta al por menor de libros, periódicos y artículos de papelería en comercios especializados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '4772',
      sub: '',
      emoji: '💊',
      labelFr: 'Pharmacie',
      isicFr: 'Commerce de détail de produits pharmaceutiques et médicaux',
      isicEn:
          'Retail sale of pharmaceutical and medical goods, cosmetic and toilet articles in specialized stores',
      isicEs:
          'Venta al por menor de productos farmacéuticos y médicos, cosméticos y artículos de tocador en comercios especializados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '4782',
      sub: '',
      emoji: '🚗',
      labelFr: 'Pièces détachées auto',
      isicFr: 'Commerce de détail de pièces et accessoires automobiles',
      isicEn:
          'Retail sale via stalls and markets of textiles, clothing and footwear',
      isicEs:
          'Venta al por menor de productos textiles, prendas de vestir y calzado en puestos de venta y mercados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '4783',
      sub: '',
      emoji: '🏍️',
      labelFr: 'Pièces détachées moto',
      isicFr: 'Commerce de détail de motocycles et pièces associées',
      isicEn: 'Retail sale of motorcycles and related parts and accessories',
      isicEs: 'Venta al por menor de motocicletas y sus partes y piezas',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '4721',
      sub: 'poissonnerie',
      emoji: '🐟',
      labelFr: 'Poissonnerie',
      isicFr: 'Commerce de détail de produits alimentaires en magasin spécialisé',
      isicEn: 'Retail sale of food in specialized stores',
      isicEs: 'Venta al por menor de alimentos en comercios especializados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '4771',
      sub: 'pret_a_porter',
      emoji: '👗',
      labelFr: 'Prêt-à-porter',
      isicFr: "Commerce de détail d'habillement, chaussures et articles en cuir",
      isicEn:
          'Retail sale of clothing, footwear and leather articles in specialized stores',
      isicEs:
          'Venta al por menor de prendas de vestir, calzado y artículos de cuero en comercios especializados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '4752',
      sub: '',
      emoji: '🔨',
      labelFr: 'Quincaillerie',
      isicFr: 'Commerce de détail de quincaillerie, peintures et verre',
      isicEn:
          'Retail sale of hardware, paints and glass in specialized stores',
      isicEs:
          'Venta al por menor de artículos de ferretería, pinturas y productos de vidrio en comercios especializados',
      regime: CommerceTypePb.negoce,
    ),
    _row(
      isic: '5610',
      sub: '',
      emoji: '🍽️',
      labelFr: 'Restaurant',
      isicFr: 'Activités de restaurants et services de restauration mobiles',
      isicEn: 'Restaurants and mobile food service activities',
      isicEs: 'Actividades de restaurantes y de servicio móvil de comidas',
      regime: CommerceTypePb.services,
    ),
    _row(
      isic: '9602',
      sub: 'coiffure',
      emoji: '💇',
      labelFr: 'Salon de coiffure',
      isicFr: 'Coiffure et autres soins de beauté',
      isicEn: 'Hairdressing and other beauty treatment',
      isicEs: 'Peluquería y otros tratamientos de belleza',
      regime: CommerceTypePb.services,
    ),
    _row(
      isic: '9602',
      sub: 'beaute',
      emoji: '💅',
      labelFr: 'Salon de beauté',
      isicFr: 'Coiffure et autres soins de beauté',
      isicEn: 'Hairdressing and other beauty treatment',
      isicEs: 'Peluquería y otros tratamientos de belleza',
      regime: CommerceTypePb.services,
    ),
    _row(
      isic: '1410',
      sub: '',
      emoji: '✂️',
      labelFr: 'Tailleur',
      isicFr: 'Fabrication de vêtements',
      isicEn: 'Manufacture of wearing apparel, except fur apparel',
      isicEs: 'Fabricación de prendas de vestir, excepto prendas de piel',
      regime: CommerceTypePb.artisanat,
    ),
    _row(
      isic: '8610',
      sub: 'clinique',
      emoji: '🏥',
      labelFr: 'Clinique / hôpital',
      isicFr: 'Activités hospitalières',
      isicEn: 'Hospital activities',
      isicEs: 'Actividades de hospitales',
      regime: CommerceTypePb.services,
    ),
    _row(
      isic: '8620',
      sub: 'medical',
      emoji: '🩺',
      labelFr: 'Cabinet médical',
      isicFr: 'Activités de pratique médicale et dentaire',
      isicEn: 'Medical and dental practice activities',
      isicEs: 'Actividades de médicos y odontólogos',
      regime: CommerceTypePb.services,
    ),
    _row(
      isic: '8620',
      sub: 'dentaire',
      emoji: '🦷',
      labelFr: 'Cabinet dentaire',
      isicFr: 'Activités de pratique médicale et dentaire',
      isicEn: 'Medical and dental practice activities',
      isicEs: 'Actividades de médicos y odontólogos',
      regime: CommerceTypePb.services,
    ),
    _row(
      isic: '8610',
      sub: 'maternite',
      emoji: '🤱',
      labelFr: 'Maternité',
      isicFr: 'Activités hospitalières',
      isicEn: 'Hospital activities',
      isicEs: 'Actividades de hospitales',
      regime: CommerceTypePb.services,
    ),
    _row(
      isic: '9311',
      sub: '',
      emoji: '🏅',
      labelFr: 'Sport et fitness',
      isicFr: "Gestion d'installations sportives",
      isicEn: 'Operation of sports facilities',
      isicEs: 'Gestión de instalaciones deportivas',
      regime: CommerceTypePb.services,
    ),
  ]);

  static BusinessClassification _row({
    required String isic,
    required String sub,
    required String emoji,
    required String labelFr,
    required String isicFr,
    required String isicEn,
    required String isicEs,
    required CommerceTypePb regime,
  }) {
    return BusinessClassification(
      isicCode: isic,
      subCode: sub,
      emoji: emoji,
      labelFr: labelFr,
      isicLabelFr: isicFr,
      isicLabelEn: isicEn,
      isicLabelEs: isicEs,
      smtRegime: regime,
    );
  }
}
