// proveedores.component.ts
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ProductoService } from 'src/app/services/producto.service';

@Component({
  selector: 'app-proveedores',
  templateUrl: './proveedores.component.html',
  styleUrls: ['./proveedores.component.css']
})
export class ProveedoresComponent implements OnInit {
  data: any[] = [];

  constructor(private productoService: ProductoService, private router: Router) {}

  ngOnInit(): void {
    this.llenarData();
  }

  navigateToCreateProduct() {
    this.router.navigate(['/proveedores/create/']);
  }

  deleteProduct(idProducto: string){
    this.productoService.deleteProducto(idProducto).subscribe(
      (respuesta) => {
        console.log('Producto eliminado exitosamente:', respuesta);
      },
      (error) => {
        console.error('Error al eliminar el producto:', error);
      }
    );
  }

  llenarData() {
    this.productoService.getAllProductos().subscribe((productos) => {
      this.data = productos;
      console.log(this.data);
    });
  }
}
