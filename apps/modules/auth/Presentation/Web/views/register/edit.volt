<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
</head>

<body>
    <form action="/auth/upload/editpost" method="post" enctype="multipart/form-data">
            
        Nama Barang      <br/> <input type="text" name="nama" required="required" value="{{barang.nama}}">           <br/>
        kategori         <br/>   <input type="text" name="kategori"  value="{{barang.kategori}}">                    <br/>
        keterangan       <br/>  <textarea cols="40" rows="5"  name="keterangan"> {{barang.keterangan}}</textarea>    <br/>
        Foto             <br/>
        <img src="data:image/png;base64,{{barang.foto}}" alt="" height="300"><br>
        Upload            <input type="file" name="foto"> <br/>

        <input type="hidden" name="id" required="required" value="{{id}}"> <br/>
        
    
        <input type="submit" value="Simpan Data">
        
    </form>
</body>
</html>