import { Injectable } from '@angular/core';

import { Producto } from './models/producto.model';

@Injectable({ providedIn: 'root' })
export class ProductosService {
  private productos: Producto[] = [];

  getTodosProductos() {
    return this.productos;
  }

  agregarProducto(nombre: string, precio: number) {
    const nuevoProducto = new Producto(Date.now(), nombre, precio);
    this.productos.push(nuevoProducto);
  }
}
