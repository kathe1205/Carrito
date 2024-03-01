import { UsuarioService } from 'src/app/services/usuario.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-proveedores',
  templateUrl: './proveedores.component.html',
  styleUrls: ['./proveedores.component.css']
})
export class ProveedoresComponent implements OnInit {

  data: any[] = [] ;
  constructor(private UsuarioService:UsuarioService) {}
  ngOnInit(): void {
      this.llenarData()
  }

  llenarData(){
    this.UsuarioService.getAllUsuarios().subscribe(data => {
      this.data=data
      console.log(this.data)
    })
  }

}
