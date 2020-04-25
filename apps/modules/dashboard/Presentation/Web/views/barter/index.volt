{% extends "template.volt" %}

{% block title %}Index{% endblock %}

{% block content %}


<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Inbox</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Inbox</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Tawaran Diterima</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fas fa-minus"></i></button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fas fa-times"></i></button>
          </div>
        </div>
        <div class="card-body p-0">
          
          <table class="table table-striped projects">
              <thead>
                  <tr>
                      <th style="width: 1%">
                          ID
                      </th>
                      <th >
                        Pemilik Barang
                      </th>
                      <th >
                          Barang Pemilik
                      </th>
                      <th >
                        Penawar
                      </th>
                      <th>Tukar Dengan
                      </th>
                      <th >
                        Tambahan (Rp.)
                      </th>
                      <th >
                        Status Barter
                      </th>
                  </tr>
              </thead>
              <tbody>
                {% for barter in barters %}
                <tr>
                  <td>
                      {{barter['idbarter']}}
                  </td>
                  <td>
                    <a href="/dashboard/profil/umum/?username={{barter['usernamepemilik']}}">
                       {{barter['usernamepemilik']}}
                    </a>
                    <br/>
                    <small>
                    </small>
                </td>

                  <td>
                      <a href="/home/lihat/?id={{barter['idbarang']}}">
                         {{barter['namabarang']}}
                      </a>
                      <br/>
                      <small>
                      </small>
                  </td>
                  <td>
                      <ul class="list-inline">

                    <a href="/dashboard/profil/umum/?username={{barter['usernamepenawarbarang']}}">
                   {{barter['usernamepenawarbarang']}}
                   </a>
                      </ul>
                  </td>
                  <td class="project_progress">                     
                    <a href="/home/lihat/?id={{barter['idbarangtawaran']}}">{{barter['namabarangpenawar']}} </a>
                  </td>
                  
                  <td class="project-state">
                    {{barter['tambahan']}} 
                </td>


                <td class="project-state">
                  {{barter['barterstatus']}} 
              </td>
                   <td class="project-actions text-right">
                      <a class="btn btn-info btn-sm" href="/dashboard/barter/info/?id={{barter['id']}}">
                          Lihat Proses
                      </a>
                      {% if barter['barterstatus'] == "dalam proses"%}
                      <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal{{barter['idbarter']}}">Kirim Barang</button>
                      <div class="modal fade" id="myModal{{barter['idbarter']}}" role="dialog">
                        <div class="modal-dialog"> 
                            <div class="modal-content">
                          <div class="card card-primary">
                        <div class="card-header">
                          <h3 class="card-title">Konfirmasi Pengiriman</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form role="form" action="/dashboard/barter/kirim" method="post" enctype="multipart/form-data" >
                          <div class="card-body">
                            <div class="form-group">
                              <label for="nama">Nomor Resi</label>
                              <input type="text" name="noresi" class="form-control" id="exampleInputEmail1" placeholder="noresi">

                            </div> <div class="form-group">
                              <input type="hidden" name="status" class="form-control" id="exampleInputEmail1" placeholder="noresi" value="Telah Dikirim">
                            </div>
          
                          </div> <div class="form-group">
                            <input type="hidden" name="idbarter" class="form-control" id="exampleInputEmail1" placeholder="noresi" value="{{barter['idbarter']}}">
                          </div>
        
                           
                           
          
                            <div class="form-group">
                              <label for="foto">Bukti Transfer (Tukar Tambah)</label>
                              <div class="input-group">
                                <div class="custom-file">
                                  <input type="file" name="buktitransfer" class="custom-file-input" id="exampleInputFile">
                                  <label class="custom-file-label" for="exampleInputFile"> </label>
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
                      {% endif %}
                  </td>
               

              </tr>

          {% endfor %}
          </tbody>
          </table>

          
        </div>
        <!-- /.card-body -->
      </div>



      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>



{% endblock %}