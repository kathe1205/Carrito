import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DomSanitizer, SafeUrl } from '@angular/platform-browser';
import { ProductoService } from 'src/app/services/producto.service';

@Component({
  selector: 'app-create-producto',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css']
})
export class CreateProductoComponent implements OnInit {
  productoForm!: FormGroup;
  previewImage: SafeUrl | null = null; 


  constructor(private fb: FormBuilder, private productoService: ProductoService, private sanitizer: DomSanitizer) { }

  ngOnInit(): void {
    console.log("crear producto");
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
  onFileSelected(event: any) {
    const file = event.target.files[0];

    if (file) {
      this.convertToBase64(file);
    }
  }

  convertToBase64(file: File) {
    const reader = new FileReader();

    reader.onload = (e: any) => {
      this.previewImage = this.sanitizer.bypassSecurityTrustUrl(e.target.result);
      this.productoForm.get('imagen')?.setValue(e.target.result);
    };

    reader.readAsDataURL(file);
  }
  guardarProducto() {
    console.log("el producto",this.productoForm)
    if (this.productoForm.valid) {
      const producto = this.productoForm.value;

      this.productoService.guardarProducto(producto).subscribe(
        (respuesta) => {
          console.log('Producto guardado exitosamente:', respuesta);
        },
        (error) => {
          console.error('Error al guardar el producto:', error);
        }
      );
    }
  }
}
