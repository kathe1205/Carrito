import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.scss']
})
export class ProductosComponent {
  constructor(private router: Router) {}
  navigateToCreateProduct() {
    this.router.navigate(['/productos/create']);
  }
}
