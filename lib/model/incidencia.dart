enum PrioridadIncidencia {
  baja('Baja'),
  media('Media'),
  alta('Alta');

  const PrioridadIncidencia(this.etiqueta);

  final String etiqueta;

  static PrioridadIncidencia desdeJson(dynamic valor) {
    return PrioridadIncidencia.values.firstWhere(
      (prioridad) => prioridad.etiqueta == valor,
      orElse: () => PrioridadIncidencia.media,
    );
  }
}

class Incidencia {
  String id;
  String titulo;
  String descripcion;
  String cliente;
  String categoria;
  String estado;
  String fecha;
  PrioridadIncidencia prioridad;

  Incidencia({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.cliente,
    required this.categoria,
    required this.estado,
    required this.fecha,
    this.prioridad = PrioridadIncidencia.media,
  });

  factory Incidencia.desdeJson(Map<String, dynamic> m) {
    return Incidencia(
      id: m['id']?.toString() ?? '',
      titulo: m['titulo']?.toString() ?? '',
      descripcion: m['descripcion']?.toString() ?? '',
      cliente: m['cliente']?.toString() ?? '',
      categoria: m['categoria']?.toString() ?? 'Software',
      estado: m['estado']?.toString() ?? 'Pendiente',
      fecha: m['fecha']?.toString() ?? '',
      prioridad: PrioridadIncidencia.desdeJson(m['prioridad']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
      'cliente': cliente,
      'categoria': categoria,
      'estado': estado,
      'fecha': fecha,
      'prioridad': prioridad.etiqueta,
    };
  }
}
