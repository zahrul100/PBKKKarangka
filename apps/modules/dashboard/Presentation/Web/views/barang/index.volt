{% extends "template.volt" %}

{% block title %}Index{% endblock %}

{% block content %}
<style>

.center {
    margin: auto;
    width: 60%;
    padding: 20px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

.hideform {
    display: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Barang Anda</h1>
            
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
   
    <div class="row">
          <!-- left column -->
          <div class="col-md-6">
            <!-- general form elements -->
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Tambah Barang</button>
            <div class="modal fade" id="myModal" role="dialog">
              <div class="modal-dialog"> 
                  <div class="modal-content">
                <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Upload</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form" action="/dashboard/upload/upload" method="post" enctype="multipart/form-data" >
                <div class="card-body">
                  <div class="form-group">
                    <label for="nama">Nama Barang</label>
                    <input type="text" name="nama" class="form-control" id="exampleInputEmail1" placeholder="Nama Barang">
                  </div>

                  <div class="form-group">
                    <label for="kategori">Kategori</label>
                    <input type="text" name="kategori" class="form-control" id="exampleInputPassword1" placeholder="Kategori">
                  </div>

                  <div class="form-group">
                    <label for="keterangan">Keterangan</label>
                
                     <textarea class="form-control" name="keterangan" rows="5" id="comment"></textarea>
                    
                  </div>

                  <div class="form-group">
                    <label for="keterangan">Target Tukar</label>
                
                     <textarea class="form-control" name="target_tukar" rows="5" id="comment"></textarea>
                    
                  </div>

                  <div class="form-group">

                    <input type="hidden" name="idpemilik" required="required" value="{{userid}}"> <br/>
        
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
            <!-- /.card -->

   
          <!--/.col (right) -->
        </div>
    </div>
  <br>
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
     
        <img src="data:image/png;base64,{{barang['foto']}}" alt="" height="200" width="">
  
        <br>
       <br>
       Target Tukar :<br> <strong>{{barang['target_tukar']}}</strong>
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
                  <label for="keterangan">Keterangan</label>
              
                   <textarea class="form-control" name="keterangan" rows="5" id="comment"> {{barang['keterangan']}} </textarea>
                  
                </div>

                <div class="form-group">
                  <label for="keterangan">Target Tukar</label>
              
                   <textarea class="form-control" name="target_tukar" rows="5" id="comment"> {{barang['target_tukar']}} </textarea>
                  
                </div>

                <div class="form-group">

                  <input type="hidden" name="idpemilik" required="required" value="{{userid}}"> <br/>
                  <input type="hidden" name="id" required="required" value="{{barang['id']}}"> <br/>
      
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









        <a href="/dashboard/upload/delete/{{barang['id']}}"><button class="btn btn-danger">Hapus</button></a>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.card -->
              </div>
            <!-- /.col -->
            {% endfor %}
          </div>



<section class="content">


</section>



</div>
<script>$('#show').on('click', function () {
    $('.center').show();
    $(this).hide();
})

$('#close').on('click', function () {
    $('.center').hide();
    $('#show').show();
})</script>


{% endblock%}
