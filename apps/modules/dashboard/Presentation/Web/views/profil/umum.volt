
{% extends "template.volt" %}

{% block title %}Index{% endblock %}

{% block content %}


<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Profile</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">User Profile</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
            


                <a href="/dashboard/tawaran" class="btn btn-primary btn-block"><b>Kembali</b></a>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- About Me Box -->
       
            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
           <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="data:image/png;base64,{{detailuser['foto']}}"
                       alt="User profile picture">
                </div>

                <h3 class="profile-username text-center">{{detailuser['namalengkap']}}</h3>

                <p class="text-muted text-center">{{detailuser['username']}}</p>

           




                <strong><i class="fas fa-book mr-1"></i> Nomor Hp</strong>

                <p class="text-muted">{{detailuser['nohp']}}
                </p>

                <hr>

                <strong><i class="fas fa-map-marker-alt mr-1"></i> Alamat</strong>

                <p class="text-muted">{{detailuser['alamat']}}</p>

                <hr>

                <strong><i class="far fa-file-alt mr-1"></i> Kodepos</strong>

                <p class="text-muted">{{detailuser['kodepos']}}</p>

                <strong><i class="far fa-file-alt mr-1"></i> Nomor Rekening</strong>

                <p class="text-muted">{{detailuser['norek']}}</p>

                <strong><i class="far fa-file-alt mr-1"></i> Bank</strong>

                <p class="text-muted">{{detailuser['bank']}}</p>





                <a href="/dashboard/inbox/tulis/?kepada={{detailuser['username']}}" class="btn btn-primary btn-block"><b>Kirim Pesan</b></a>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.nav-tabs-custom -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

  {% endblock %}