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
              <h3 class="card-title">Read Mail</h3>

              <div class="card-tools">
                <a href="#" class="btn btn-tool" data-toggle="tooltip" title="Previous"><i class="fas fa-chevron-left"></i></a>
                <a href="#" class="btn btn-tool" data-toggle="tooltip" title="Next"><i class="fas fa-chevron-right"></i></a>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
              <div class="mailbox-read-info">
                <h5>{{pesan['judul']}}</h5>
                <h6>From: {{pesan['usernamepengirim']}}
                  <span class="mailbox-read-time float-right">{{pesan['time']}}</span></h6>
              </div>
              <!-- /.mailbox-read-info -->
              <div class="mailbox-controls with-border text-center">
             
              </div>
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
                <p>{{pesan['pesan']}}</p>

            
              </div>
              <!-- /.mailbox-read-message -->
            </div>
            <!-- /.card-body -->
     
            <!-- /.card-footer -->
            <div class="card-footer">
              <div class="float-right">
               <a href="/dashboard/inbox/tulis/?kepada={{pesan['usernamepengirim']}}"> <button type="button"  class="btn btn-default"><i class="fas fa-reply"></i> Reply</button></a>
              </div>
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