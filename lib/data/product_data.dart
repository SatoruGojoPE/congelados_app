import '../models/product_model.dart';

List<ProductModel> productos = [

  // ESTABLES

  ProductModel(
    codigoMK: '20203568',
    nombre: 'Aro Arveja 1kg',
    imagen:
      'assets/productos/AroArveja1kg.png',
    lote: 'LOT001',
    produccion: DateTime(2025, 1, 10),
    vencimiento: DateTime(2026, 12, 31),
    cantidad: 120,
    temperatura: -20,
  ),

  ProductModel(
    codigoMK: '20203569',
    nombre: 'Aro Zanahoria 1kg',
    imagen:
      'assets/productos/AroZanahoria1kg.png',

    lote: 'LOT002',
    produccion: DateTime(2025, 2, 15),
    vencimiento: DateTime(2026, 11, 30),
    cantidad: 90,
    temperatura: -21,
  ),

  ProductModel(
    codigoMK: '20203570',
    nombre: 'Redondos Nuggets Pechuga 180g',
    imagen:
      'assets/productos/RedondosNuggetsdePechugadePollo180g.png',
    lote: 'LOT003',
    produccion: DateTime(2025, 3, 10),
    vencimiento: DateTime(2026, 10, 15),
    cantidad: 150,
    temperatura: -20,
  ),

  ProductModel(
    codigoMK: '20203571',
    nombre: 'Filete Basa Premium ARO 1kg',
    imagen:
      'assets/productos/FiletedeBasaPremiumARO1kg.png',
    lote: 'LOT004',
    produccion: DateTime(2025, 1, 5),
    vencimiento: DateTime(2026, 9, 20),
    cantidad: 60,
    temperatura: -22,
  ),

  ProductModel(
    codigoMK: '20203572',
    nombre: 'Pizza Mixta Della Nonna',
    imagen:
      'assets/productos/PizzaMixtaDELLANONNACaja350g.png',
    lote: 'LOT005',
    produccion: DateTime(2025, 4, 10),
    vencimiento: DateTime(2026, 8, 25),
    cantidad: 75,
    temperatura: -19,
  ),

  ProductModel(
    codigoMK: '20203573',
    nombre: 'Pizza Pepperoni Italpizza',
    imagen:
      'assets/productos/PizzaCongeladaITALPIZZAPepperoniCaja420g.png',
    lote: 'LOT006',
    produccion: DateTime(2025, 5, 10),
    vencimiento: DateTime(2026, 7, 15),
    cantidad: 110,
    temperatura: -20,
  ),

  // RETIRAR

  ProductModel(
    codigoMK: '20203574',
    nombre: 'Lasaña Carne El Fiorentino',
    imagen:
      'assets/productos/LasagnadeCarneELFIORENTINOBandeja1kg.png',
    lote: 'LOT007',
    produccion: DateTime(2025, 1, 1),
    vencimiento: DateTime.now().add(
      const Duration(days: 5),
    ),
    cantidad: 30,
    temperatura: -20,
  ),

  ProductModel(
    codigoMK: '20203575',
    nombre: 'Capelletis Carne ARO',
    imagen:
      'assets/productos/CapelletisdeCarneARO1Kg.png',
    lote: 'LOT008',
    produccion: DateTime(2025, 2, 1),
    vencimiento: DateTime.now().add(
      const Duration(days: 3),
    ),
    cantidad: 20,
    temperatura: -21,
  ),

  // VENCIDOS

  ProductModel(
    codigoMK: '20203576',
    nombre: 'Pulpa Maracuyá El Frutero',
    imagen:
      'assets/productos/PulpadeMaracuyaElFrutero500g.png',
    lote: 'LOT009',
    produccion: DateTime(2024, 1, 1),
    vencimiento: DateTime.now().subtract(
      const Duration(days: 4),
    ),
    cantidad: 15,
    temperatura: -18,
  ),

  ProductModel(
    codigoMK: '20203577',
    nombre: 'Pulpa Piña Golden El Frutero',
    imagen:
      'assets/productos/PulpadePinaGoldenElFrutero1kg.png',
    lote: 'LOT010',
    produccion: DateTime(2024, 2, 1),
    vencimiento: DateTime.now().subtract(
      const Duration(days: 10),
    ),
    cantidad: 10,
    temperatura: -19,
  ),
];
