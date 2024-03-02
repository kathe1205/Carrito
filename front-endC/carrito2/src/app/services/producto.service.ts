import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Observable } from 'rxjs';
import { Producto } from '../model/productos/producto.model';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ProductoService {

 
  private appUrl = environment.API_URL; 

  constructor(private http: HttpClient) {}

  guardarProducto(producto: any): Observable<any> {
    const apiUrl = 'api/Productos';
    return this.http.post<any>(this.appUrl + apiUrl, producto);
  }

  getAllProductos(): Observable<any[]> {
    const apiUrl = 'api/Productos';

    return this.http.get<any[]>(this.appUrl+ apiUrl);
  }

  deleteProducto(idProducto: string): Observable<any> {
    const apiUrl = 'api/Productos';
    return this.http.delete<any>(this.appUrl + apiUrl + "/" + idProducto);
  }
}

