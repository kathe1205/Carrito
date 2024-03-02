import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.scss']
})
export class CreateComponent implements OnInit {
  productoForm: FormGroup;

  constructor(private fb: FormBuilder) {
    this.productoForm = this.fb.group({
      nombre: ['', Validators.required],
      descripcion: ['', Validators.required],
      stock: ['', Validators.required],
      id_proveedor: ['', Validators.required],
      estado: ['', Validators.required],
      precio: ['', Validators.required],
      imagen: ['', Validators.required],
    });
  }

  ngOnInit(): void {
  }

  guardarProducto() {
    if (this.productoForm.valid) {
      const producto = this.productoForm.value;
      console.log(producto);
      // Aquí puedes agregar tu lógica para guardar el producto
    } else {
      console.log('Formulario no válido');
    }
  }
}
