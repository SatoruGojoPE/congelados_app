class CatalogoProducto {
  final String codigoMK;
  final String nombre;
  final String imagen;

  CatalogoProducto({
    required this.codigoMK,
    required this.nombre,
    required this.imagen,
  });
}

final catalogoProductos = [

  // YA REGISTRADOS

  CatalogoProducto(
    codigoMK: '20203568',
    nombre: 'Aro Arveja 1kg',
    imagen: 'assets/productos/AroArveja1kg.png',
  ),

  CatalogoProducto(
    codigoMK: '20203569',
    nombre: 'Aro Zanahoria 1kg',
    imagen: 'assets/productos/AroZanahoria1kg.png',
  ),

  CatalogoProducto(
    codigoMK: '20203570',
    nombre: 'Redondos Nuggets Pechuga 180g',
    imagen: 'assets/productos/Redondosnuggetsdepechugadepollo180g.png',
  ),

  CatalogoProducto(
    codigoMK: '20203571',
    nombre: 'Filete Basa Premium ARO 1kg',
    imagen: 'assets/productos/FiletedeBasaPremiumARO1kg.png',
  ),

  CatalogoProducto(
    codigoMK: '20203572',
    nombre: 'Pizza Mixta Della Nonna',
    imagen: 'assets/productos/PizzaMixtaDELLANONNACaja350g.png',
  ),

  CatalogoProducto(
    codigoMK: '20203573',
    nombre: 'Pizza Pepperoni Italpizza',
    imagen: 'assets/productos/PizzaCongeladaITALPIZZAPepperoniCaja420g.png',
  ),

  CatalogoProducto(
    codigoMK: '20203574',
    nombre: 'Lasaña Carne El Fiorentino',
    imagen: 'assets/productos/LasagnadeCarneELFIORENTINOBandeja1kg.png',
  ),

  CatalogoProducto(
    codigoMK: '20203575',
    nombre: 'Capelletis Carne ARO',
    imagen: 'assets/productos/CapelletisdeCarneARO1Kg.png',
  ),

  CatalogoProducto(
    codigoMK: '20203576',
    nombre: 'Pulpa Maracuyá El Frutero',
    imagen: 'assets/productos/PulpadeMaracuyaElFrutero500g.png',
  ),

  CatalogoProducto(
    codigoMK: '20203577',
    nombre: 'Pulpa Piña Golden El Frutero',
    imagen: 'assets/productos/PulpadePinaGoldenElFrutero1kg.png',
  ),

  // POR REGISTRAR

  CatalogoProducto(
    codigoMK: '20203578',
    nombre: 'Filete Pechuga Pollo SADIA',
    imagen: 'assets/productos/FiletedePechugadePolloSADIA1kg.png',
  ),

  CatalogoProducto(
    codigoMK: '20203579',
    nombre: 'Hamburguesa Carne La Super San Fernando',
    imagen: 'assets/productos/HamburguesadeCarneLaSuperSanFernando.png',
  ),

  CatalogoProducto(
    codigoMK: '20203580',
    nombre: 'Hamburguesa Carne ARO 10un',
    imagen: 'assets/productos/HamburguesadeCarneARO10un.png',
  ),

  CatalogoProducto(
    codigoMK: '20203581',
    nombre: 'Raviolito Queso El Fiorentino',
    imagen: 'assets/productos/RaviolitodeQuesoELFIORENTINOBolsa1kg.png',
  ),

  CatalogoProducto(
    codigoMK: '20203582',
    nombre: 'Dedos de Pollo AVINKA',
    imagen: 'assets/productos/DedosdePolloAVINKA1kg.png',
  ),
];