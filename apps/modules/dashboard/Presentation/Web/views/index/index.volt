{% extends "template.volt" %}

{% block title %}Index{% endblock %}

{% block content %}
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Dashboard,Selamat Datang {{ session.get('user-name')}}</h1>
            
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>

    {% if session.get('user-name') != null %}
    <div class="row">
        <div class="col-lg-3 col-6">
          <!-- small box -->
          <div class="small-box bg-info">
            <div class="inner">
              <h3>{{ barangs|length }}</h3>

              <p>Barang Anda</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="/dashboard/barang" class="small-box-footer">Lihat Semua <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-6">
          <!-- small box -->
          <div class="small-box bg-success">
            <div class="inner">
              <h3>{{ barters|length }}</h3>

              <p>Daftar Barter</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="/dashboard/barter" class="small-box-footer">Lihat Semua <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-6">
          <!-- small box -->
          <div class="small-box bg-warning">
            <div class="inner">
              <h3>{{ tawarans|length }}</h3>

              <p>Permintaan Barter</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="/dashboard/tawaran" class="small-box-footer">Lihat Semua <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
 
        <!-- ./col -->
      </div>

        <div class="row">
          <div class="col-md-3" style="text-align: center;" > 
            <h2>Cuplikan Barang Anda</h2>
            </div>
        <br>
      
        </div>


        <div class="row">
          
            {% for barang in barangs %}
       

       
            <div class="col-md-3" style="text-align: center;" > 
                <div class="card card-primary">
                  <div class="card-header">
                    <h3 class="card-title">
                        {{ barang['nama']}}</h3>
    
                    <div class="card-tools">
                      <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                      </button>
                    </div>
                    <!-- /.card-tools -->
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body">
     
        <img src="data:image/png;base64,{{barang['foto']}}" alt="" height="300">
  
        <br>
       <br>
       Keterangan :<br> {{barang['keterangan']}}
        <br>
        <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#myModal{{barang['id']}}">Edit</button>
        <div class="modal fade" id="myModal{{barang['id']}}" role="dialog">
            <div class="modal-dialog"> 
                <div class="modal-content">
              <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">Edit</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form role="form" action="/dashboard/upload/editpost" method="post" enctype="multipart/form-data" >
              <div class="card-body">
                <div class="form-group">
                  <label for="nama">Nama Barang</label>
                  <input type="text" name="nama" class="form-control" id="exampleInputEmail1" placeholder="Nama Barang" value="{{barang['nama']}}">
                </div>

                <div class="form-group">
                  <label for="kategori">Kategori</label>
                  <input type="text" name="kategori" class="form-control" id="exampleInputPassword1" placeholder="Kategori" value="{{barang['kategori']}}">
                </div>

                <div class="form-group">
                  <label for="target_tukar">Target Tukar</label>
              
                   <textarea class="form-control" name="target_tukar" rows="5" id="comment"> {{barang['target_tukar']}} </textarea>
                  
                </div>


                <div class="form-group">
                  <label for="keterangan">Keterangan</label>
              
                   <textarea class="form-control" name="keterangan" rows="5" id="comment"> {{barang['keterangan']}} </textarea>
                  
                </div>


             
                <div class="form-group">

                  <input type="hidden" name="id" required="required" value="{{ barang['id']}}"> <br/>
      
                </div>

                <div class="form-group">
                  <label for="foto">Foto Barang</label>
                  <div class="input-group">
                    <div class="custom-file">
                      <input type="file" name="foto" class="custom-file-input" id="exampleInputFile">
                      <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                    </div>
                    <div class="input-group-append">
                      <span class="input-group-text" id="">Upload</span>
                    </div>
                  </div>
                </div>
              
              </div>
              <!-- /.card-body -->

              <div class="card-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
              </div>
            </div>
          </div> 
          </div>

        <a href="/dashboard/upload/delete/{{barang['id']}}"><button class="btn btn-outline-primary">Hapus</button></a>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.card -->
              </div>
            <!-- /.col -->
            {% endfor %}
          </div>
    {% endif %}


<section class="content">


</section>



</div>

{% endblock %}