import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Observable } from 'rxjs';
import { Usuario } from '../model/usuarios/usuarios.module';
import 'dotenv/config';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  private apiUrl = 'api/usuarios/login'; // Aquí defines la URL base del backend
  private appUrl = process.env['API_URL']; // URL del servidor de desarrollo de .NET Core

  constructor(private http: HttpClient) { }

  getAllUsuarios(): Observable<any> {
    return this.http.get<any>(this.appUrl + this.apiUrl);
  }

  login(credentials: any) {
    return this.http.post<any>(this.appUrl + this.apiUrl, credentials);
  }
}

