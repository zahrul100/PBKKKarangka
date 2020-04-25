<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    {{userid}}
    <form action="/dashboard/upload/upload" method="post" enctype="multipart/form-data">
            
        Nama Barang     <input type="text" name="nama" required="required"> <br/>
        kategori        <input type="text" name="kategori" required="required"> <br/>
        keterangan      <input type="text" name="keterangan" required="required"> <br/>
        foto            <input type="file" name="foto" required="required"> <br/>

        <input type="hidden" name="idpemilik" required="required" value="{{userid}}"> <br/>
        
    
        <input type="submit" value="Simpan Data">
        
    </form>

    
</body>
</html>