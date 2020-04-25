{%if message is defined %}
{{message}}
{% endif %}


    	{{ form.startForm() }}
		<label for="username">Username</label>
		{{ form.rendering('username') }}

		<label for="email">Email</label>
		{{ form.rendering('email') }}

		<label for="password">Password</label>
		{{ form.rendering('password') }}

		{{ form.rendering('Register') }}
	{{ form.endForm() }}
