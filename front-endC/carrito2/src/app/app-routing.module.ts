import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProveedoresComponent } from './pages/proveedores/proveedores.component';
import { CreateProductoComponent } from './pages/proveedores/create/create.component';

const routes: Routes = [
  {
    path:'login',
    loadChildren: () => import('./pages/auth/auth.module').then(m => m.AuthModule),
  },
  {
    path:'proveedores',
    component:ProveedoresComponent
  },
  { path: 'proveedores/create', component: CreateProductoComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
