{% extends "template.volt" %}

{% block title %}Index{% endblock %}

{% block content %}
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Barang <small><strong> Pilihan</strong></small></h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Layout</a></li>
            <li class="breadcrumb-item active">Top Navigation</li>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <!-- /.content-header -->

  <!-- Main content -->
  <div class="content">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
      
          {% for barang in barangs %}
          <div class="card card-primary card-outline">
            <div class="card-body">
              <p class="card-text" style="text-align: center;">
               </p>

             <a href="">  <strong>{{barang['username']}}</strong> </a><br>               
              <img style="margin-left: 100px;" src="data:image/png;base64,{{barang['foto']}}" alt="" height="275  "> 
              <p class="card-text" style="text-align: center;">
                
                <strong>{{barang['nama']}}</strong><br>
                <i> Target Tukar
               {{barang['target_tukar']}}</i><br>
               <a href="/home/lihat/?id={{barang['id']}}"><button class="btn btn-primary">Click</button></a>
              
              </p>
            </div>
          </div><!-- /.card -->
          {% endfor %}
        </div>
        <!-- /.col-md-6 -->
        <div class="col-lg-6">
          <div class="card">
            <div class="card-header">
              <h5 class="card-title m-0">Cari Barang</h5>
            </div>
            <div class="card-body">
              <form action="/home/" method="get">
              <input type="text" class="form-control" name="nama" placeholder="Cari Barang"> <br>
              <input type="submit" class="btn btn-primary"  value="Cari Barang">
            </form>

            </div>
          </div>

          <div class="card">
            <div class="card-header">
              <h5 class="card-title m-0">Telusuri Berdasar Barang Yang Anda Punya</h5>
            </div>
            <div class="card-body">
              <form action="/home/" method="get">
              <input type="text" class="form-control" name="barang" placeholder="Cari Berdasar Barang Anda"> <br>
              <input type="submit" class="btn btn-primary"  value="Telusuri">
            </form>

            </div>
          </div>

          <div class="card card-primary card-outline">

            <div class="card-header">
              <h5 class="card-title m-0">Cari Berdasar Kategori</h5>
            </div>

            <div class="card-body">
              
              <form action="/home/" method="get">
              <select class="form-control form-control-sm" name="kategori">
                <option>Handphone</option>
                <option>Laptop</option>
                <option>Console</option>
            </select> <br>
              <input type="submit" class="btn btn-primary"  value="Cari Berdasar Kategori">
              </form>

            </div>
          </div>
        </div>
        <!-- /.col-md-6 -->
      </div>
      <!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <!-- /.content -->
</div>





{% endblock %}