{% extends "template.volt" %}

{% block title %}Index{% endblock %}

{% block content %}


<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Progres</h1>
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

      {% for barter in barters %}
      <div class="card">
        <div class="card-header">
          <h3 class="card-title"><h2>{{barter['username']}}</h2> </h3>

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
                      Nama Barang
                    </th>


                    <th >
                      No Resi
                    </th>
                    <th >
                      Bukti Transfer
                    </th>
                    <th >
                      Status
                    </th>


                    <th >
                      Last Update
                    </th>
                </tr>
            </thead>
            <tbody>
              <tr>
                <td>{{barter['id']}}
                  <br/>
                  <small>
                  </small>
              </td>

                <td>

                  {{barter['namabarang']}}
                </td>
                <td>
                  {% if barter['noresi'] == "" %}
                  Belum Terbit
                  {% else %}
                  {{barter['noresi']}}
                  {% endif %}
                </td>
                <td>
                    <ul class="list-inline">
                      {% if barter['buktitransfer'] == "" %}
                      Kosong
                      {% else %}
                      <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal{{barter['id']}}">Bukti Transfer</button>
                      <div class="modal fade" id="myModal{{barter['id']}}" role="dialog">
                        <div class="modal-dialog"> 
                            <div class="modal-content">
                         <a href="data:image/png;base64,{{barter['buktitransfer']}}"><img src="data:image/png;base64,{{barter['buktitransfer']}}" alt="" width="600px"></a> 
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                       
                      </div> 
                      </div>
                      {% endif %}
                    </ul>
                </td>
                <td class="project_progress"> 
                  {{barter['status']}}
                </td>
                <td class="project_progress"> 
                  {{barter['date']}}
                </td>

                {% if barter['status'] == "Telah Dikirim" and barter['username'] != session.get('user-name')%}

                <td class="project_progress"> 
                  <a href="/dashboard/barter/terima/?idbarter={{barter['id']}}"><button class="btn btn-primary btn-sm" onclick="return validateDialog();"> Terima Barang</button></a>
                 
                  
                </td>
                {% elseif barter['username'] == session.get('user-name') AND barter['status'] != 'Telah Dikirim' AND barter['status'] != 'Barang Diterima' %}
                <td class="project_progress"> 
                  <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModala{{barter['id']}}">Kirim Barang</button>
                      <div class="modal fade" id="myModala{{barter['id']}}" role="dialog">
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
                              <input type="text" name="noresi" class="form-control" id="exampleInputEmail1" placeholder="noresi" required>

                            </div> <div class="form-group">
                              <input type="hidden" name="status" class="form-control" id="exampleInputEmail1" placeholder="noresi" value="Telah Dikirim">
                            </div>
          
                          </div> <div class="form-group">
                            <input type="hidden" name="idbarter" class="form-control" id="exampleInputEmail1" placeholder="noresi" value="{{barter['id']}}" >
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
                </td>
                {% endif %}
             

            </tr>

        </tbody>
        </table>
        </div>
        <!-- /.card-body -->
      </div>
      {% endfor %}



      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>



{% endblock %}