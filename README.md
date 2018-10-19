# Studia

## Configurações do BD
As configurações para acesso ao MySQL estão definidas no arquivo 
```
/src/main/resources/mysql-username.properties
```

Caso seja necessário modificar as configurações do banco de dados crie o arquivo: 
```
/src/main/resources/mysql-override.properties
```

## Configurações de Email
Para o site enviar emails é necessário criar o arquivo:
```
/src/main/resources/mail-username.properties
```

Este arquivo necessita a seguinte configuração:
```
smtp.mail=ENDEREÇO_DE_UMA_CONTA_GMAIL
smtp.password=SENHA_DA_CONTA_GMAIL
```

A conta Gmail deve permitir acesso a aplicativos com "menor segurança":  
https://myaccount.google.com/lesssecureapps
