export class Usuario {
  id: number;
  nombre: string;
  apellido: string;
  usuario: string;
  contrasenia: string;
  id_rol: number;
  estado: string;

  constructor(
    id: number,
    nombre: string,
    apellido: string,
    usuario: string,
    contrasenia: string,
    id_rol: number,
    estado: string
  ) {
    this.id = id;
    this.nombre = nombre;
    this.apellido = apellido;
    this.usuario = usuario;
    this.contrasenia = contrasenia;
    this.id_rol = id_rol;
    this.estado = estado;
  }
}