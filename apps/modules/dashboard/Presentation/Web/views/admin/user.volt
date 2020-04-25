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
                          Username
                      </th>
                      <th >
                        Nama 
                      </th>
                      <th>Email
                      </th>
                      <th >
                        Banned
                      </th>
                      <th >
                      </th>
                  </tr>
              </thead>
              <tbody>
                {% for user in users %}
                <tr>
                  <td>
                      {{user['id']}}
                  </td>
                  <td>
                      <a href="/dashboard/profil/umum/?username={{user['username']}}">
                         {{user['username']}}
                      </a>
                      <br/>
                      <small>
                      </small>
                  </td>
                  <td>
                      <ul class="list-inline">
                   {{user['nama']}}
                      </ul>
                  </td>
                  <td class="project_progress">                     {{user['email']}} 
                  </td>
                  
                  <td class="project-state">
                    {{user['banned']}} 
                </td>
                   <td class="project-actions text-right">
                    <a class="btn btn-primary btn-sm" href="/dashboard/inbox/tulis/?kepada={{user['username']}}">
                      Kirim Pesan
                  </a>

                      <a class="btn btn-primary btn-sm" href="/dashboard/admin/unbanned/{{user['id']}}">
                          Aktifkan
                      </a>
                      
                      <a class="btn btn-danger btn-sm" href="/dashboard/admin/banned/{{user['id']}}">
                          Banned
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