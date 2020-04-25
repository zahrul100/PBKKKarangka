{% extends "template.volt" %}

{% block title %}Index{% endblock %}

{% block content %}


<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>List Barang</h1>
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
          <h3 class="card-title">Barang</h3>

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
                      <th>Kategori
                      </th>
                      <th >
                        Target Tukar
                      </th>
                      <th >
                        Pemilik
                      </th>
                      <th >
                        Blokir
                      </th>
                  </tr>
              </thead>
              <tbody>
                {% for barang in barangs %}
                <tr>
                  <td>
                      {{barang['id']}}
                  </td>
                  <td>
                      <a href="/home/lihat/?id={{barang['id']}}">
                         {{barang['nama']}}
                      </a>
                      <br/>
                      <small>
                      </small>
                  </td>
                  <td>
                      <ul class="list-inline">
                   {{barang['kategori']}}
                      </ul>
                  </td>
                  <td class="project_progress">                     {{barang['target_tukar']}} 
                  </td>


                  <td class="project_progress">        
                    {{barang['username']}} 
                  </td>
                  <td class="project_progress">        
                    {{barang['blokir']}} 
                  </td>
                  
                  <td class="project-state">
                </td>
                   <td class="project-actions text-right">
                      <a class="btn btn-primary btn-sm" href="/dashboard/admin/unblokir/{{barang['id']}}">
                          unblokir
                      </a>

                      <a class="btn btn-danger btn-sm" href="/dashboard/admin/blokir/{{barang['id']}}">
                          blokir
                      </a>
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