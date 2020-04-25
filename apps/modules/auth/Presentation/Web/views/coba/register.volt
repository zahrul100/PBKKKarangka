{%if message is defined %}
{{message}}
{% endif %}

<form action="/auth/register" method="post">
            
    Username <input type="text" name="username" required="required"> <br/>
    Password <input type="password" name="password" required="required"> <br/>
    Email <input type="text" name="email" required="required"> <br/>
    <input type='hidden' name='<?php echo $this->security->getTokenKey() ?>'
    value='<?php echo $this->security->getToken() ?>'/>
    
    <input type="submit" value="Simpan Data">
    
</form>