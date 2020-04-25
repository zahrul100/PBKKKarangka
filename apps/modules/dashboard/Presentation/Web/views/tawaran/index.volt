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
                          IDBarter
                      </th>
                      <th >
                          Penawar
                      </th>
                      <th >
                         Barang Ditawar
                      </th>
                      <th>
                         Barang Ditawarkan
                      </th>
                      <th>
                         Tambahan Nominal (Rp.)
                      </th>
                      <th  class="text-center">
                          Status
                      </th>
                      <th >
                      </th>
                  </tr>
              </thead>
              <tbody>
                {% for tawaran in tawarans %}
                <tr>
                  <td>
                      {{tawaran['id']}}
                  </td>
                  <td>
                      <a href="/dashboard/profil/umum/?username={{tawaran['usernamepenawar']}}">
                         {{tawaran['usernamepenawar']}}
                      </a>
                      <br/>
                      <small>
                          {{tawaran['date']}}
                      </small>
                  </td>
                  <td>
                      <ul class="list-inline">
                     <a href="/home/lihat/?id={{tawaran['idbarang']}}">  {{tawaran['nama']}} </a>
                      </ul>
                  </td>
                  <td class="project_progress">                     
                    <a href="/home/lihat/?id={{tawaran['idbarangtawaran']}}">  {{tawaran['namabarang']}} </a>
                  </td>
                  <td class="project-state">
                    {{tawaran['tambahan']}}
                  </td>

                  <td class="project-state">
                    {{tawaran['status']}}
                </td>
                {% if tawaran['status'] == "Belum Ditanggapi" or tawaran['status'] == "Menunggu Konfirmasi Perubahan"%}
                  <td class="project-actions text-right">
                      <a class="btn btn-primary btn-sm" href="/dashboard/tawaran/deal/{{tawaran['id']}}">
                          Deal
                      </a>

                      <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">Tambah Nominal</button>
                      <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog"> 
                            <div class="modal-content">
                          <div class="card card-primary">
                        <div class="card-header">
                          <h3 class="card-title">Upload</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form role="form" action="/dashboard/tawaran/edit" method="post" enctype="multipart/form-data" >
                          <div class="card-body">

                            <div class="form-group">
                              <label >Ajukan Nominal Tambahan</label>
                              <input type="number" name="tambahan" class="form-control" id="exampleInputEmail1" placeholder="Rp.">
                            </div>
                            <div class="form-group">
                              <input type="hidden" name="usernamepemilik" class="form-control" id="exampleInputEmail1" placeholder="Rp." value="{{tawaran['usernamepenawar']}}">
                            </div>

                            <div class="form-group">
                              <input type="hidden" name="usernamepenawar" class="form-control" id="exampleInputEmail1" placeholder="Rp." value="{{tawaran['usernamepemilik']}}">
                            </div>


                            <div class="form-group">
                              <input type="hidden" name="idbarang" class="form-control" id="exampleInputEmail1" placeholder="Rp." value="{{tawaran['idbarang']}}">
                            </div>

                            <div class="form-group">
                              <input type="hidden" name="idbarangtawaran" class="form-control" id="exampleInputEmail1" placeholder="Rp." value="{{tawaran['idbarangtawaran']}}">
                            </div>

                            <div class="form-group">
                              <input type="hidden" name="id" class="form-control" id="exampleInputEmail1" placeholder="Rp." value="{{tawaran['id']}}">
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
                      <a class="btn btn-danger btn-sm" href="/dashboard/tawaran/tolak/{{tawaran['id']}}">
                          Tolak Tawaran
                      </a>
                  </td>
                  {% elseif tawaran['status'] == "Deal" %}
                  <td class="project-state">
                  <a class="btn btn-primary btn-sm" href="/dashboard/barter/info/?id={{tawaran['id']}}">
                    Selanjutnyaa
              
                  </a>
                  </td>
                  {% endif %}

              </tr>

          {% endfor %}
          </tbody>
          </table>

          
        </div>
        <!-- /.card-body -->
      </div>




      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Tawaran Terkirim</h3>

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
                          IDBarter
                      </th>
                      <th >
                          Penawar
                      </th>
                      <th >
                         Barang Ditawar
                      </th>
                      <th>
                         Barang Ditawarkan
                      </th>
                      <th>
                         Tambahan Nominal (Rp.)
                      </th>
                      <th  class="text-center">
                          Status
                      </th>
                      <th >
                      </th>
                  </tr>
              </thead>
              <tbody>
                {% for tawaran in tawarkans %}
                <tr>
                  <td>
                      {{tawaran['id']}}
                  </td>
                  <td>
                      <a>
                         {{tawaran['usernamepenawar']}}
                      </a>
                      <br/>
                      <small>
                          {{tawaran['date']}}
                      </small>
                  </td>
                  <td>
                      <ul class="list-inline">
                     <a href="/home/lihat/?id={{tawaran['idbarang']}}">  {{tawaran['nama']}} </a>
                      </ul>
                  </td>
                  <td class="project_progress">                     
                    <a href="/home/lihat/?id={{tawaran['idbarangtawaran']}}">  {{tawaran['namabarang']}} </a>
                  </td>
                  <td class="project-state">
                    {{tawaran['tambahan']}}
                  </td>

                  <td class="project-state">
                    {{tawaran['status']}}
                </td>
                {% if tawaran['status'] == "Deal" %}
                <td class="project-state">
                <a class="btn btn-primary btn-sm" href="/dashboard/barter/info/?id={{tawaran['id']}}">
                  Selanjutnya
            
                </a>
                </td>
                {% endif %}

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