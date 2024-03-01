import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Observable } from 'rxjs';
import { Usuario } from '../model/usuarios/usuarios.module';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

 
  private appUrl = environment.API_URL; 

  constructor(private http: HttpClient) { }

  getAllUsuarios(): Observable<any> {
    const apiUrl = 'api/usuarios/';
    return this.http.get<any>(this.appUrl + apiUrl);
  }

  login(credentials: any) {
    const apiUrl = 'api/usuarios/login';
    return this.http.post<any>(environment.API_URL + apiUrl, credentials);
  }
}

