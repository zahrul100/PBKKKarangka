

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <h1>Selamat Datang </h1>
    List Pengguna :
    {% for user in users %}
    <br>-
    {{ user.username}}
    {% endfor %}

        
</body>
</html>