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
      <div class="row">
        <div class="col-md-3">
          <a href="/dashboard/inbox/tulis/" class="btn btn-primary btn-block mb-3">Compose</a>

          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Folders</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body p-0">
              <ul class="nav nav-pills flex-column">
                <li class="nav-item active">
                  <a href="/dashboard/inbox/" class="nav-link">
                    <i class="fas fa-inbox"></i> Inbox
                    <span class="badge bg-primary float-right">12</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="/dashboard/inbox/terkirim" class="nav-link">
                    <i class="far fa-envelope"></i> Sent
                  </a>
                </li>
               
              </ul>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
         
          <!-- /.card -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
            <div class="card card-primary card-outline">
              <div class="card-header">
                <h3 class="card-title">Compose New Message</h3>
              </div>
                <form action="/dashboard/inbox/kirim/" method="POST">
              <!-- /.card-header -->
              <div class="card-body">
                <div class="form-group">
                  <input name="usernamepenerima" class="form-control" placeholder="To:" value="{{kepada}}">
               
                </div>
                <div class="form-group">
                  <input name="judul" class="form-control" placeholder="Subject:">
                </div>


                <div class="form-group">
                    <input type="hidden" name="usernamepengirim" class="form-control" placeholder="Subject:" value="{{session.get('user-name')}}">
                  </div>

                <div class="form-group">
                    <textarea name="pesan" id="compose-textarea" class="form-control" style="height: 300px">
                   
                    </textarea>
                </div>
        
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
                <div class="float-right">
                  <button type="submit" class="btn btn-primary"><i class="far fa-envelope"></i> Send</button>
                </div>
                </form>

                <a href="/dashboard/inbox/"><button type="reset" class="btn btn-default"><i class="fas fa-times"></i> Discard</button></a>
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>



  {% endblock %}