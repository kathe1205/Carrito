import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { UsuarioService } from 'src/app/services/usuario.service';
import { Router } from '@angular/router';
import { TokenService } from 'src/app/utils/token.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit {
  form!: FormGroup;

  constructor(
    private usuarioService: UsuarioService,
    private fb: FormBuilder,
    private tokenService:TokenService,
    private router: Router
  ) {}
  
  ngOnInit(): void {
    this.form = this.fb.group({
      email: ['', [Validators.required]],
      password: ['', Validators.required],
    });
  }  

  get f() {
    return this.form.controls;
  } 

  onSubmit() {
    if (this.form.invalid) {
      return;
    }
  
    const credentials = {
      usuario: this.form.value.email,
      contrasenia: this.form.value.password,
    };
  
    this.usuarioService.login(credentials).subscribe(
      (response: any) => {
        const token = response.token;
        const decodedToken: any = this.tokenService.decodeToken(token);
        localStorage.setItem('token', token);
        this.router.navigate(['/proveedores']);
      },
      (error: any) => {
        console.error('Error durante el inicio de sesión:', error);
        let errorMessage = 'Hubo un problema al iniciar sesión';
        if (error && error.message) {
          errorMessage = error.message;
        }
        Swal.fire({
          icon: 'error',
          title: 'Error durante el inicio de sesión',
          text: errorMessage,
        });
      }
    );
  }
}