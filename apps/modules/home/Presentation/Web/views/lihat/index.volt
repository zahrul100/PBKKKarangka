{% extends "template.volt" %}

{% block title %}Index{% endblock %}

{% block content %}
<section class="content">

    <!-- Default box -->
    {% for barang in barangs %}
    <div class="card card-solid">
      <div class="card-body">
        <div class="row">
          <div class="col-12 col-sm-6">
            <h3 class="d-inline-block d-sm-none"><strong>{{barangs['nama']}}</strong></h3>
            <div class="col-12">
              <img src="data:image/png;base64,{{barang['foto']}}"alt="Product Image" height="500px" style="margin-left: 200px;">
            </div>
          </div>
          <div class="col-12 col-sm-6">
            <h3 class="my-3"><strong>{{barang['nama']}}</strong></h3>
            <a href=""> <p><h4>{{barang['username']}}</h4></p></a>

            <hr>
      

            
            <strong><h2>Target Tukar </h2></strong>
            <div class="bg-gray py-2 px-3 mt-4">
              <h2 class="mb-0">
                {{barang['target_tukar']}}
              </h2>
              <h4 class="mt-0">
                <small>Dapat Tukar Tambah </small>
              </h4>
            </div>

            <div class="mt-4">
              {%if session.get('user-name') == null%}
              
             <a href="/auth/login"> <button type="button" class="btn btn-primary btn-lg" data-toggle="modal">Mulai Tukar</button></a>
              
             {% else %}
             {% if barang['blokir'] == 0 %}
              <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal1">Mulai Tukar</button>
              {% endif %}
              <div class="modal fade" id="myModal1" role="dialog">
                <div class="modal-dialog"> 
                    <div class="modal-content">
                  <div class="card card-primary">
                <div class="card-header">
                  <h3 class="card-title">Permintaan Barter</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <form role="form" action="/dashboard/tawaran/tawar" method="post" enctype="multipart/form-data" >
                  <div class="card-body">
                    <div class="form-group">
                      <label for="nama"> {{barang['nama']}}</label>
                      <input type="hidden" name="idbarang" class="form-control" id="exampleInputEmail1" placeholder="Nama Barang" value="{{ barang['id'] }}">
                    </div>
  
      
  
                    <div class="form-group">
                    <input type="hidden" name="usernamepenawar" class="form-control"  value="{{session.get('user-name')}}">
                    </div>
                    <div class="form-group">
                      <label for="kategori">Pemilik : {{barang['username']}}</label>
                      <input type="hidden" name="usernamepemilik" class="form-control" id="exampleInputPassword1" placeholder="Username Tujuan" value="{{barang['username']}}">
                    </div>
                    <div class="form-group">
                      <label class="control-label" for="Company">Tukar Dengan Barang</label>
                      <select id="idbarangpenawar" class="form-control" name="idbarangtawaran">
                          <option value=""></option>
                          {% for userinfo in userinfos %}
                          {% if userinfo.blokir == 0 %}
                          <option value="{{userinfo.id}}">{{userinfo.nama}}</option>
                          {% endif %}
                          {% endfor %}
                      </select> 
                      Note : Jika pilihan kosong <a href="/dashboard/barang/"> Upload barang </a>di akun anda terlebih dahulu
                  </div>


                  <div class="form-group">
                    <label for="kategori">Tambah Dengan (Rp)</label>
                    <input type="tambahan" name="tambahan" class="form-control" id="exampleInputPassword1" placeholder="Uang Sejumlah" value="0" >
                  Note : Kosongkan jika tidak ingin tukar tambah
                  </div>



                  <div class="form-group">
                    <input type="hidden" name="status" class="form-control" id="exampleInputPassword1" placeholder="Uang Sejumlah" value="Belum Ditanggapi" >
          
                  </div>
                  
  
                 
                  </div>
                  <!-- /.card-body -->
  
                  <div class="card-footer">
                    <button type="submit" class="btn btn-primary">Tawarkan</button>
                  </div>
                </form>
                  </div>
                </div>
              </div> 
              </div>
              {% endif %}
              {% if session.get('user-name') == null%}
               <a href="/auth/login"><button class="btn btn-primary btn-lg">Kirim Pesan</button> </a>
               {% else %}
               <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Kirim Pesan</button>
            <div class="modal fade" id="myModal" role="dialog">
              <div class="modal-dialog"> 
                  <div class="modal-content">
                <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Kirim Pesan</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form" action="/home/lihat/kirim" method="post" enctype="multipart/form-data" >
                <div class="card-body">
                  <div class="form-group">
                    <label for="nama">Judul Pesan</label>
                    <input type="text" name="judul" class="form-control" id="exampleInputEmail1" placeholder="Judul Pesan">
                  </div>

    

                  <div class="form-group">
                  <input type="hidden" name="usernamepengirim" class="form-control"  value="{{session.get('user-name')}}">
                  </div>
                  <div class="form-group">
                    <label for="kategori">Kirim ke</label>
                    <input type="text" name="usernamepenerima" class="form-control" id="exampleInputPassword1" placeholder="Username Tujuan" value="{{barang['username']}}">
                  </div>
                  <div class="form-group">
                    <label for="pesan">Isi Pesan</label>
                
                    <textarea cols="80" id="editor1"  rows="10" data-sample-short name="pesan"> </textarea>


                    
                  </div>

               
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Kirim</button>
                </div>
              </form>
                </div>
              </div>
            </div> 
            </div>

            {% endif %}

            </div>

            

            <div class="mt-4 product-share">
              <a href="#" class="text-gray">
                <i class="fab fa-facebook-square fa-2x"></i>
              </a>
              <a href="#" class="text-gray">
                <i class="fab fa-twitter-square fa-2x"></i>
              </a>
              <a href="#" class="text-gray">
                <i class="fas fa-envelope-square fa-2x"></i>
              </a>
              <a href="#" class="text-gray">
                <i class="fas fa-rss-square fa-2x"></i>
              </a>
            </div>

          </div>
        </div>
        <div class="row mt-4">
          <nav class="w-100">
            <div class="nav nav-tabs" id="product-tab" role="tablist">
              <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">Description</a>
           </div>
          </nav>
          <div class="tab-content p-3" id="nav-tabContent">
            <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab"> {{barang['keterangan']}} </div>
          </div>
        </div>
      </div>
      <!-- /.card-body -->
    </div>
    <!-- /.card -->

  </section>
{% endfor %}

{% endblock %}